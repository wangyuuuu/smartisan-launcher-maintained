.class public Lcom/smartisanos/home/settings/AboutUsActivity;
.super Landroid/app/Activity;
.source "AboutUsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mCopyMenu:Lcom/smartisanos/home/widget/sys/CopyActionMenu;

.field private mOfficalWeb:Landroid/widget/RelativeLayout;

.field private mScrollView:Landroid/widget/ScrollView;

.field private mTitle:Lcom/smartisanos/launcher/widget/TitleBar;

.field private mWeibo:Landroid/widget/RelativeLayout;

.field private mWeixin:Landroid/widget/RelativeLayout;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 31
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 33
    iput-object v0, p0, Lcom/smartisanos/home/settings/AboutUsActivity;->mWeixin:Landroid/widget/RelativeLayout;

    .line 34
    iput-object v0, p0, Lcom/smartisanos/home/settings/AboutUsActivity;->mWeibo:Landroid/widget/RelativeLayout;

    .line 35
    iput-object v0, p0, Lcom/smartisanos/home/settings/AboutUsActivity;->mOfficalWeb:Landroid/widget/RelativeLayout;

    .line 36
    iput-object v0, p0, Lcom/smartisanos/home/settings/AboutUsActivity;->mCopyMenu:Lcom/smartisanos/home/widget/sys/CopyActionMenu;

    return-void
.end method

.method static synthetic access$000(Lcom/smartisanos/home/settings/AboutUsActivity;)Lcom/smartisanos/home/widget/sys/CopyActionMenu;
    .locals 1
    .param p0, "x0"    # Lcom/smartisanos/home/settings/AboutUsActivity;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/smartisanos/home/settings/AboutUsActivity;->mCopyMenu:Lcom/smartisanos/home/widget/sys/CopyActionMenu;

    return-object v0
.end method

.method private formatWeiboName()Ljava/lang/String;
    .locals 4

    .prologue
    .line 124
    const/4 v1, 0x0

    .line 125
    .local v1, "weiboName":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/smartisanos/home/settings/AboutUsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080063

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 126
    .local v0, "weibo":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 127
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 129
    :cond_0
    return-object v1
.end method

.method private openCopyDialog(Z)V
    .locals 3
    .param p1, "isWeixin"    # Z

    .prologue
    .line 76
    new-instance v1, Lcom/smartisanos/home/widget/sys/CopyActionMenu;

    invoke-direct {v1, p0}, Lcom/smartisanos/home/widget/sys/CopyActionMenu;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/smartisanos/home/settings/AboutUsActivity;->mCopyMenu:Lcom/smartisanos/home/widget/sys/CopyActionMenu;

    .line 77
    invoke-virtual {p0, p1}, Lcom/smartisanos/home/settings/AboutUsActivity;->createActionDialog(Z)Ljava/util/List;

    move-result-object v0

    .line 78
    .local v0, "mActionItems":Ljava/util/List;, "Ljava/util/List<Lcom/smartisanos/home/widget/sys/CopyActionMenu$ActionItem;>;"
    iget-object v1, p0, Lcom/smartisanos/home/settings/AboutUsActivity;->mCopyMenu:Lcom/smartisanos/home/widget/sys/CopyActionMenu;

    invoke-virtual {v1, v0}, Lcom/smartisanos/home/widget/sys/CopyActionMenu;->addActionItem(Ljava/util/List;)V

    .line 79
    if-eqz p1, :cond_0

    .line 80
    iget-object v1, p0, Lcom/smartisanos/home/settings/AboutUsActivity;->mCopyMenu:Lcom/smartisanos/home/widget/sys/CopyActionMenu;

    const v2, 0x7f080061

    invoke-virtual {v1, v2}, Lcom/smartisanos/home/widget/sys/CopyActionMenu;->setMenuTitle(I)V

    .line 84
    :goto_0
    iget-object v1, p0, Lcom/smartisanos/home/settings/AboutUsActivity;->mCopyMenu:Lcom/smartisanos/home/widget/sys/CopyActionMenu;

    new-instance v2, Lcom/smartisanos/home/settings/AboutUsActivity$2;

    invoke-direct {v2, p0}, Lcom/smartisanos/home/settings/AboutUsActivity$2;-><init>(Lcom/smartisanos/home/settings/AboutUsActivity;)V

    invoke-virtual {v1, v2}, Lcom/smartisanos/home/widget/sys/CopyActionMenu;->setNegativeButton(Landroid/view/View$OnClickListener;)V

    .line 91
    iget-object v1, p0, Lcom/smartisanos/home/settings/AboutUsActivity;->mCopyMenu:Lcom/smartisanos/home/widget/sys/CopyActionMenu;

    invoke-virtual {v1}, Lcom/smartisanos/home/widget/sys/CopyActionMenu;->show()V

    .line 92
    return-void

    .line 82
    :cond_0
    iget-object v1, p0, Lcom/smartisanos/home/settings/AboutUsActivity;->mCopyMenu:Lcom/smartisanos/home/widget/sys/CopyActionMenu;

    const v2, 0x7f080060

    invoke-virtual {v1, v2}, Lcom/smartisanos/home/widget/sys/CopyActionMenu;->setMenuTitle(I)V

    goto :goto_0
