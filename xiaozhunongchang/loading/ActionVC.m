//
//  ActionVC.m
//  ChuangYiShiJie
//
//  Created by 陈钟 on 15/5/15.
//  Copyright (c) 2015年 陈钟. All rights reserved.
//

#import "ActionVC.h"
#import "AppDelegate.h"
#import "DoAllNull.h"
#import "MKNetworkKit.h"
//#import "ChatViewController.h"
//#import "APService.h"
#import "Defines.h"

@interface ActionVC (){
    AppDelegate *appdelegate;
    MKNetworkEngine *engine;
    DoAllNull *donull;
}

@end

@implementation ActionVC
@synthesize activityView,backGroundImage;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
    appdelegate=[[UIApplication sharedApplication]delegate];
    engine=[[MKNetworkEngine alloc]initWithHostName:IP customHeaderFields:nil];
    donull=[[DoAllNull alloc]init];
//    [activityView startAnimating];

    
    [self pushHomeView];
}


//跳转到主页面
-(void)pushHomeView{
    [appdelegate rootTabBarView];
}



@end
