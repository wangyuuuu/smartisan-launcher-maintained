package com.smartisanos.home.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.provider.DocumentsContract;
import android.util.Log;
import android.widget.Toast;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

/**
 * 桌面数据备份与还原。
 * 备份：把应用私有目录下的 shared_prefs/ 与 databases/（全部设置项 + 桌面布局/排列）
 * 打包为 zip。先写入本地临时文件并校验，再拷贝到 SAF 目标位置，避免留下空文件；
 * 失败时删除半成品文档。全程 Log.e 记录，便于 adb logcat 排障。
 * 还原：选择备份 zip，覆盖当前数据后自动重启桌面进程使其生效。
 */
public class LauncherBackupRestore {

    private static final String TAG = "LauncherBackup";

    public static final int REQUEST_BACKUP = 5111;
    public static final int REQUEST_RESTORE = 5112;

    private static final String DIR_PREFS = "shared_prefs";
    private static final String DIR_DB = "databases";
    private static final long RESTART_DELAY_MS = 1500L;

    public static void startBackup(Activity activity) {
        try {
            Log.i(TAG, "startBackup");
            Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("application/zip");
            String ts = new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US).format(new Date());
            intent.putExtra(Intent.EXTRA_TITLE, "smartisan-launcher-backup-" + ts + ".zip");
            activity.startActivityForResult(intent, REQUEST_BACKUP);
        } catch (ActivityNotFoundException e) {
            toast(activity, "未找到系统文件选择器");
        } catch (Throwable t) {
            Log.e(TAG, "startBackup failed", t);
            toast(activity, getString(activity, "backup_restore_failed", "操作失败"));
        }
    }

    public static void startRestore(final Activity activity) {
        try {
            new AlertDialog.Builder(activity)
                    .setTitle(getString(activity, "backup_restore_restore_title", "还原桌面数据"))
                    .setMessage(getString(activity, "backup_restore_restore_confirm",
                            "将用备份文件覆盖当前所有设置和桌面布局，完成后桌面会自动重启。确定继续？"))
                    .setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            try {
                                Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
                                intent.addCategory(Intent.CATEGORY_OPENABLE);
                                intent.setType("application/zip");
                                activity.startActivityForResult(intent, REQUEST_RESTORE);
                            } catch (Throwable t) {
                                Log.e(TAG, "startRestore picker failed", t);
                                toast(activity, getString(activity, "backup_restore_failed", "操作失败"));
                            }
                        }
                    })
                    .setNegativeButton(android.R.string.cancel, null)
                    .show();
        } catch (Throwable t) {
            Log.e(TAG, "startRestore dialog failed", t);
            toast(activity, getString(activity, "backup_restore_failed", "操作失败"));
        }
    }

    /**
     * 在 SettingMainActivity.onActivityResult 最先调用。
     * @return true 表示该结果已被本功能消费，调用方应立即 return。
     */
    public static boolean handleActivityResult(final Activity activity, int requestCode, int resultCode, Intent data) {
        final boolean backup = requestCode == REQUEST_BACKUP;
        if (!backup && requestCode != REQUEST_RESTORE) {
            return false;
        }
        Log.i(TAG, "handleActivityResult req=" + requestCode + " result=" + resultCode);
        if (resultCode != Activity.RESULT_OK || data == null || data.getData() == null) {
            return true; // 用户取消，静默返回
        }
        final Uri uri = data.getData();
        Log.i(TAG, "uri=" + uri);
        toast(activity, getString(activity, "backup_restore_working", "正在处理…"));
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    if (backup) {
                        doBackup(activity, uri);
                        Log.i(TAG, "backup done");
                        postToast(activity, getString(activity, "backup_restore_backup_done", "备份完成"));
                    } else {
                        doRestore(activity, uri);
                        Log.i(TAG, "restore done, restarting");
                        postToast(activity, getString(activity, "backup_restore_restore_done", "还原完成，正在重启桌面…"));
                        scheduleRestart(activity);
                    }
                } catch (Throwable t) {
                    Log.e(TAG, (backup ? "backup" : "restore") + " failed", t);
                    if (backup) {
                        deleteDocumentQuietly(activity.getApplicationContext(), uri);
                    }
                    postToast(activity, getString(activity, "backup_restore_failed", "操作失败"));
                }
            }
        }, "launcher-backup-restore").start();
        return true;
    }

    // ---------- 备份 ----------

    private static void doBackup(Activity activity, Uri dest) throws IOException {
        Context c = activity.getApplicationContext();
        // 1) 先打包到本地临时文件
        File tmp = new File(c.getCacheDir(), "launcher_backup_tmp.zip");
        tmp.delete();
        int count;
        ZipOutputStream zos = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(tmp), 1 << 16));
        try {
            int dbCount = zipDir(zos, resolveDir(c, DIR_DB), DIR_DB);
            int prefCount = zipDir(zos, resolveDir(c, DIR_PREFS), DIR_PREFS);
            count = dbCount + prefCount;
            Log.i(TAG, "zipped files: databases=" + dbCount + " shared_prefs=" + prefCount);
        } finally {
            try {
                zos.close();
            } catch (IOException e) {
                Log.e(TAG, "close tmp zip", e);
            }
        }
        if (count == 0 || tmp.length() == 0) {
            long len = tmp.length();
            tmp.delete();
            throw new IOException("no data backed up (count=" + count + ", tmpLen=" + len + ")");
        }
        Log.i(TAG, "tmp zip size=" + tmp.length());
        // 2) 校验通过后拷贝到 SAF 目标
        OutputStream os = null;
        try {
            os = c.getContentResolver().openOutputStream(dest);
            if (os == null) throw new IOException("openOutputStream returned null");
            InputStream in = new BufferedInputStream(new FileInputStream(tmp), 1 << 16);
            try {
                byte[] buf = new byte[1 << 16];
                int r;
                while ((r = in.read(buf)) != -1) {
                    os.write(buf, 0, r);
                }
                os.flush();
            } finally {
                in.close();
            }
            Log.i(TAG, "copied to saf target");
        } catch (IOException e) {
            throw e;
        } finally {
            if (os != null) {
                try {
                    os.close();
                } catch (IOException ignored) {
                }
            }
            tmp.delete();
        }
    }

    /**
     * 解析数据目录：优先 ApplicationInfo.dataDir（权威），回退 filesDir 父目录，
     * databases 再回退 getDatabasePath 的父目录。全部未命中时打日志并返回第一个候选。
     */
    private static File resolveDir(Context c, String name) {
        File f1 = new File(c.getApplicationInfo().dataDir, name);
        if (f1.isDirectory()) return f1;
        File parent = c.getFilesDir().getParentFile();
        File f2 = parent != null ? new File(parent, name) : null;
        if (f2 != null && f2.isDirectory()) return f2;
        if (DIR_DB.equals(name)) {
            File db = c.getDatabasePath("probe.db");
            File f3 = db.getParentFile();
            if (f3 != null && f3.isDirectory()) return f3;
        }
        Log.e(TAG, "resolveDir: '" + name + "' not found. tried: " + f1 + ", " + f2);
        return f1;
    }

    private static int zipDir(ZipOutputStream zos, File dir, String entryPrefix) throws IOException {
        File[] files = dir.listFiles();
        if (files == null) {
            Log.e(TAG, "zipDir: listFiles null for " + dir);
            return 0;
        }
        int count = 0;
        byte[] buf = new byte[1 << 16];
        for (int i = 0; i < files.length; i++) {
            File f = files[i];
            if (f.isDirectory()) continue;
            ZipEntry entry = new ZipEntry(entryPrefix + "/" + f.getName());
            entry.setTime(f.lastModified());
            zos.putNextEntry(entry);
            InputStream in = new BufferedInputStream(new FileInputStream(f), 1 << 16);
            try {
                int r;
                while ((r = in.read(buf)) != -1) {
                    zos.write(buf, 0, r);
                }
            } finally {
                in.close();
            }
            zos.closeEntry();
            count++;
        }
        return count;
    }

    // ---------- 还原 ----------

    /**
     * @return 还原的文件数
     */
    private static int doRestore(Activity activity, Uri source) throws IOException {
        Context c = activity.getApplicationContext();
        File dataDir = new File(c.getApplicationInfo().dataDir);
        File staging = new File(c.getCacheDir(), "launcher_restore_staging");
        deleteRecursively(staging);
        if (!staging.mkdirs() && !staging.isDirectory()) {
            throw new IOException("staging mkdir failed");
        }
        int count = 0;
        InputStream is = c.getContentResolver().openInputStream(source);
        if (is == null) throw new IOException("openInputStream failed");
        ZipInputStream zin = new ZipInputStream(new BufferedInputStream(is, 1 << 16));
        byte[] buf = new byte[1 << 16];
        try {
            ZipEntry entry;
            while ((entry = zin.getNextEntry()) != null) {
                if (entry.isDirectory()) continue;
                String name = entry.getName();
                if (name == null || name.contains("..") || name.contains("/../")) continue;
                if (!name.startsWith(DIR_PREFS + "/") && !name.startsWith(DIR_DB + "/")) continue;
                if (name.indexOf('/', name.indexOf('/') + 1) != -1) continue; // 只接受 "目录/文件名" 一层
                File out = new File(staging, name);
                File parent = out.getParentFile();
                if (parent == null || (!parent.isDirectory() && !parent.mkdirs())) continue;
                OutputStream fos = new BufferedOutputStream(new FileOutputStream(out), 1 << 16);
                try {
                    int r;
                    while ((r = zin.read(buf)) != -1) {
                        fos.write(buf, 0, r);
                    }
                } finally {
                    fos.close();
                }
                count++;
            }
        } finally {
            try {
                zin.close();
            } catch (IOException ignored) {
            }
        }
        if (count == 0) {
            deleteRecursively(staging);
            throw new IOException("invalid backup file (0 entries)");
        }
        Log.i(TAG, "staged " + count + " files, applying");
        applyStaged(staging, resolveDir(c, DIR_PREFS));
        applyStaged(staging, resolveDir(c, DIR_DB));
        deleteRecursively(staging);
        return count;
    }

    private static void applyStaged(File stagingDir, File targetDir) {
        File sub = new File(stagingDir, targetDir.getName());
        File[] files = sub.listFiles();
        if (files == null || files.length == 0) return;
        if (!targetDir.isDirectory() && !targetDir.mkdirs()) {
            Log.e(TAG, "applyStaged: mkdir failed " + targetDir);
            return;
        }
        for (int i = 0; i < files.length; i++) {
            File src = files[i];
            File dst = new File(targetDir, src.getName());
            if (src.getName().endsWith(".db")) {
                // 数据库文件：先清掉配套 WAL/SHM，避免旧 WAL 污染还原后的库
                new File(targetDir, src.getName() + "-wal").delete();
                new File(targetDir, src.getName() + "-shm").delete();
            }
            dst.delete();
            if (!src.renameTo(dst)) {
                copyFile(src, dst);
                src.delete();
            }
        }
    }

    private static void copyFile(File src, File dst) {
        try {
            InputStream in = new BufferedInputStream(new FileInputStream(src), 1 << 16);
            try {
                OutputStream out = new BufferedOutputStream(new FileOutputStream(dst), 1 << 16);
                try {
                    byte[] buf = new byte[1 << 16];
                    int r;
                    while ((r = in.read(buf)) != -1) {
                        out.write(buf, 0, r);
                    }
                } finally {
                    out.close();
                }
            } finally {
                in.close();
            }
        } catch (IOException e) {
            Log.e(TAG, "copyFile failed " + src + " -> " + dst, e);
        }
    }

    // ---------- 重启桌面 ----------

    private static void scheduleRestart(final Activity activity) {
        Handler handler = new Handler(Looper.getMainLooper());
        handler.postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    activity.finish();
                } catch (Throwable ignored) {
                }
                new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        Process.killProcess(Process.myPid());
                    }
                }, 400L);
            }
        }, RESTART_DELAY_MS);
    }

    // ---------- 工具 ----------

    private static void deleteDocumentQuietly(Context c, Uri uri) {
        try {
            DocumentsContract.deleteDocument(c.getContentResolver(), uri);
            Log.i(TAG, "deleted incomplete document: " + uri);
        } catch (Throwable t) {
            Log.e(TAG, "deleteDocument failed", t);
        }
    }

    private static void deleteRecursively(File f) {
        if (f == null || !f.exists()) return;
        File[] children = f.listFiles();
        if (children != null) {
            for (int i = 0; i < children.length; i++) {
                deleteRecursively(children[i]);
            }
        }
        f.delete();
    }

    private static String getString(Activity activity, String name, String fallback) {
        try {
            int id = activity.getResources().getIdentifier(name, "string", activity.getPackageName());
            if (id != 0) {
                return activity.getString(id);
            }
        } catch (Throwable ignored) {
        }
        return fallback;
    }

    private static void toast(Activity activity, String msg) {
        try {
            Toast.makeText(activity, msg, Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
        }
    }

    private static void postToast(final Activity activity, final String msg) {
        try {
            if (activity.isFinishing()) {
                Toast.makeText(activity.getApplicationContext(), msg, Toast.LENGTH_LONG).show();
                return;
            }
            activity.runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    try {
                        Toast.makeText(activity, msg, Toast.LENGTH_LONG).show();
                    } catch (Throwable ignored) {
                    }
                }
            });
        } catch (Throwable ignored) {
        }
    }
}
