.class public Lcom/smartisanos/home/settings/LauncherBackupRestore;
.super Ljava/lang/Object;
.source "LauncherBackupRestore.java"


# static fields
.field private static final DIR_DB:Ljava/lang/String; = "databases"

.field private static final DIR_PREFS:Ljava/lang/String; = "shared_prefs"

.field public static final REQUEST_BACKUP:I = 0x13f7

.field public static final REQUEST_RESTORE:I = 0x13f8

.field private static final RESTART_DELAY_MS:J = 0x5dcL


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 36
    invoke-static {p0, p1, p2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->getString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 2

    .line 36
    invoke-static {p0, p1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Landroid/app/Activity;Landroid/net/Uri;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 36
    invoke-static {p0, p1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->doBackup(Landroid/app/Activity;Landroid/net/Uri;)V

    return-void
.end method

.method static synthetic access$300(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 2

    .line 36
    invoke-static {p0, p1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->postToast(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Landroid/app/Activity;Landroid/net/Uri;)I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 36
    invoke-static {p0, p1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->doRestore(Landroid/app/Activity;Landroid/net/Uri;)I

    move-result p0

    return p0
.end method

.method static synthetic access$500(Landroid/app/Activity;)V
    .registers 1

    .line 36
    invoke-static {p0}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->scheduleRestart(Landroid/app/Activity;)V

    return-void
.end method

.method private static applyStaged(Ljava/io/File;Ljava/io/File;)V
    .registers 8

    .line 226
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 227
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_8c

    .line 228
    array-length v0, p0

    if-nez v0, :cond_14

    goto/16 :goto_8c

    .line 229
    :cond_14
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_21

    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_21

    return-void

    :cond_21
    const/4 v0, 0x0

    .line 230
    :goto_22
    array-length v1, p0

    if-ge v0, v1, :cond_8c

    .line 231
    aget-object v1, p0, v0

    .line 232
    new-instance v2, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 233
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, ".db"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7a

    .line 235
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "-wal"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, p1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 236
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "-shm"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, p1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 238
    :cond_7a
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 239
    invoke-virtual {v1, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v3

    if-nez v3, :cond_89

    .line 240
    invoke-static {v1, v2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->copyFile(Ljava/io/File;Ljava/io/File;)V

    .line 241
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_89
    add-int/lit8 v0, v0, 0x1

    goto :goto_22

    :cond_8c
    :goto_8c
    return-void
.end method

.method private static copyFile(Ljava/io/File;Ljava/io/File;)V
    .registers 5

    .line 248
    :try_start_0
    new-instance v0, Ljava/io/BufferedInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/high16 p0, 0x10000

    invoke-direct {v0, v1, p0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_c} :catch_35

    .line 250
    :try_start_c
    new-instance v1, Ljava/io/BufferedOutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2, p0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_16
    .catchall {:try_start_c .. :try_end_16} :catchall_30

    .line 252
    :try_start_16
    new-array p0, p0, [B

    .line 254
    :goto_18
    invoke-virtual {v0, p0}, Ljava/io/InputStream;->read([B)I

    move-result p1

    const/4 v2, -0x1

    if-eq p1, v2, :cond_24

    const/4 v2, 0x0

    .line 255
    invoke-virtual {v1, p0, v2, p1}, Ljava/io/OutputStream;->write([BII)V
    :try_end_23
    .catchall {:try_start_16 .. :try_end_23} :catchall_2b

    goto :goto_18

    .line 258
    :cond_24
    :try_start_24
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_27
    .catchall {:try_start_24 .. :try_end_27} :catchall_30

    .line 261
    :try_start_27
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2a
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_2a} :catch_35

    goto :goto_35

    :catchall_2b
    move-exception p0

    .line 258
    :try_start_2c
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 259
    throw p0
    :try_end_30
    .catchall {:try_start_2c .. :try_end_30} :catchall_30

    :catchall_30
    move-exception p0

    .line 261
    :try_start_31
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 262
    throw p0
    :try_end_35
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_35} :catch_35

    :catch_35
    :goto_35
    return-void
.end method

.method private static deleteRecursively(Ljava/io/File;)V
    .registers 4

    if-eqz p0, :cond_1e

    .line 291
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_9

    goto :goto_1e

    .line 292
    :cond_9
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_1b

    const/4 v1, 0x0

    .line 294
    :goto_10
    array-length v2, v0

    if-ge v1, v2, :cond_1b

    .line 295
    aget-object v2, v0, v1

    invoke-static {v2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->deleteRecursively(Ljava/io/File;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 298
    :cond_1b
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    :cond_1e
    :goto_1e
    return-void
.end method

.method private static doBackup(Landroid/app/Activity;Landroid/net/Uri;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 123
    const-string v0, "databases"

    const-string v1, "shared_prefs"

    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 124
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    .line 126
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object p0

    if-eqz p0, :cond_4e

    .line 128
    new-instance p1, Ljava/util/zip/ZipOutputStream;

    new-instance v3, Ljava/io/BufferedOutputStream;

    const/high16 v4, 0x10000

    invoke-direct {v3, p0, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    invoke-direct {p1, v3}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 130
    :try_start_26
    new-instance p0, Ljava/io/File;

    invoke-direct {p0, v2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {p1, p0, v1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->zipDir(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;)I

    move-result p0

    .line 131
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {p1, v1, v0}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->zipDir(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;)I

    move-result v0
    :try_end_38
    .catchall {:try_start_26 .. :try_end_38} :catchall_49

    add-int/2addr p0, v0

    .line 134
    :try_start_39
    invoke-virtual {p1}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_39 .. :try_end_3c} :catch_3d

    goto :goto_3e

    :catch_3d
    nop

    :goto_3e
    if-eqz p0, :cond_41

    return-void

    .line 139
    :cond_41
    new-instance p0, Ljava/io/IOException;

    const-string p1, "no data backed up"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_49
    move-exception p0

    .line 134
    :try_start_4a
    invoke-virtual {p1}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_4d
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_4d} :catch_4d

    .line 137
    :catch_4d
    throw p0

    .line 127
    :cond_4e
    new-instance p0, Ljava/io/IOException;

    const-string p1, "openOutputStream failed"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static doRestore(Landroid/app/Activity;Landroid/net/Uri;)I
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 175
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 176
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 177
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "launcher_restore_staging"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 178
    invoke-static {v1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->deleteRecursively(Ljava/io/File;)V

    .line 179
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-nez v2, :cond_2f

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_27

    goto :goto_2f

    .line 180
    :cond_27
    new-instance p0, Ljava/io/IOException;

    const-string p1, "staging mkdir failed"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 183
    :cond_2f
    :goto_2f
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p0

    if-eqz p0, :cond_f4

    .line 185
    new-instance p1, Ljava/util/zip/ZipInputStream;

    new-instance v2, Ljava/io/BufferedInputStream;

    const/high16 v3, 0x10000

    invoke-direct {v2, p0, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    invoke-direct {p1, v2}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 186
    new-array p0, v3, [B

    const/4 v2, 0x0

    const/4 v4, 0x0

    .line 189
    :cond_49
    :goto_49
    :try_start_49
    invoke-virtual {p1}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v5

    if-eqz v5, :cond_c5

    .line 190
    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_56

    goto :goto_49

    .line 191
    :cond_56
    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_49

    .line 192
    const-string v6, ".."

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_49

    const-string v6, "/../"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_6d

    goto :goto_49

    .line 193
    :cond_6d
    const-string v6, "shared_prefs/"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_7e

    const-string v6, "databases/"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_7e

    goto :goto_49

    :cond_7e
    const/16 v6, 0x2f

    .line 194
    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->indexOf(II)I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_8e

    goto :goto_49

    .line 195
    :cond_8e
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v1, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 196
    invoke-virtual {v6}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v5

    if-eqz v5, :cond_49

    .line 197
    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-nez v8, :cond_a6

    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    move-result v5

    if-nez v5, :cond_a6

    goto :goto_49

    .line 198
    :cond_a6
    new-instance v5, Ljava/io/BufferedOutputStream;

    new-instance v8, Ljava/io/FileOutputStream;

    invoke-direct {v8, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v5, v8, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_b0
    .catchall {:try_start_49 .. :try_end_b0} :catchall_ef

    .line 201
    :goto_b0
    :try_start_b0
    invoke-virtual {p1, p0}, Ljava/util/zip/ZipInputStream;->read([B)I

    move-result v6

    if-eq v6, v7, :cond_ba

    .line 202
    invoke-virtual {v5, p0, v2, v6}, Ljava/io/OutputStream;->write([BII)V
    :try_end_b9
    .catchall {:try_start_b0 .. :try_end_b9} :catchall_c0

    goto :goto_b0

    .line 205
    :cond_ba
    :try_start_ba
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    add-int/lit8 v4, v4, 0x1

    goto :goto_49

    :catchall_c0
    move-exception p0

    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    .line 206
    throw p0
    :try_end_c5
    .catchall {:try_start_ba .. :try_end_c5} :catchall_ef

    .line 211
    :cond_c5
    :try_start_c5
    invoke-virtual {p1}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_c8
    .catch Ljava/io/IOException; {:try_start_c5 .. :try_end_c8} :catch_c9

    goto :goto_ca

    :catch_c9
    nop

    :goto_ca
    if-eqz v4, :cond_e4

    .line 219
    new-instance p0, Ljava/io/File;

    const-string p1, "shared_prefs"

    invoke-direct {p0, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1, p0}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->applyStaged(Ljava/io/File;Ljava/io/File;)V

    .line 220
    new-instance p0, Ljava/io/File;

    const-string p1, "databases"

    invoke-direct {p0, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1, p0}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->applyStaged(Ljava/io/File;Ljava/io/File;)V

    .line 221
    invoke-static {v1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->deleteRecursively(Ljava/io/File;)V

    return v4

    .line 216
    :cond_e4
    invoke-static {v1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->deleteRecursively(Ljava/io/File;)V

    .line 217
    new-instance p0, Ljava/io/IOException;

    const-string p1, "invalid backup file"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_ef
    move-exception p0

    .line 211
    :try_start_f0
    invoke-virtual {p1}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_f3
    .catch Ljava/io/IOException; {:try_start_f0 .. :try_end_f3} :catch_f3

    .line 214
    :catch_f3
    throw p0

    .line 184
    :cond_f4
    new-instance p0, Ljava/io/IOException;

    const-string p1, "openInputStream failed"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static getString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 303
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "string"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_15

    .line 305
    invoke-virtual {p0, p1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p0
    :try_end_14
    .catchall {:try_start_0 .. :try_end_14} :catchall_15

    return-object p0

    :catchall_15
    :cond_15
    return-object p2
.end method

.method public static handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z
    .registers 8

    const/16 v0, 0x13f7

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p1, v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    if-nez v0, :cond_10

    const/16 v3, 0x13f8

    if-eq p1, v3, :cond_10

    return v1

    :cond_10
    const/4 p1, -0x1

    if-ne p2, p1, :cond_3a

    if-eqz p3, :cond_3a

    .line 95
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-nez p1, :cond_1c

    goto :goto_3a

    .line 98
    :cond_1c
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    .line 99
    const-string p2, "backup_restore_working"

    const-string p3, "\u6b63\u5728\u5904\u7406\u2026"

    invoke-static {p0, p2, p3}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->getString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    .line 100
    new-instance p2, Ljava/lang/Thread;

    new-instance p3, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;

    invoke-direct {p3, v0, p0, p1}, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;-><init>(ZLandroid/app/Activity;Landroid/net/Uri;)V

    const-string p0, "launcher-backup-restore"

    invoke-direct {p2, p3, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 116
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    :cond_3a
    :goto_3a
    return v2
.end method

.method private static postToast(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 3

    .line 321
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 322
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    .line 325
    :cond_13
    new-instance v0, Lcom/smartisanos/home/settings/LauncherBackupRestore$4;

    invoke-direct {v0, p0, p1}, Lcom/smartisanos/home/settings/LauncherBackupRestore$4;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1b
    .catchall {:try_start_0 .. :try_end_1b} :catchall_1b

    :catchall_1b
    return-void
.end method

.method private static scheduleRestart(Landroid/app/Activity;)V
    .registers 5

    .line 270
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 271
    new-instance v1, Lcom/smartisanos/home/settings/LauncherBackupRestore$3;

    invoke-direct {v1, p0}, Lcom/smartisanos/home/settings/LauncherBackupRestore$3;-><init>(Landroid/app/Activity;)V

    const-wide/16 v2, 0x5dc

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public static startBackup(Landroid/app/Activity;)V
    .registers 6

    const-string v0, "smartisan-launcher-backup-"

    .line 47
    :try_start_2
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 48
    const-string v2, "android.intent.category.OPENABLE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 49
    const-string v2, "application/zip"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 50
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyyMMdd-HHmmss"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v2, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    .line 51
    const-string v3, "android.intent.extra.TITLE"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ".zip"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/16 v0, 0x13f7

    .line 52
    invoke-virtual {p0, v1, v0}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_42
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2 .. :try_end_42} :catch_4f
    .catchall {:try_start_2 .. :try_end_42} :catchall_43

    goto :goto_54

    .line 56
    :catchall_43
    const-string v0, "backup_restore_failed"

    const-string v1, "\u64cd\u4f5c\u5931\u8d25"

    invoke-static {p0, v0, v1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->getString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_54

    .line 54
    :catch_4f
    const-string v0, "\u672a\u627e\u5230\u7cfb\u7edf\u6587\u4ef6\u9009\u62e9\u5668"

    invoke-static {p0, v0}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    :goto_54
    return-void
.end method

.method public static startRestore(Landroid/app/Activity;)V
    .registers 4

    .line 62
    :try_start_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "backup_restore_restore_title"

    const-string v2, "\u8fd8\u539f\u684c\u9762\u6570\u636e"

    .line 63
    invoke-static {p0, v1, v2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->getString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "backup_restore_restore_confirm"

    const-string v2, "\u5c06\u7528\u5907\u4efd\u6587\u4ef6\u8986\u76d6\u5f53\u524d\u6240\u6709\u8bbe\u7f6e\u548c\u684c\u9762\u5e03\u5c40\uff0c\u5b8c\u6210\u540e\u684c\u9762\u4f1a\u81ea\u52a8\u91cd\u542f\u3002\u786e\u5b9a\u7ee7\u7eed\uff1f"

    .line 64
    invoke-static {p0, v1, v2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->getString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/smartisanos/home/settings/LauncherBackupRestore$1;

    invoke-direct {v1, p0}, Lcom/smartisanos/home/settings/LauncherBackupRestore$1;-><init>(Landroid/app/Activity;)V

    const v2, 0x104000a

    .line 66
    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    .line 79
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 80
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_33
    .catchall {:try_start_0 .. :try_end_33} :catchall_34

    goto :goto_3f

    .line 82
    :catchall_34
    const-string v0, "backup_restore_failed"

    const-string v1, "\u64cd\u4f5c\u5931\u8d25"

    invoke-static {p0, v0, v1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->getString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    :goto_3f
    return-void
.end method

.method private static toast(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 3

    const/4 v0, 0x0

    .line 314
    :try_start_1
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_8

    :catchall_8
    return-void
.end method

.method private static zipDir(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;)I
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 144
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_8

    return v0

    :cond_8
    const/high16 v1, 0x10000

    .line 147
    new-array v2, v1, [B

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 148
    :goto_e
    array-length v5, p1

    if-ge v3, v5, :cond_69

    .line 149
    aget-object v5, p1, v3

    .line 150
    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_1a

    goto :goto_61

    .line 151
    :cond_1a
    new-instance v6, Ljava/util/zip/ZipEntry;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 152
    invoke-virtual {v5}, Ljava/io/File;->lastModified()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Ljava/util/zip/ZipEntry;->setTime(J)V

    .line 153
    invoke-virtual {p0, v6}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 154
    new-instance v6, Ljava/io/BufferedInputStream;

    new-instance v7, Ljava/io/FileInputStream;

    invoke-direct {v7, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v6, v7, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 157
    :goto_4e
    :try_start_4e
    invoke-virtual {v6, v2}, Ljava/io/InputStream;->read([B)I

    move-result v5

    const/4 v7, -0x1

    if-eq v5, v7, :cond_59

    .line 158
    invoke-virtual {p0, v2, v0, v5}, Ljava/util/zip/ZipOutputStream;->write([BII)V
    :try_end_58
    .catchall {:try_start_4e .. :try_end_58} :catchall_64

    goto :goto_4e

    .line 161
    :cond_59
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 163
    invoke-virtual {p0}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    add-int/lit8 v4, v4, 0x1

    :goto_61
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    :catchall_64
    move-exception p0

    .line 161
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 162
    throw p0

    :cond_69
    return v4
.end method
