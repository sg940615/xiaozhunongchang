//
//  AppDelegate.m
//  xiaozhunongchang
//
//  Created by 技术部－张劲松 on 15/11/12.
//  Copyright (c) 2015年 技术部－张劲松. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize tabBarControl,actionvc,isLogin,thisTishiLabel,nowTabBarViewPage,allTabBarSubViews,userId,userDataDic;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    isLogin=NO;
    nowTabBarViewPage=0;
    allTabBarSubViews=[[NSMutableArray alloc]init];
    userDataDic=[[NSMutableDictionary alloc]init];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    tabBarControl=[[TabBarControl alloc]init];
    actionvc=[[ActionVC alloc]initWithNibName:@"ActionVC" bundle:nil];
    self.window.rootViewController=actionvc;
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    
    
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


//禁用横屏
- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    //    return UIInterfaceOrientationMaskLandscape;
    return UIInterfaceOrientationMaskPortrait;
}
//root到Tabbarviewcontrol
-(void)rootTabBarView{
    self.window.rootViewController=tabBarControl;
    [self.window bringSubviewToFront:actionvc.view];
}

@end
