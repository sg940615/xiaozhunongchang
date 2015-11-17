//
//  MallInfomationVC.m
//  PigFarm
//
//  Created by 技术部－张劲松 on 15/11/12.
//  Copyright (c) 2015年 技术部－张劲松. All rights reserved.
//

#import "MallInfomationVC.h"
#import "MenuImageV.h"
#import "SpecialtyVC.h"
#import "MallVC.h"
#import "PromotionImageV.h"
#import "SearchTF.h"

@interface MallInfomationVC ()
{
    UIScrollView *mainSV;
    UIScrollView *oneSV;
    UIScrollView *twoSV;
    UIView *oneV;
    UIView *twoV;
}

@end

@implementation MallInfomationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self userInterface];
    [self setMenu];
    [self setPromoImageV];
}

- (void)viewWillAppear:(BOOL)animated {
    [self hidenTabBar];
}

- (void)hidenTabBar {
    self.tabBarController.hidesBottomBarWhenPushed = NO;
}
//布局控件
- (void)userInterface {
    
    SearchTF *TF = [[SearchTF alloc] initWithFrame:CGRectMake(ScreenWidth/6, 0, ScreenWidth/6*4, 35)];
    TF.placeholder = @"搜一搜更精彩...";
    
    self.navigationItem.titleView = TF;
    
    mainSV = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    mainSV.contentSize = CGSizeMake(ScreenWidth, ScreenHeight*2);
    mainSV.backgroundColor = color(237, 237, 237, 1);
    [self.view addSubview:mainSV];
    
    oneV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 250)];
    oneV.backgroundColor = [UIColor whiteColor];
    [mainSV addSubview:oneV];
    
    oneSV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 150)];
    oneSV.contentSize = CGSizeMake(ScreenWidth*3, 150);
    oneSV.backgroundColor = [UIColor greenColor];
    oneSV.pagingEnabled = YES;
    oneSV.bounces = NO;
    [oneV addSubview:oneSV];
    [self setOneImageV];
    
    UIPageControl *onePC = [[UIPageControl alloc] initWithFrame:CGRectMake(ScreenWidth/4*3-40, 120, 80, 30)];
    onePC.numberOfPages = 3;
    onePC.currentPageIndicatorTintColor = ZCnongzhuang;
    onePC.pageIndicatorTintColor = [UIColor clearColor];
    [oneV addSubview:onePC];
    
    twoV = [[UIView alloc] initWithFrame:CGRectMake(0, 260, ScreenWidth, 150)];
    twoV.backgroundColor = [UIColor whiteColor];
    [mainSV addSubview:twoV];
    
    twoSV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, ScreenWidth, 110)];
    twoSV.contentSize = CGSizeMake(ScreenWidth*3, 110);
    twoSV.showsHorizontalScrollIndicator = NO;
    twoSV.bounces = NO;
    [twoV addSubview:twoSV];
    
}
//设置菜单栏
#pragma mark -- 设置菜单栏
- (void)setMenu {
    
    MenuImageV *specialV = [[MenuImageV alloc] initWithFrame:CGRectMake(ScreenWidth/3-30, 160, 60, 80)];
    specialV.imageV.image = [UIImage imageNamed:@"商城-首页_03"];
    specialV.label.text = @"地方特产";
    [oneV addSubview:specialV];
    
    UITapGestureRecognizer *specialTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(specialTap)];
    [specialV addGestureRecognizer:specialTap];
    
    MenuImageV *mallV = [[MenuImageV alloc] initWithFrame:CGRectMake(ScreenWidth/3*2-30, 160, 60, 80)];
    mallV.imageV.image = [UIImage imageNamed:@"商城-首页_05"];
    mallV.label.text = @"个人商城";
    [oneV addSubview:mallV];
    
    UITapGestureRecognizer *mallVTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mallTap)];
    [mallV addGestureRecognizer:mallVTap];
    
    
}
//设置第一个滚动视图图片
#pragma mark -- 第一个滚动视图
- (void)setOneImageV {
    
    for (int i = 0; i < 3; i++) {
        UIImageView *oneImageV = [[UIImageView alloc] initWithFrame:CGRectMake(i*ScreenWidth, 0, ScreenWidth, 150)];
        oneImageV.image = [UIImage imageNamed:@"one1.jpg"];
        [oneSV addSubview:oneImageV];
    }
    
}
//设置限时促销图片
#pragma mark -- 设置限时促销图片（滚动视图）
- (void)setPromoImageV {
    
    UILabel *ProL = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 60, 20)];
    ProL.text = @"限时促销";
    ProL.font = [UIFont systemFontOfSize:14];
    ProL.textColor = color(213, 0, 0, 1);
    [twoV addSubview:ProL];
    
    for (int i = 0; i < 6; i++) {
        PromotionImageV *ProV = [[PromotionImageV alloc] initWithFrame:CGRectMake(i*101, 0, 101, 110)];
        ProV.imageV.image = [UIImage imageNamed:@"two1.jpg"];
        ProV.label.text = @"￥22.9";
        [twoSV addSubview:ProV];
    }
    
}

//点击地方特产
#pragma mark -- 点击地方特产
- (void)specialTap {
    
    SpecialtyVC *Svc = [[SpecialtyVC alloc] initWithNibName:@"SpecialtyVC" bundle:nil];
    Svc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:Svc animated:YES];
    
}
//点击个人商城
#pragma mark -- 点击个人商城
- (void)mallTap {
    MallVC *Mvc = [[MallVC alloc] initWithNibName:@"MallVC" bundle:nil];
    Mvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:Mvc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
