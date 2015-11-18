//
//  DiscoverVC.m
//  PigFarm
//
//  Created by 技术部－张劲松 on 15/11/12.
//  Copyright (c) 2015年 技术部－张劲松. All rights reserved.
//

#import "DiscoverVC.h"
#import "ContactUsViewController.h"
#import "PersonalCenterViewController.h"
#import "GameViewController.h"
#import "ActivityViewController.h"
#import "HotelViewController.h"
#import "FarmViewController.h"

@interface DiscoverVC ()


@end

@implementation DiscoverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createTap];
    _scrollView.contentSize = CGSizeMake(0, 600);
    _scrollView.showsVerticalScrollIndicator = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [self hidenTabBar];
}

- (void)hidenTabBar {
    self.tabBarController.hidesBottomBarWhenPushed = NO;
}

#pragma mark --- 创建点击事件
- (void)createTap {
    //酒店
    UITapGestureRecognizer *hotelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hotelTap)];
    [_hotelView addGestureRecognizer:hotelTap];
    
    //农庄
    UITapGestureRecognizer *farmTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(farmTap)];
    [_farmView addGestureRecognizer:farmTap];
    
    //众筹
    UITapGestureRecognizer *zhongchouTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zhongchouTap)];
    [_zhongchouView addGestureRecognizer:zhongchouTap];
    
    //活动
    UITapGestureRecognizer *activityTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(activityTap)];
    [_activityView addGestureRecognizer:activityTap];
    
    //游戏
    UITapGestureRecognizer *gameTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gameTap)];
    [_gameView addGestureRecognizer:gameTap];
    
    //侃侃
    UITapGestureRecognizer *talkTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(talkTap)];
    [_talkView addGestureRecognizer:talkTap];
    
    //个人中心
    UITapGestureRecognizer *personalTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(personalTap)];
    [_personalView addGestureRecognizer:personalTap];
    
    //分享App
    UITapGestureRecognizer *shareTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareTap)];
    [_shareView addGestureRecognizer:shareTap];
    
    //联系我们
    UITapGestureRecognizer *contactTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(contactTap)];
    [_contactView addGestureRecognizer:contactTap];
    
    //农场小常识
    UITapGestureRecognizer *knowledgeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(knowledgeTap)];
    [_knowledgeView addGestureRecognizer:knowledgeTap];
}

#pragma mark --- 酒店页面跳转
- (void)hotelTap {
    NSLog(@"hotel");
    HotelViewController *hotel = [[HotelViewController alloc] init];
    [self.navigationController pushViewController:hotel animated:YES];
}

#pragma mark --- 农场页面跳转
- (void)farmTap {
    NSLog(@"farm");
    FarmViewController *farm = [[FarmViewController alloc] init];
    [self.navigationController pushViewController:farm animated:YES];
}

#pragma mark --- 众筹页面跳转
- (void)zhongchouTap {
    NSLog(@"zhongchou");
}

#pragma mark --- 活动页面跳转
- (void)activityTap {
    NSLog(@"activity");
    ActivityViewController *activity = [[ActivityViewController alloc] init];
    [self.navigationController pushViewController:activity animated:YES];
}

#pragma mark --- 游戏页面跳转
- (void)gameTap {
    NSLog(@"gameTap");
    GameViewController *game = [[GameViewController alloc] init];
    [self.navigationController pushViewController:game animated:YES];
}

#pragma mark --- 侃侃页面跳转
- (void)talkTap {
    NSLog(@"talkTap");
}

#pragma mark --- 个人页面跳转
- (void)personalTap {
    NSLog(@"personalTap");
    PersonalCenterViewController *personal = [[PersonalCenterViewController alloc] init];
    [self.navigationController pushViewController:personal animated:YES];
}

#pragma mark --- 分享页面跳转
- (void)shareTap {
    NSLog(@"shareTap");
}

#pragma mark --- 联系页面跳转
- (void)contactTap {
    NSLog(@"contactTap");
    ContactUsViewController *contact = [[ContactUsViewController alloc] init];
    [self.navigationController pushViewController:contact animated:YES];
}

#pragma mark --- 农场小常识页面跳转
- (void)knowledgeTap {
    NSLog(@"knowledgeTap");
}
@end
