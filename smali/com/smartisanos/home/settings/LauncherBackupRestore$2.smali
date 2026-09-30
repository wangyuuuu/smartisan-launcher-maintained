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

    .line 100
    iput-boolean p1, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$backup:Z

    iput-object p2, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$activity:Landroid/app/Activity;

    iput-object p3, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$uri:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 104
    :try_start_0
    iget-boolean v0, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$backup:Z

    if-eqz v0, :cond_19

    .line 105
    iget-object v0, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$uri:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$200(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 106
    iget-object v0, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$activity:Landroid/app/Activity;

    const-string v1, "backup_restore_backup_done"

    const-string v2, "\u5907\u4efd\u5b8c\u6210"

    invoke-static {v0, v1, v2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$000(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$300(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_40

    .line 108
    :cond_19
    iget-object v0, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$uri:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$400(Landroid/app/Activity;Landroid/net/Uri;)I

    .line 109
    iget-object v0, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$activity:Landroid/app/Activity;

    const-string v1, "backup_restore_restore_done"

    const-string v2, "\u8fd8\u539f\u5b8c\u6210\uff0c\u6b63\u5728\u91cd\u542f\u684c\u9762\u2026"

    invoke-static {v0, v1, v2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$000(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$300(Landroid/app/Activity;Ljava/lang/String;)V

    .line 110
    iget-object v0, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$activity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$500(Landroid/app/Activity;)V
    :try_end_32
    .catchall {:try_start_0 .. :try_end_32} :catchall_33

    goto :goto_40

    .line 113
    :catchall_33
    iget-object v0, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$2;->val$activity:Landroid/app/Activity;

    const-string v1, "backup_restore_failed"

    const-string v2, "\u64cd\u4f5c\u5931\u8d25"

    invoke-static {v0, v1, v2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$000(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$300(Landroid/app/Activity;Ljava/lang/String;)V

    :goto_40
    return-void
.end method
