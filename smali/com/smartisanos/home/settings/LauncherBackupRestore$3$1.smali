.class Lcom/smartisanos/home/settings/LauncherBackupRestore$3$1;
.super Ljava/lang/Object;
.source "LauncherBackupRestore.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/smartisanos/home/settings/LauncherBackupRestore$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/smartisanos/home/settings/LauncherBackupRestore$3;


# direct methods
.method constructor <init>(Lcom/smartisanos/home/settings/LauncherBackupRestore$3;)V
    .registers 2

    .line 356
    iput-object p1, p0, Lcom/smartisanos/home/settings/LauncherBackupRestore$3$1;->this$0:Lcom/smartisanos/home/settings/LauncherBackupRestore$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 359
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    return-void
.end method
