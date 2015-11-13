//
//  TabBarControl.m
//  XiaoLongRen
//
//  Created by admin on 15/1/26.
//  Copyright (c) 2015年 ___ZhongZhong___. All rights reserved.
//

#import "TabBarControl.h"
#import "AppDelegate.h"
#import "NavigationControl.h"
#import "HomePageVC.h"
#import "MyFarmVC.h"
#import "MallInfomationVC.h"
#import "MyfriendVC.h"
#import "AppDelegate.h"
#import "Defines.h"
//#import "LoginVC.h"
#import "DiscoverVC.h"



@interface TabBarControl (){

    AppDelegate *appdelegate;

}

@end

@implementation TabBarControl
@synthesize barView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.title = @"视图";

    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //wsq此操作删除Tabbar中的所有bar
    for (UIView* obj in self.tabBar.subviews) {
        if (obj != barView) {//_tabBarView 应该单独封装。
            [obj removeFromSuperview];
        }
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    appdelegate=[[UIApplication sharedApplication]delegate];
    
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    self.tabBar.layer.borderWidth=0.5;
    self.tabBar.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
    barView=[[UIView alloc]initWithFrame:self.tabBar.bounds];
    [barView setBackgroundColor:[UIColor clearColor]];
    [self.tabBar addSubview:barView];
    
    //首页
    NSMutableDictionary *cclettersDic=[[NSMutableDictionary alloc]init];
    HomePageVC *ccletervc=[[HomePageVC alloc]initWithNibName:@"HomePageVC" bundle:nil];
    [cclettersDic setObject:ccletervc forKey:FooterViewControl];
    [cclettersDic setObject:@"首页" forKey:FooterName];
    [cclettersDic setObject:@"footer1" forKey:FooterImage];
    NavigationControl *cclettersNav=[[NavigationControl alloc]initWithRootViewController:ccletervc];
    cclettersNav.footerStyles=cclettersDic;
    ccletervc.title=@"首页";
    
    
    //我的农场
    NSMutableDictionary *ccfriendsDic=[[NSMutableDictionary alloc]init];
    MyFarmVC *ccfriendsvc=[[MyFarmVC alloc]initWithNibName:@"MyFarmVC" bundle:nil];
    [ccfriendsDic setObject:ccfriendsvc forKey:FooterViewControl];
    [ccfriendsDic setObject:@"我的农场" forKey:FooterName];
    [ccfriendsDic setObject:@"footer2" forKey:FooterImage];
    NavigationControl *ccfriendsNav=[[NavigationControl alloc]initWithRootViewController:ccfriendsvc];
    ccfriendsNav.footerStyles=ccfriendsDic;
    ccfriendsvc.title=@"我的农场";
    
    
    //商城
    NSMutableDictionary *ccdtgameDic=[[NSMutableDictionary alloc]init];
    MallInfomationVC *ccdtgamevc=[[MallInfomationVC alloc]initWithNibName:@"MallInfomationVC" bundle:nil];
    [ccdtgameDic setObject:ccdtgamevc forKey:FooterViewControl];
    [ccdtgameDic setObject:@"商城" forKey:FooterName];
    [ccdtgameDic setObject:@"footer3" forKey:FooterImage];
    NavigationControl *ccdtgameNav=[[NavigationControl alloc]initWithRootViewController:ccdtgamevc];
    ccdtgameNav.footerStyles=ccdtgameDic;
    ccdtgamevc.title=@"商城";
    
    //我的好友
    NSMutableDictionary *ccmineDic=[[NSMutableDictionary alloc]init];
    MyfriendVC *ccminevc=[[MyfriendVC alloc]initWithNibName:@"MyfriendVC" bundle:nil];
    [ccmineDic setObject:ccminevc forKey:FooterViewControl];
    [ccmineDic setObject:@"我的好友" forKey:FooterName];
    [ccmineDic setObject:@"footer4" forKey:FooterImage];
    NavigationControl *ccmineNav=[[NavigationControl alloc]initWithRootViewController:ccminevc];
    ccmineNav.footerStyles=ccmineDic;
    ccminevc.title=@"我的好友";
    
    
    //发现
    NSMutableDictionary *discDic = [[NSMutableDictionary alloc] init];
    DiscoverVC *dicVC = [[DiscoverVC alloc] initWithNibName:@"DiscoverVC" bundle:nil];
    [discDic setObject:ccminevc forKey:FooterViewControl];
    [discDic setObject:@"发现" forKey:FooterName];
    [discDic setObject:@"footer5" forKey:FooterImage];
    NavigationControl *disNav = [[NavigationControl alloc] initWithRootViewController:dicVC];
    disNav.footerStyles = discDic;
    dicVC.title = @"发现";
    
    self.viewControllers=[[NSArray alloc]initWithObjects:cclettersNav,ccfriendsNav,ccdtgameNav,ccmineNav, disNav, nil];
    self.selectedIndex=appdelegate.nowTabBarViewPage;
    [self writeFooterView];
}


