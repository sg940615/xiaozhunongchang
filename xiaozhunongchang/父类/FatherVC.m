//
//  FatherVC.m
//  ChuangYiShiJie
//
//  Created by 陈钟 on 15/4/10.
//  Copyright (c) 2015年 陈钟. All rights reserved.
//

#import "FatherVC.h"
#import "AppDelegate.h"
#import "ZZStringSize.h"

@interface FatherVC ()

@end

@implementation FatherVC
@synthesize rightbar,backview,appdelegate,engine,donull;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:BackGroundColor];
    appdelegate=[[UIApplication sharedApplication]delegate];
    engine=[[MKNetworkEngine alloc]initWithHostName:IP customHeaderFields:nil];
    donull = [[DoAllNull alloc]init];
    //取消自动布局
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    if (SDKLV>7.0) {
        // Close this to make normal
        self.automaticallyAdjustsScrollViewInsets = NO;
        // 透明状态栏的延伸
        self.edgesForExtendedLayout = UIRectEdgeNone;
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    } else {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav"] forBarMetrics:UIBarMetricsDefault];
//        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName : [UIFont boldSystemFontOfSize:10]};
    }
    // 添加上这一句，可以去掉导航条下边的shadowImage，就可以正常显示了
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    self.navigationController.navigationBar.translucent = NO;
    NSMutableDictionary *navTitleStype=[[NSMutableDictionary alloc]init];
    [navTitleStype setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [self.navigationController.navigationBar setTitleTextAttributes:navTitleStype];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self hidenTabBar];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//隐藏Tabbar