.end method

.method private openOfficalWebSite()V
    .locals 3

    .prologue
    .line 67
    const-string v0, "http://www.smartisan.com"

    .line 68
    .local v0, "WEB_SITE":Ljava/lang/String;
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 69
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "http://www.smartisan.com"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 71
    :try_start_0
    invoke-virtual {p0, v1}, Lcom/smartisanos/home/settings/AboutUsActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    :goto_0
    return-void

    .line 72
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private updateWeiboName()V
    .locals 2

    .prologue
    .line 119
    const v1, 0x7f0f013e

    invoke-virtual {p0, v1}, Lcom/smartisanos/home/settings/AboutUsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 120
    .local v0, "weiboView":Landroid/widget/TextView;
    invoke-direct {p0}, Lcom/smartisanos/home/settings/AboutUsActivity;->formatWeiboName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    return-void
.end method


# 【维护版 r25】把版本号填到「关于我们」页底部居中的灰色小字上。
# 版本号从 PackageManager 动态读取（= AndroidManifest 的 versionName，
# 也就是 apktool.yml 里那个值），所以以后每次发版只改 apktool.yml 即可，
# 这一页会自动跟着变，不需要同步改任何字符串资源。
.method private updateVersionView()V
    .locals 5

    const v0, 0x7f0f0190    # R.id.about_us_version

    invoke-virtual {p0, v0}, Lcom/smartisanos/home/settings/AboutUsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    if-nez v1, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/smartisanos/home/settings/AboutUsActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Lcom/smartisanos/home/settings/AboutUsActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string v2, ""

    :goto_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    return-void

    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "v"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method protected createActionDialog(Z)Ljava/util/List;
    .locals 6
    .param p1, "isWeixin"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List",
            "<",
            "Lcom/smartisanos/home/widget/sys/CopyActionMenu$ActionItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 95
    const/4 v2, 0x0

    .line 96
    .local v2, "text":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 97
    invoke-virtual {p0}, Lcom/smartisanos/home/settings/AboutUsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080244

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 101
    :goto_0
    move-object v1, v2

    .line 102
    .local v1, "copyText":Ljava/lang/String;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .local v0, "actionItems":Ljava/util/List;, "Ljava/util/List<Lcom/smartisanos/home/widget/sys/CopyActionMenu$ActionItem;>;"
    new-instance v3, Lcom/smartisanos/home/widget/sys/CopyActionMenu$ActionItem;

    const v4, 0x7f08005e

    new-instance v5, Lcom/smartisanos/home/settings/AboutUsActivity$3;

    invoke-direct {v5, p0, v1}, Lcom/smartisanos/home/settings/AboutUsActivity$3;-><init>(Lcom/smartisanos/home/settings/AboutUsActivity;Ljava/lang/String;)V

    invoke-direct {v3, v4, v5}, Lcom/smartisanos/home/widget/sys/CopyActionMenu$ActionItem;-><init>(ILandroid/view/View$OnClickListener;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    return-object v0

    .line 99
    .end local v0    # "actionItems":Ljava/util/List;, "Ljava/util/List<Lcom/smartisanos/home/widget/sys/CopyActionMenu$ActionItem;>;"
    .end local v1    # "copyText":Ljava/lang/String;
    :cond_0
    invoke-direct {p0}, Lcom/smartisanos/home/settings/AboutUsActivity;->formatWeiboName()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public finish()V
    .locals 2

    .prologue
    .line 134
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 135
    const v0, 0x7f050021

    .line 136
    .local v0, "slide_in_from_left":I
    const v1, 0x7f050024

    .line 137
    .local v1, "slide_out_to_right":I
    invoke-virtual {p0, v0, v1}, Lcom/smartisanos/home/settings/AboutUsActivity;->overridePendingTransition(II)V

    .line 138
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 142
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 143
    .local v0, "id":I
    const v1, 0x7f0f013c

    if-ne v0, v1, :cond_1

    .line 144
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/smartisanos/home/settings/AboutUsActivity;->openCopyDialog(Z)V

    .line 150
    :cond_0
    :goto_0
    return-void

    .line 145
    :cond_1
    const v1, 0x7f0f013d

    if-ne v0, v1, :cond_2

    .line 146
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/smartisanos/home/settings/AboutUsActivity;->openCopyDialog(Z)V

    goto :goto_0

    .line 147
    :cond_2
    const v1, 0x7f0f013f

    if-ne v0, v1, :cond_0

    .line 148
    invoke-direct {p0}, Lcom/smartisanos/home/settings/AboutUsActivity;->openOfficalWebSite()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x0

    .line 42
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 43
    invoke-virtual {p0}, Lcom/smartisanos/home/settings/AboutUsActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/smartisanos/launcher/data/Utils;->applyTransparentStatusBar(Landroid/content/Context;Landroid/view/Window;)V

    .line 44
    const/4 v1, 0x1

    invoke-static {p0, v1}, Lcom/smartisanos/launcher/data/Utils;->setMiuiStatusBarDarkMode(Landroid/app/Activity;Z)Z

    .line 45
    const v1, 0x7f040061

    invoke-virtual {p0, v1}, Lcom/smartisanos/home/settings/AboutUsActivity;->setContentView(I)V

    .line 46
    const v1, 0x7f0f012e

    invoke-virtual {p0, v1}, Lcom/smartisanos/home/settings/AboutUsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ScrollView;

    iput-object v1, p0, Lcom/smartisanos/home/settings/AboutUsActivity;->mScrollView:Landroid/widget/ScrollView;

    .line 47
    const v1, 0x7f0f0057

    invoke-virtual {p0, v1}, Lcom/smartisanos/home/settings/AboutUsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/smartisanos/home/widget/sys/Title;

    .line 48
    .local v0, "title":Lcom/smartisanos/home/widget/sys/Title;
    invoke-virtual {p0}, Lcom/smartisanos/home/settings/AboutUsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0800bd

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/smartisanos/home/widget/sys/Title;->setTitle(Ljava/lang/CharSequence;)V

    .line 49
    const v1, 0x7f0800f3

    invoke-virtual {v0, v1}, Lcom/smartisanos/home/widget/sys/Title;->setBackButtonText(I)V

    .line 50
    new-instance v1, Lcom/smartisanos/home/settings/AboutUsActivity$1;

    invoke-direct {v1, p0}, Lcom/smartisanos/home/settings/AboutUsActivity$1;-><init>(Lcom/smartisanos/home/settings/AboutUsActivity;)V

    invoke-virtual {v0, v1}, Lcom/smartisanos/home/widget/sys/Title;->setBackButtonListener(Landroid/view/View$OnClickListener;)V

    # 【维护版】此处原先 findViewById(setting_follow_weixin/weibo/website) 并直接
    # setOnClickListener、updateWeiboName()。布局里的「关注我们」模块（setting_follow_view）
    # 已随「更多 smartisan 应用」一并移除，findViewById 会返回 null，
    # 对 null 调 setOnClickListener/setText 会让本页一打开就 NPE 崩溃，故整段删除。
    # （mWeixin/mWeibo/mOfficalWeb 字段保留为构造器初始化的 null，onClick 中的对应分支成为死代码。）

    .line 63
    iget-object v1, p0, Lcom/smartisanos/home/settings/AboutUsActivity;->mScrollView:Landroid/widget/ScrollView;

    invoke-virtual {v1, v3, v3}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    # 【维护版 r25】底部居中的灰色小字版本号
    invoke-direct {p0}, Lcom/smartisanos/home/settings/AboutUsActivity;->updateVersionView()V

    .line 64
    return-void
.end method
