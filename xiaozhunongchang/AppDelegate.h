//
//  AppDelegate.h
//  xiaozhunongchang
//
//  Created by 技术部－张劲松 on 15/11/12.
//  Copyright (c) 2015年 技术部－张劲松. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarControl.h"
#import "ActionVC.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TabBarControl *tabBarControl;
@property (strong, nonatomic) ActionVC *actionvc;
@property (assign, nonatomic) BOOL isLogin;//是否已经登录
@property (assign, nonatomic) int userId;//存贮当前用户的ID值
@property (strong, nonatomic) NSMutableDictionary *userDataDic;//存贮当前用户的用户信息
@property (strong, nonatomic) UILabel *thisTishiLabel;//当前提示框
@property (strong, nonatomic) NSString * xild;

@property (assign, nonatomic) int nowTabBarViewPage;//当前的TabBarViewSelectedIndex
@property (strong, nonatomic) NSMutableArray *allTabBarSubViews;//存储TabBar中的所有元素



//root到Tabbarviewcontrol
-(void)rootTabBarView;
@end

