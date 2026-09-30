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
 * 打包为 zip，通过系统文件选择器（SAF）保存到用户指定的位置，卸载重装后不丢。
 * 还原：选择备份 zip，覆盖当前数据后自动重启桌面进程使其生效。
 */
public class LauncherBackupRestore {

    public static final int REQUEST_BACKUP = 5111;
    public static final int REQUEST_RESTORE = 5112;

    private static final String DIR_PREFS = "shared_prefs";
    private static final String DIR_DB = "databases";
    private static final long RESTART_DELAY_MS = 1500L;

    public static void startBackup(Activity activity) {
        try {
            Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("application/zip");
            String ts = new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US).format(new Date());
            intent.putExtra(Intent.EXTRA_TITLE, "smartisan-launcher-backup-" + ts + ".zip");
            activity.startActivityForResult(intent, REQUEST_BACKUP);
        } catch (ActivityNotFoundException e) {
            toast(activity, "未找到系统文件选择器");
        } catch (Throwable t) {
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
                                toast(activity, getString(activity, "backup_restore_failed", "操作失败"));
                            }
                        }
                    })
                    .setNegativeButton(android.R.string.cancel, null)
                    .show();
        } catch (Throwable t) {
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
        if (resultCode != Activity.RESULT_OK || data == null || data.getData() == null) {
            return true; // 用户取消，静默返回
        }
        final Uri uri = data.getData();
        toast(activity, getString(activity, "backup_restore_working", "正在处理…"));
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    if (backup) {
                        doBackup(activity, uri);
                        postToast(activity, getString(activity, "backup_restore_backup_done", "备份完成"));
                    } else {
                        doRestore(activity, uri);
                        postToast(activity, getString(activity, "backup_restore_restore_done", "还原完成，正在重启桌面…"));
                        scheduleRestart(activity);
                    }
                } catch (Throwable t) {
                    postToast(activity, getString(activity, "backup_restore_failed", "操作失败"));
                }
            }
        }, "launcher-backup-restore").start();
        return true;
    }

    // ---------- 备份 ----------

    private static void doBackup(Activity activity, Uri dest) throws IOException {
        Context c = activity.getApplicationContext();
        File dataDir = c.getFilesDir().getParentFile();
        int count = 0;
        OutputStream os = c.getContentResolver().openOutputStream(dest);
        if (os == null) throw new IOException("openOutputStream failed");
        ZipOutputStream zos = new ZipOutputStream(new BufferedOutputStream(os, 1 << 16));
        try {
            count += zipDir(zos, new File(dataDir, DIR_PREFS), DIR_PREFS);
            count += zipDir(zos, new File(dataDir, DIR_DB), DIR_DB);
        } finally {
            try {
                zos.close();
            } catch (IOException ignored) {
            }
        }
        if (count == 0) {
            throw new IOException("no data backed up");
        }
    }

    private static int zipDir(ZipOutputStream zos, File dir, String entryPrefix) throws IOException {
        File[] files = dir.listFiles();
        if (files == null) return 0;
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
        File dataDir = c.getFilesDir().getParentFile();
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
            throw new IOException("invalid backup file");
        }
        applyStaged(staging, new File(dataDir, DIR_PREFS));
        applyStaged(staging, new File(dataDir, DIR_DB));
        deleteRecursively(staging);
        return count;
    }

    private static void applyStaged(File stagingDir, File targetDir) {
        File sub = new File(stagingDir, targetDir.getName());
        File[] files = sub.listFiles();
        if (files == null || files.length == 0) return;
        if (!targetDir.isDirectory() && !targetDir.mkdirs()) return;
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
        } catch (IOException ignored) {
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
