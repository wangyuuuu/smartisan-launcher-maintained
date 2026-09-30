.class Lcom/smartisanos/home/settings/LauncherBackupRestore$2;
.super Ljava/lang/Object;
.source "LauncherBackupRestore.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisanos/home/settings/LauncherBackupRestore;->handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$backup:Z

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(ZLandroid/app/Activity;Landroid/net/Uri;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 111
    iput-boolean p1, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$backup:Z

    iput-object p2, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$activity:Landroid/app/Activity;

    iput-object p3, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$uri:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 115
    const-string v0, "LauncherBackup"

    :try_start_2
    iget-boolean v1, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$backup:Z

    if-eqz v1, :cond_20

    .line 116
    iget-object v1, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$activity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$uri:Landroid/net/Uri;

    invoke-static {v1, v2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$200(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 117
    const-string v1, "backup done"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    iget-object v1, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$activity:Landroid/app/Activity;

    const-string v2, "backup_restore_backup_done"

    const-string v3, "\u5907\u4efd\u5b8c\u6210"

    invoke-static {v1, v2, v3}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$000(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$300(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_6e

    .line 120
    :cond_20
    iget-object v1, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$activity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$uri:Landroid/net/Uri;

    invoke-static {v1, v2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$400(Landroid/app/Activity;Landroid/net/Uri;)I

    .line 121
    const-string v1, "restore done, restarting"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    iget-object v1, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$activity:Landroid/app/Activity;

    const-string v2, "backup_restore_restore_done"

    const-string v3, "\u8fd8\u539f\u5b8c\u6210\uff0c\u6b63\u5728\u91cd\u542f\u684c\u9762\u2026"

    invoke-static {v1, v2, v3}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$000(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$300(Landroid/app/Activity;Ljava/lang/String;)V

    .line 123
    iget-object v1, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$activity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$500(Landroid/app/Activity;)V
    :try_end_3e
    .catchall {:try_start_2 .. :try_end_3e} :catchall_3f

    goto :goto_6e

    :catchall_3f
    move-exception v1

    .line 126
    iget-boolean v2, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$backup:Z

    if-eqz v2, :cond_47

    const-string v2, "backup"

    goto :goto_49

    :cond_47
    const-string v2, "restore"

    :goto_49
    const-string v3, " failed"

    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 127
    iget-boolean v0, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$backup:Z

    if-eqz v0, :cond_61

    .line 128
    iget-object v0, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$uri:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$600(Landroid/content/Context;Landroid/net/Uri;)V

    .line 130
    :cond_61
    iget-object v0, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$activity:Landroid/app/Activity;

    const-string v1, "backup_restore_failed"

    const-string v2, "\u64cd\u4f5c\u5931\u8d25"

    invoke-static {v0, v1, v2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$000(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$300(Landroid/app/Activity;Ljava/lang/String;)V

    :goto_6e
    return-void
.end method