-(void)hidenTabBar{
    self.tabBarController.hidesBottomBarWhenPushed=YES;
}
//修改导航返回按钮
-(void)setNavLeftBtnWithImg{
    UIBarButtonItem *barbtnLeft=[[UIBarButtonItem alloc]init];
    backview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 36)];
    [backview setBackgroundColor:[UIColor clearColor]];
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, (backview.frame.size.height-20.0)/2, 16.0, 20.0)];
    [imageview setImage:[UIImage imageNamed:@"返回按键_03"]];
    [backview addSubview:imageview];
    [barbtnLeft setCustomView:backview];
    UITapGestureRecognizer *tapges=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backAction)];
    [backview addGestureRecognizer:tapges];
    self.navigationItem.leftBarButtonItem=barbtnLeft;
}
//返回操作
-(void)backAction{
    NSLog(@"Back");
    [self.navigationController popViewControllerAnimated:YES];
    [self.view removeFromSuperview];
}
//修改导航右边按钮
-(void)setNavRightBtnWithImgName:(NSString *)imagename{
    UIBarButtonItem *barbtnLeft=[[UIBarButtonItem alloc]init];
    UIView *rightview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 60.0, 44.0)];
    [rightview setBackgroundColor:[UIColor clearColor]];
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(rightview.frame.size.width-20.0, (rightview.frame.size.height-20.0)/2, 20.0, 20.0)];
    [imageview setImage:[UIImage imageNamed:imagename]];
    [rightview addSubview:imageview];
    [barbtnLeft setCustomView:rightview];
    UITapGestureRecognizer *tapges=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(rightAction)];
    [rightview addGestureRecognizer:tapges];
    self.navigationItem.rightBarButtonItem=barbtnLeft;
}
//修改导航右边按钮--文字类型
-(void)setNavRightBtnWithString:(NSString *)string{
    rightbar=[[UIBarButtonItem alloc]init];
    [rightbar setTitle:string];
    [rightbar setTarget:self];
    [rightbar setAction:@selector(rightAction)];
    NSMutableDictionary *textDic=[[NSMutableDictionary alloc]init];
    [textDic setObject:[UIFont systemFontOfSize:15.0] forKey:NSFontAttributeName];
    [textDic setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [rightbar setTitleTextAttributes:textDic forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem=rightbar;
}

//修改导航右边按钮---view
-(void)setNarRightBtnWithView:(UIView *)view{
    UIBarButtonItem *barbtnLeft=[[UIBarButtonItem alloc]init];
    [barbtnLeft setCustomView:view];
    UITapGestureRecognizer *tapges=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(rightAction)];
    [view addGestureRecognizer:tapges];
    self.navigationItem.rightBarButtonItem=barbtnLeft;
}
//右边自定义 单个按钮点击事件
-(void)rightAction{
    NSLog(@"右边导航点击事件");
}
//修改导航titleview
-(void)setNavTitleView:(UIView *)titleview{
    self.navigationItem.titleView=titleview;
}
//设置边框
-(void)setBorder:(UIView *)view size:(float)size{
    view.layer.borderColor=BorderColor.CGColor;
    view.layer.borderWidth=size;
}
//设置边框+颜色
-(void)setBorder:(UIView *)view size:(float)size withColor:(UIColor *)color{
    view.layer.borderColor=color.CGColor;
    view.layer.borderWidth=size;
}
//设置成圆形
-(void) setYuan:(UIView *)view size:(double)size{
    view.layer.masksToBounds=YES;
    view.layer.cornerRadius=size;
}
//设置分割线
-(void)addFenGeXian:(UIView *)view andRect:(CGRect)rect{
    UILabel *fengexian=[[UILabel alloc]initWithFrame:rect];
    [fengexian setBackgroundColor:BorderColor];
    [view addSubview:fengexian];
}
//设置分割线
-(void)addFenGeXian:(UIView *)view andRect:(CGRect)rect withColor:(UIColor *)color{
    UILabel *fengexian=[[UILabel alloc]initWithFrame:rect];
    [fengexian setBackgroundColor:color];
    [view addSubview:fengexian];
}
//设置view居中
-(void)setViewInCenterByX:(UIView *)view fatherView:(UIView *)fatherViiew{
    CGRect cellViewRect=view.frame;
    cellViewRect.size.width=fatherViiew.frame.size.width-cellViewRect.origin.x*2;
    [view setFrame:cellViewRect];
}
//
-(void)setViewInCenterByX:(UIView *)view fatherViewWidth:(double)fatherWidth{
    CGRect cellViewRect=view.frame;
    cellViewRect.size.width=fatherWidth-cellViewRect.origin.x*2;
    [view setFrame:cellViewRect];
}
//弹出一个提示框
-(void)alertTishi:(NSString *)string withDelegate:(UIViewController *)viewcontrol{
    if (appdelegate.thisTishiLabel) {
        appdelegate.thisTishiLabel.hidden=YES;
    }
    Reachability *r = [Reachability reachabilityWithHostname:@"www.apple.com"];
    if (r.currentReachabilityStatus==NotReachable) {
        string=@"似乎已断开与互联网的连接。\n请检查网络";
    }
    
    CGSize stringsize=CGSizeMake(viewcontrol.view.frame.size.width-20.0, viewcontrol.view.frame.size.height-20.0);
    CGSize size=[ZZStringSize getSizeToString:string forFont:[UIFont systemFontOfSize:17.0] constrainedToSize:stringsize lineBreakMode:NSLineBreakByWordWrapping | NSLineBreakByTruncatingTail];
    UILabel *alertLabel=[[UILabel alloc]initWithFrame:CGRectMake((viewcontrol.view.frame.size.width-(size.width+20.0))/2, (viewcontrol.view.frame.size.height-(size.height+20.0))/2 + 50,size.width+20,size.height+20)];
    [alertLabel setText:string];
    [alertLabel setTextColor:[UIColor whiteColor]];
    [alertLabel setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7]];
    [alertLabel setTextAlignment:NSTextAlignmentCenter];
    [alertLabel setFont:[UIFont systemFontOfSize:17.0]];
    alertLabel.numberOfLines = 10000;
    alertLabel.lineBreakMode=NSLineBreakByWordWrapping | NSLineBreakByTruncatingTail;
    [self setYuan:alertLabel size:5.0];
    [appdelegate.window addSubview:alertLabel];
    [self performSelector:@selector(removeMe:) withObject:alertLabel afterDelay:1.0];//延迟1秒钟释放掉该label
    appdelegate.thisTishiLabel=alertLabel;
}
//弹出错误提示框
-(void)alertNetWorkErrorwithDelegate:(UIViewController *)viewcontrol{
    [self alertTishi:@"网络或服务忙，请稍后重试" withDelegate:self];
}
//清除当初的提示框
-(void)removeMe:(UILabel *)sender{
    UILabel *alertLabel=(UILabel *)sender;
    [UIView animateWithDuration:0.5 animations:^(void){
        CGRect alertLabelRect=alertLabel.frame;
        alertLabelRect.origin.y=alertLabelRect.origin.y-20.0;
        [alertLabel setFrame:alertLabelRect];
        [alertLabel setAlpha:0.0];
    } completion:^(BOOL finished){
        [alertLabel removeFromSuperview];
    }];
}
//跳转TabBar页面
-(void)tabBarSelectedIndex:(int)page{
    if (appdelegate.nowTabBarViewPage!=page) {
        NSDictionary *oldDic=(NSDictionary *)[appdelegate.allTabBarSubViews objectAtIndex:appdelegate.nowTabBarViewPage];
        UIImageView *titleImg=[oldDic objectForKey:@"imageview"];
        UILabel *titleLab=[oldDic objectForKey:@"titleLabel"];
        NSString *titleImageName=[oldDic objectForKey:FooterImage];
        [titleImg setImage:[UIImage imageNamed:titleImageName]];
        [titleLab setTextColor:GrayColor];
        
        NSDictionary *nowDic=(NSDictionary *)[appdelegate.allTabBarSubViews objectAtIndex:page];
        UIImageView *nowtitleImg=[nowDic objectForKey:@"imageview"];
        UILabel *nowtitleLab=[nowDic objectForKey:@"titleLabel"];
        NSString *nowtitleImageName=[nowDic objectForKey:FooterImage];
        [nowtitleImg setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_ed",nowtitleImageName]]];
        [nowtitleLab setTextColor:FatherColor];
        appdelegate.nowTabBarViewPage=page;
        self.tabBarController.selectedIndex=page;
    }
}
@end
