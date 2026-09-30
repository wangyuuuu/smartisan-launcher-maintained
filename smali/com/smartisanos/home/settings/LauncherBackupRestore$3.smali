.class Lcom/smartisanos/home/settings/LauncherBackupRestore$3;
.super Ljava/lang/Object;
.source "LauncherBackupRestore.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisanos/home/settings/LauncherBackupRestore;->scheduleRestart(Landroid/app/Activity;)V
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

    .line 349
    iput-object p1, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$3;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 353
    :try_start_0
    iget-object v0, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$3;->val$activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V
    :try_end_5
    .catchall {:try_start_0 .. :try_end_5} :catchall_5

    .line 356
    :catchall_5
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/smartisanos/home/settings/LauncherBackupRestore$3$1;

    invoke-direct {v1, p0}, Lcom/smartisanos/home/settings/LauncherBackupRestore$3$1;-><init>(Lcom/smartisanos/home/settings/LauncherBackupRestore$3;)V

    const-wide/16 v2, 0x190

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
