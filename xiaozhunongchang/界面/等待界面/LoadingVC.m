//
//  LoadingVC.m
//  PigFarm
//
//  Created by 技术部－张劲松 on 15/11/12.
//  Copyright (c) 2015年 技术部－张劲松. All rights reserved.
//

#import "LoadingVC.h"

#import "AppDelegate.h"
#import "DoAllNull.h"
#import "MKNetworkKit.h"
//#import "ChatViewController.h"
//#import "APService.h"



@interface LoadingVC (){
    AppDelegate *appdelegate;
    MKNetworkEngine *engine;
    DoAllNull *donull;
}

@end

@implementation LoadingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    appdelegate=[[UIApplication sharedApplication]delegate];
    // Do any additional setup after loading the view from its nib.
//    [NSThread sleepForTimeInterval:2.0];
    [self pushHomeView];
    self.hidesBottomBarWhenPushed = NO;
}


//跳转到主页面
-(void)pushHomeView{
    [appdelegate rootTabBarView];
}


@end