//绘制底部导航栏
-(void)writeFooterView{
    NSArray *footerViews=self.viewControllers;
    double width=ScreenWidth/footerViews.count;
    double height=barView.frame.size.height;
    [appdelegate.allTabBarSubViews removeAllObjects];
    for (int i=0; i<footerViews.count; i++) {
        NavigationControl *thisNav=(NavigationControl *)footerViews[i];
        NSDictionary *thisFooterType=thisNav.footerStyles;
        UIView *footeroneview=[[UIView alloc]initWithFrame:CGRectMake(i*width, 0, width, height)];
        footeroneview.backgroundColor = TabberColor;
        UIImageView *footerimageview=[[UIImageView alloc]initWithFrame:CGRectMake((width-25)/2, 5, 25, 25)];
        if (i==0) {
            [footerimageview setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_ed",[thisFooterType objectForKey:FooterImage]]]];
            _upLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, -3, 18, 14)];
            _upLabel.backgroundColor = [UIColor redColor];
            _upLabel.layer.masksToBounds=YES;
            _upLabel.layer.cornerRadius = 7;
//            _upLabel.text = @"99+";
            _upLabel.font = [UIFont systemFontOfSize:10];
            _upLabel.textColor = [UIColor whiteColor];
            _upLabel.textAlignment = NSTextAlignmentCenter;
            _upLabel.hidden = YES;
            [footerimageview addSubview:_upLabel];
            appdelegate.nowTabBarViewPage=i;
        }else{
            [footerimageview setImage:[UIImage imageNamed:[thisFooterType objectForKey:FooterImage]]];
            if (i==2) {
                _hotUpLabel = [[UILabel alloc]initWithFrame:CGRectMake(18, -3, 10, 10)];
                _hotUpLabel.backgroundColor = [UIColor redColor];
                _hotUpLabel.layer.masksToBounds=YES;
                _hotUpLabel.layer.cornerRadius = 5;
                _hotUpLabel.textAlignment = NSTextAlignmentCenter;
                _hotUpLabel.hidden = YES;
                [footerimageview addSubview:_hotUpLabel];

            }
        }
        [footeroneview addSubview:footerimageview];
//        footerimageview.backgroundColor = [UIColor redColor];
        UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, height-20, width, 20)];
        [titleLabel setText:[thisFooterType objectForKey:FooterName]];
        [titleLabel setFont:[UIFont systemFontOfSize:10]];
        if (i==0) {
            [titleLabel setTextColor:GrayColor];
        }else{
            [titleLabel setTextColor:[UIColor whiteColor]];
        }
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [footeroneview addSubview:titleLabel];
        
        [barView addSubview:footeroneview];
        
        UITapGestureRecognizer *tapges=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectedView:)];
        [footeroneview addGestureRecognizer:tapges];
        [tapges.view setTag:i];
        
        NSMutableDictionary *footerDic=[[NSMutableDictionary alloc]init];
        [footerDic setObject:footerimageview forKey:@"imageview"];
        [footerDic setObject:titleLabel forKey:@"titleLabel"];
        [footerDic setValuesForKeysWithDictionary:thisFooterType];
        [appdelegate.allTabBarSubViews addObject:footerDic];
        NSLog(@"----%@",appdelegate.allTabBarSubViews);
    }
}


#pragma mark -- 界面跳转
-(void)selectedView:(UITapGestureRecognizer *)tapges{
//    if (tapges.view.tag==1 || tapges.view.tag == 3) {
//        if (appdelegate.isLogin) {
//            [self doSelected:(int)tapges.view.tag];
//        }else{
//            LoginVC *loginvc=[[LoginVC alloc]initWithNibName:@"LoginVC" bundle:nil];
//            NavigationControl *loginNav=[[NavigationControl alloc]initWithRootViewController:loginvc];
//            [self presentViewController:loginNav animated:YES completion:nil];
//        }
//    }else{
        [self doSelected:(int)tapges.view.tag];
//    }
    
}

-(void)doSelected:(int)page{
    if (page!=appdelegate.nowTabBarViewPage) {
        self.selectedIndex=page;
        NSDictionary *dic=appdelegate.allTabBarSubViews[page];
        UIImageView *imageview=(UIImageView *)[dic objectForKey:@"imageview"];
        UILabel *titleLab=(UILabel *)[dic objectForKey:@"titleLabel"];
        NSString *imagename=[dic objectForKey:FooterImage];
        [imageview setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_ed",imagename]]];
        [titleLab setTextColor:GrayColor];
        
        NSDictionary *dicold=appdelegate.allTabBarSubViews[appdelegate.nowTabBarViewPage];
        UIImageView *imageviewold=(UIImageView *)[dicold objectForKey:@"imageview"];
        UILabel *titleLabold=(UILabel *)[dicold objectForKey:@"titleLabel"];
        NSString *imagenameold=[dicold objectForKey:FooterImage];
        [imageviewold setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",imagenameold]]];
        [titleLabold setTextColor:[UIColor whiteColor]];
        
        appdelegate.nowTabBarViewPage=page;
    }
}

-(void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed{
    [super setHidesBottomBarWhenPushed:hidesBottomBarWhenPushed];
    if (hidesBottomBarWhenPushed) {
        self.tabBar.hidden=YES;
    }else{
        self.tabBar.hidden=NO;
    }
}
@end
