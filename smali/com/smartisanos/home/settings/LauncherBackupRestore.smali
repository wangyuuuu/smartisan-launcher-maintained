.class public Lcom/smartisanos/home/settings/LauncherBackupRestore;
.super Ljava/lang/Object;
.source "LauncherBackupRestore.java"


# static fields
.field private static final DIR_DB:Ljava/lang/String; = "databases"

.field private static final DIR_PREFS:Ljava/lang/String; = "shared_prefs"

.field public static final REQUEST_BACKUP:I = 0x13f7

.field public static final REQUEST_RESTORE:I = 0x13f8

.field private static final RESTART_DELAY_MS:J = 0x5dcL

.field private static final TAG:Ljava/lang/String; = "LauncherBackup"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 39
    invoke-static {p0, p1, p2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->getString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 2

    .line 39
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

    .line 39
    invoke-static {p0, p1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->doBackup(Landroid/app/Activity;Landroid/net/Uri;)V

    return-void
.end method

.method static synthetic access$300(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 2

    .line 39
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

    .line 39
    invoke-static {p0, p1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->doRestore(Landroid/app/Activity;Landroid/net/Uri;)I

    move-result p0

    return p0
.end method

.method static synthetic access$500(Landroid/app/Activity;)V
    .registers 1

    .line 39
    invoke-static {p0}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->scheduleRestart(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$600(Landroid/content/Context;Landroid/net/Uri;)V
    .registers 2

    .line 39
    invoke-static {p0, p1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->deleteDocumentQuietly(Landroid/content/Context;Landroid/net/Uri;)V

    return-void
.end method

.method private static applyStaged(Ljava/io/File;Ljava/io/File;)V
    .registers 8

    .line 300
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 301
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_a0

    .line 302
    array-length v0, p0

    if-nez v0, :cond_14

    goto/16 :goto_a0

    .line 303
    :cond_14
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_35

    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_35

    .line 304
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "applyStaged: mkdir failed "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "LauncherBackup"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_35
    const/4 v0, 0x0

    .line 307
    :goto_36
    array-length v1, p0

    if-ge v0, v1, :cond_a0

    .line 308
    aget-object v1, p0, v0

    .line 309
    new-instance v2, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 310
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, ".db"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8e

    .line 312
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

    .line 313
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

    .line 315
    :cond_8e
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 316
    invoke-virtual {v1, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v3

    if-nez v3, :cond_9d

    .line 317
    invoke-static {v1, v2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->copyFile(Ljava/io/File;Ljava/io/File;)V

    .line 318
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_9d
    add-int/lit8 v0, v0, 0x1

    goto :goto_36

    :cond_a0
    :goto_a0
    return-void
.end method

.method private static copyFile(Ljava/io/File;Ljava/io/File;)V
    .registers 7

    .line 325
    :try_start_0
    new-instance v0, Ljava/io/BufferedInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/high16 v2, 0x10000

    invoke-direct {v0, v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_c} :catch_35

    .line 327
    :try_start_c
    new-instance v1, Ljava/io/BufferedOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v3, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_16
    .catchall {:try_start_c .. :try_end_16} :catchall_30

    .line 329
    :try_start_16
    new-array v2, v2, [B

    .line 331
    :goto_18
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_24

    const/4 v4, 0x0

    .line 332
    invoke-virtual {v1, v2, v4, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_23
    .catchall {:try_start_16 .. :try_end_23} :catchall_2b

    goto :goto_18

    .line 335
    :cond_24
    :try_start_24
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_27
    .catchall {:try_start_24 .. :try_end_27} :catchall_30

    .line 338
    :try_start_27
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2a
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_2a} :catch_35

    goto :goto_54

    :catchall_2b
    move-exception v2

    .line 335
    :try_start_2c
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 336
    throw v2
    :try_end_30
    .catchall {:try_start_2c .. :try_end_30} :catchall_30

    :catchall_30
    move-exception v1

    .line 338
    :try_start_31
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 339
    throw v1
    :try_end_35
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_35} :catch_35

    :catch_35
    move-exception v0

    .line 341
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "copyFile failed "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, " -> "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "LauncherBackup"

    invoke-static {p1, p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_54
    return-void
.end method

.method private static deleteDocumentQuietly(Landroid/content/Context;Landroid/net/Uri;)V
    .registers 4

    .line 370
    const-string v0, "LauncherBackup"

    .line 0
    const-string v1, "deleted incomplete document: "

    .line 370
    :try_start_4
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {p0, p1}, Landroid/provider/DocumentsContract;->deleteDocument(Landroid/content/ContentResolver;Landroid/net/Uri;)Z

    .line 371
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1b
    .catchall {:try_start_4 .. :try_end_1b} :catchall_1c

    goto :goto_22

    :catchall_1c
    move-exception p0

    .line 373
    const-string p1, "deleteDocument failed"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_22
    return-void
.end method

.method private static deleteRecursively(Ljava/io/File;)V
    .registers 4

    if-eqz p0, :cond_1e

    .line 378
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_9

    goto :goto_1e

    .line 379
    :cond_9
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_1b

    const/4 v1, 0x0

    .line 381
    :goto_10
    array-length v2, v0

    if-ge v1, v2, :cond_1b

    .line 382
    aget-object v2, v0, v1

    invoke-static {v2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->deleteRecursively(Ljava/io/File;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 385
    :cond_1b
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    :cond_1e
    :goto_1e
    return-void
.end method

.method private static doBackup(Landroid/app/Activity;Landroid/net/Uri;)V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 140
    const-string v0, "close tmp zip"

    const-string v1, "shared_prefs"

    const-string v2, "databases"

    const-string v3, "LauncherBackup"

    .line 0
    const-string v4, "zipped files: databases="

    .line 140
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 142
    new-instance v5, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v6

    const-string v7, "launcher_backup_tmp.zip"

    invoke-direct {v5, v6, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 143
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 145
    new-instance v6, Ljava/util/zip/ZipOutputStream;

    new-instance v7, Ljava/io/BufferedOutputStream;

    new-instance v8, Ljava/io/FileOutputStream;

    invoke-direct {v8, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/high16 v9, 0x10000

    invoke-direct {v7, v8, v9}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    invoke-direct {v6, v7}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 147
    :try_start_2d
    invoke-static {p0, v2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->resolveDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v7

    invoke-static {v6, v7, v2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->zipDir(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;)I

    move-result v2

    .line 148
    invoke-static {p0, v1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->resolveDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v7

    invoke-static {v6, v7, v1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->zipDir(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;)I

    move-result v1

    add-int v7, v2, v1

    .line 150
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " shared_prefs="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_59
    .catchall {:try_start_2d .. :try_end_59} :catchall_100

    .line 153
    :try_start_59
    invoke-virtual {v6}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_5c
    .catch Ljava/io/IOException; {:try_start_59 .. :try_end_5c} :catch_5d

    goto :goto_61

    :catch_5d
    move-exception v1

    .line 155
    invoke-static {v3, v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_61
    if-eqz v7, :cond_d4

    .line 158
    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v0

    const-wide/16 v10, 0x0

    cmp-long v2, v0, v10

    if-eqz v2, :cond_d4

    .line 163
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "tmp zip size="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    .line 167
    :try_start_84
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v0

    if-eqz v0, :cond_bf

    .line 169
    new-instance p0, Ljava/io/BufferedInputStream;

    new-instance p1, Ljava/io/FileInputStream;

    invoke-direct {p1, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {p0, p1, v9}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_98
    .catch Ljava/io/IOException; {:try_start_84 .. :try_end_98} :catch_c9
    .catchall {:try_start_84 .. :try_end_98} :catchall_c7

    .line 171
    :try_start_98
    new-array p1, v9, [B

    .line 173
    :goto_9a
    invoke-virtual {p0, p1}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_a6

    const/4 v2, 0x0

    .line 174
    invoke-virtual {v0, p1, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_9a

    .line 176
    :cond_a6
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_a9
    .catchall {:try_start_98 .. :try_end_a9} :catchall_ba

    .line 178
    :try_start_a9
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 180
    const-string p0, "copied to saf target"

    invoke-static {v3, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b1
    .catch Ljava/io/IOException; {:try_start_a9 .. :try_end_b1} :catch_c9
    .catchall {:try_start_a9 .. :try_end_b1} :catchall_c7

    if-eqz v0, :cond_b6

    .line 186
    :try_start_b3
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_b6
    .catch Ljava/io/IOException; {:try_start_b3 .. :try_end_b6} :catch_b6

    .line 190
    :catch_b6
    :cond_b6
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    return-void

    :catchall_ba
    move-exception p1

    .line 178
    :try_start_bb
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 179
    throw p1

    .line 168
    :cond_bf
    new-instance p0, Ljava/io/IOException;

    const-string p1, "openOutputStream returned null"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_c7
    .catch Ljava/io/IOException; {:try_start_bb .. :try_end_c7} :catch_c9
    .catchall {:try_start_bb .. :try_end_c7} :catchall_c7

    :catchall_c7
    move-exception p0

    goto :goto_cb

    :catch_c9
    move-exception p0

    .line 182
    :try_start_ca
    throw p0
    :try_end_cb
    .catchall {:try_start_ca .. :try_end_cb} :catchall_c7

    :goto_cb
    if-eqz v0, :cond_d0

    .line 186
    :try_start_cd
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_d0
    .catch Ljava/io/IOException; {:try_start_cd .. :try_end_d0} :catch_d0

    .line 190
    :catch_d0
    :cond_d0
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 191
    throw p0

    .line 159
    :cond_d4
    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide p0

    .line 160
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 161
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "no data backed up (count="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", tmpLen="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ")"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_100
    move-exception p0

    .line 153
    :try_start_101
    invoke-virtual {v6}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_104
    .catch Ljava/io/IOException; {:try_start_101 .. :try_end_104} :catch_105

    goto :goto_109

    :catch_105
    move-exception p1

    .line 155
    invoke-static {v3, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 157
    :goto_109
    throw p0
.end method

.method private static doRestore(Landroid/app/Activity;Landroid/net/Uri;)I
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 248
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 249
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 250
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "launcher_restore_staging"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 251
    invoke-static {v0}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->deleteRecursively(Ljava/io/File;)V

    .line 252
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_32

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_2a

    goto :goto_32

    .line 253
    :cond_2a
    new-instance p0, Ljava/io/IOException;

    const-string p1, "staging mkdir failed"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 256
    :cond_32
    :goto_32
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1

    if-eqz p1, :cond_10f

    .line 258
    new-instance v1, Ljava/util/zip/ZipInputStream;

    new-instance v2, Ljava/io/BufferedInputStream;

    const/high16 v3, 0x10000

    invoke-direct {v2, p1, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    invoke-direct {v1, v2}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 259
    new-array p1, v3, [B

    const/4 v2, 0x0

    const/4 v4, 0x0

    .line 262
    :cond_4c
    :goto_4c
    :try_start_4c
    invoke-virtual {v1}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v5

    if-eqz v5, :cond_c8

    .line 263
    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_59

    goto :goto_4c

    .line 264
    :cond_59
    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_4c

    .line 265
    const-string v6, ".."

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_4c

    const-string v6, "/../"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_70

    goto :goto_4c

    .line 266
    :cond_70
    const-string v6, "shared_prefs/"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_81

    const-string v6, "databases/"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_81

    goto :goto_4c

    :cond_81
    const/16 v6, 0x2f

    .line 267
    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->indexOf(II)I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_91

    goto :goto_4c

    .line 268
    :cond_91
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 269
    invoke-virtual {v6}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v5

    if-eqz v5, :cond_4c

    .line 270
    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-nez v8, :cond_a9

    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    move-result v5

    if-nez v5, :cond_a9

    goto :goto_4c

    .line 271
    :cond_a9
    new-instance v5, Ljava/io/BufferedOutputStream;

    new-instance v8, Ljava/io/FileOutputStream;

    invoke-direct {v8, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v5, v8, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_b3
    .catchall {:try_start_4c .. :try_end_b3} :catchall_10a

    .line 274
    :goto_b3
    :try_start_b3
    invoke-virtual {v1, p1}, Ljava/util/zip/ZipInputStream;->read([B)I

    move-result v6

    if-eq v6, v7, :cond_bd

    .line 275
    invoke-virtual {v5, p1, v2, v6}, Ljava/io/OutputStream;->write([BII)V
    :try_end_bc
    .catchall {:try_start_b3 .. :try_end_bc} :catchall_c3

    goto :goto_b3

    .line 278
    :cond_bd
    :try_start_bd
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    add-int/lit8 v4, v4, 0x1

    goto :goto_4c

    :catchall_c3
    move-exception p0

    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    .line 279
    throw p0
    :try_end_c8
    .catchall {:try_start_bd .. :try_end_c8} :catchall_10a

    .line 284
    :cond_c8
    :try_start_c8
    invoke-virtual {v1}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_cb
    .catch Ljava/io/IOException; {:try_start_c8 .. :try_end_cb} :catch_cc

    goto :goto_cd

    :catch_cc
    nop

    :goto_cd
    if-eqz v4, :cond_ff

    .line 292
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "staged "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " files, applying"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "LauncherBackup"

    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    const-string p1, "shared_prefs"

    invoke-static {p0, p1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->resolveDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->applyStaged(Ljava/io/File;Ljava/io/File;)V

    .line 294
    const-string p1, "databases"

    invoke-static {p0, p1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->resolveDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->applyStaged(Ljava/io/File;Ljava/io/File;)V

    .line 295
    invoke-static {v0}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->deleteRecursively(Ljava/io/File;)V

    return v4

    .line 289
    :cond_ff
    invoke-static {v0}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->deleteRecursively(Ljava/io/File;)V

    .line 290
    new-instance p0, Ljava/io/IOException;

    const-string p1, "invalid backup file (0 entries)"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_10a
    move-exception p0

    .line 284
    :try_start_10b
    invoke-virtual {v1}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_10e
    .catch Ljava/io/IOException; {:try_start_10b .. :try_end_10e} :catch_10e

    .line 287
    :catch_10e
    throw p0

    .line 257
    :cond_10f
    new-instance p0, Ljava/io/IOException;

    const-string p1, "openInputStream failed"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static getString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 390
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "string"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_15

    .line 392
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

    .line 104
    :cond_10
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "handleActivityResult req="

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " result="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "LauncherBackup"

    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, -0x1

    if-ne p2, p1, :cond_6a

    if-eqz p3, :cond_6a

    .line 105
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-nez p1, :cond_3a

    goto :goto_6a

    .line 108
    :cond_3a
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    .line 109
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "uri="

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    const-string p2, "backup_restore_working"

    const-string p3, "\u6b63\u5728\u5904\u7406\u2026"

    invoke-static {p0, p2, p3}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->getString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    .line 111
    new-instance p2, Ljava/lang/Thread;

    new-instance p3, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;

    invoke-direct {p3, v0, p0, p1}, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;-><init>(ZLandroid/app/Activity;Landroid/net/Uri;)V

    const-string p0, "launcher-backup-restore"

    invoke-direct {p2, p3, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 133
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    :cond_6a
    :goto_6a
    return v2
.end method

.method private static postToast(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 3

    .line 408
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 409
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    .line 412
    :cond_13
    new-instance v0, Lcom/smartisanos/home/settings/LauncherBackupRestore$4;

    invoke-direct {v0, p0, p1}, Lcom/smartisanos/home/settings/LauncherBackupRestore$4;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1b
    .catchall {:try_start_0 .. :try_end_1b} :catchall_1b

    :catchall_1b
    return-void
.end method

.method private static resolveDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    .registers 5

    .line 199
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_12

    return-object v0

    .line 201
    :cond_12
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_22

    .line 202
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_23

    :cond_22
    const/4 v2, 0x0

    :goto_23
    if-eqz v2, :cond_2c

    .line 203
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_2c

    return-object v2

    .line 204
    :cond_2c
    const-string v1, "databases"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_47

    .line 205
    const-string v1, "probe.db"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    .line 206
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_47

    .line 207
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_47

    return-object p0

    .line 209
    :cond_47
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "resolveDir: \'"

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "\' not found. tried: "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ", "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "LauncherBackup"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method

.method private static scheduleRestart(Landroid/app/Activity;)V
    .registers 5

    .line 348
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 349
    new-instance v1, Lcom/smartisanos/home/settings/LauncherBackupRestore$3;

    invoke-direct {v1, p0}, Lcom/smartisanos/home/settings/LauncherBackupRestore$3;-><init>(Landroid/app/Activity;)V

    const-wide/16 v2, 0x5dc

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public static startBackup(Landroid/app/Activity;)V
    .registers 7

    .line 52
    const-string v0, "LauncherBackup"

    .line 0
    const-string v1, "smartisan-launcher-backup-"

    .line 52
    :try_start_4
    const-string v2, "startBackup"

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 54
    const-string v3, "android.intent.category.OPENABLE"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 55
    const-string v3, "application/zip"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 56
    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v4, "yyyyMMdd-HHmmss"

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v3, v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-virtual {v3, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    .line 57
    const-string v4, "android.intent.extra.TITLE"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ".zip"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/16 v1, 0x13f7

    .line 58
    invoke-virtual {p0, v2, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_49
    .catch Landroid/content/ActivityNotFoundException; {:try_start_4 .. :try_end_49} :catch_5c
    .catchall {:try_start_4 .. :try_end_49} :catchall_4a

    goto :goto_61

    :catchall_4a
    move-exception v1

    .line 62
    const-string v2, "startBackup failed"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 63
    const-string v0, "backup_restore_failed"

    const-string v1, "\u64cd\u4f5c\u5931\u8d25"

    invoke-static {p0, v0, v1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->getString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_61

    .line 60
    :catch_5c
    const-string v0, "\u672a\u627e\u5230\u7cfb\u7edf\u6587\u4ef6\u9009\u62e9\u5668"

    invoke-static {p0, v0}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    :goto_61
    return-void
.end method

.method public static startRestore(Landroid/app/Activity;)V
    .registers 4

    .line 69
    :try_start_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "backup_restore_restore_title"

    const-string v2, "\u8fd8\u539f\u684c\u9762\u6570\u636e"

    .line 70
    invoke-static {p0, v1, v2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->getString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "backup_restore_restore_confirm"

    const-string v2, "\u5c06\u7528\u5907\u4efd\u6587\u4ef6\u8986\u76d6\u5f53\u524d\u6240\u6709\u8bbe\u7f6e\u548c\u684c\u9762\u5e03\u5c40\uff0c\u5b8c\u6210\u540e\u684c\u9762\u4f1a\u81ea\u52a8\u91cd\u542f\u3002\u786e\u5b9a\u7ee7\u7eed\uff1f"

    .line 71
    invoke-static {p0, v1, v2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->getString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/smartisanos/home/settings/LauncherBackupRestore$1;

    invoke-direct {v1, p0}, Lcom/smartisanos/home/settings/LauncherBackupRestore$1;-><init>(Landroid/app/Activity;)V

    const v2, 0x104000a

    .line 73
    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    .line 87
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 88
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_33
    .catchall {:try_start_0 .. :try_end_33} :catchall_34

    goto :goto_47

    :catchall_34
    move-exception v0

    .line 90
    const-string v1, "LauncherBackup"

    const-string v2, "startRestore dialog failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 91
    const-string v0, "backup_restore_failed"

    const-string v1, "\u64cd\u4f5c\u5931\u8d25"

    invoke-static {p0, v0, v1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->getString(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    :goto_47
    return-void
.end method

.method private static toast(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 3

    const/4 v0, 0x0

    .line 401
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

    .line 214
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_1c

    .line 216
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "zipDir: listFiles null for "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "LauncherBackup"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_1c
    const/high16 p1, 0x10000

    .line 220
    new-array v2, p1, [B

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 221
    :goto_22
    array-length v5, v0

    if-ge v3, v5, :cond_7d

    .line 222
    aget-object v5, v0, v3

    .line 223
    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_2e

    goto :goto_75

    .line 224
    :cond_2e
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

    .line 225
    invoke-virtual {v5}, Ljava/io/File;->lastModified()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Ljava/util/zip/ZipEntry;->setTime(J)V

    .line 226
    invoke-virtual {p0, v6}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 227
    new-instance v6, Ljava/io/BufferedInputStream;

    new-instance v7, Ljava/io/FileInputStream;

    invoke-direct {v7, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v6, v7, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 230
    :goto_62
    :try_start_62
    invoke-virtual {v6, v2}, Ljava/io/InputStream;->read([B)I

    move-result v5

    const/4 v7, -0x1

    if-eq v5, v7, :cond_6d

    .line 231
    invoke-virtual {p0, v2, v1, v5}, Ljava/util/zip/ZipOutputStream;->write([BII)V
    :try_end_6c
    .catchall {:try_start_62 .. :try_end_6c} :catchall_78

    goto :goto_62

    .line 234
    :cond_6d
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 236
    invoke-virtual {p0}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    add-int/lit8 v4, v4, 0x1

    :goto_75
    add-int/lit8 v3, v3, 0x1

    goto :goto_22

    :catchall_78
    move-exception p0

    .line 234
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 235
    throw p0

    :cond_7d
    return v4
.end method
