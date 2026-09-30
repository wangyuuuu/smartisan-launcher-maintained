.class Lcom/smartisanos/home/settings/LauncherBackupRestore$1;
.super Ljava/lang/Object;
.source "LauncherBackupRestore.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisanos/home/settings/LauncherBackupRestore;->startRestore(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 73
    iput-object p1, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$1;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4

    .line 77
    :try_start_0
    new-instance p1, Landroid/content/Intent;

    const-string p2, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 78
    const-string p2, "android.intent.category.OPENABLE"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 79
    const-string p2, "application/zip"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 80
    iget-object p2, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$1;->val$activity:Landroid/app/Activity;

    const/16 v0, 0x13f8

    invoke-virtual {p2, p1, v0}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_18
    .catchall {:try_start_0 .. :try_end_18} :catchall_19

    goto :goto_2e

    :catchall_19
    move-exception p1

    .line 82
    const-string p2, "LauncherBackup"

    const-string v0, "startRestore picker failed"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 83
    iget-object p1, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$1;->val$activity:Landroid/app/Activity;

    const-string p2, "backup_restore_failed"

    const-string v0, "\u64cd\u4f5c\u5931\u8d25"

    invoke-static {p1, p2, v0}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$000(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/smartisanos/home/settings/LauncherBackupRestore;->access$100(Landroid/app/Activity;Ljava/lang/String;)V

    :goto_2e
    return-void
.end method
