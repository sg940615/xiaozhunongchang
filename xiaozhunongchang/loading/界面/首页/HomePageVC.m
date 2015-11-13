//
//  HomePageVC.m
//  PigFarm
//
//  Created by 技术部－张劲松 on 15/11/12.
//  Copyright (c) 2015年 技术部－张劲松. All rights reserved.
//

#import "HomePageVC.h"

@interface HomePageVC ()

@end

@implementation HomePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavRightBtnWithString:@"登陆"];
    [self setNavgationTitile];
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated {
    [self hidenTabBar];
}

- (void)hidenTabBar {
    self.tabBarController.hidesBottomBarWhenPushed = NO;
}

- (void)setNavgationTitile {
    double height = self.navigationController.navigationBar.frame.size.height;
    UIView *navTitleView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth-16, height)];
    [self setNavTitleView:navTitleView];
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, navTitleView.frame.size.width / 2, navTitleView.frame.size.height)];
    titleLab.text = @"首页";
    titleLab.textColor = [UIColor whiteColor];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.font = [UIFont systemFontOfSize:15];
    titleLab.center = navTitleView.center;
    [navTitleView addSubview:titleLab];

}


@end
