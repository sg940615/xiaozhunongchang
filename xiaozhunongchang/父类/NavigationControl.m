//
//  NavigationControl.m
//  TestASIHttp
//
//  Created by admin on 15/1/21.
//  Copyright (c) 2015年 ___ZhongZhong___. All rights reserved.
//

#import "NavigationControl.h"
#import "AppDelegate.h"
#import "Defines.h"

@implementation NavigationControl
@synthesize footerStyles;

- (void)viewDidLoad
{
    [super viewDidLoad];
    __weak NavigationControl *weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
}
// Hijack the push method to disable the gesture

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
        self.interactivePopGestureRecognizer.enabled = NO;
    if(animated){

        self.tabBarController.tabBar.hidden=YES;
        
        //遮挡层--禁止在动画过程中可以再次点击push
        UIView *zhedangview=[[UIView alloc]initWithFrame:self.view.bounds];
        [zhedangview setBackgroundColor:[UIColor clearColor]];
        [self.view addSubview:zhedangview];
        
        //取消自动布局
        if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0){
            self.edgesForExtendedLayout = UIRectEdgeBottom;
        }
        CGRect viewcontrolRect=viewController.view.frame;
        viewcontrolRect.origin.x=ScreenWidth;
        if (SDKLV<7.0) {
            viewcontrolRect.origin.y=self.navigationBar.frame.size.height;
        }else{
            viewcontrolRect.origin.y=self.navigationBar.frame.size.height+20;
        }
        viewcontrolRect.size.width=ScreenWidth;
        if (self.tabBarController.tabBar.hidden) {
            viewcontrolRect.size.height=ScreenHeight-viewcontrolRect.origin.y;
        }else{
            viewcontrolRect.size.height=ScreenHeight-viewcontrolRect.origin.y-self.tabBarController.tabBar.frame.size.height;
        }
        
        [viewController.view setFrame:viewcontrolRect];
        
        [self.view addSubview:viewController.view];
        
        viewController.view.layer.shadowOffset=CGSizeMake(0, 5);
        viewController.view.layer.shadowRadius=5.0;
        viewController.view.layer.shadowColor=[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0].CGColor;
        viewController.view.layer.shadowOpacity=0.5;
        
        [UIView animateWithDuration:0.2 animations:^{
            CGRect viewcontrolRect=viewController.view.frame;
            viewcontrolRect.origin.x=0;
            [viewController.view setFrame:viewcontrolRect];
            self.navigationItem.titleView.alpha=0.0;
            self.navigationItem.leftBarButtonItem.customView.alpha=0.0;
            self.navigationItem.rightBarButtonItem.customView.alpha=0.0;
        }completion:^(BOOL finished){
            viewController.view.layer.shadowOffset=CGSizeMake(0, 0);
            viewController.view.layer.shadowRadius=0.0;
            viewController.view.layer.shadowColor=[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0].CGColor;
            viewController.view.layer.shadowOpacity=0.0;
            //取消自动布局
            if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0){
                self.edgesForExtendedLayout = UIRectEdgeNone;
            }
            self.tabBarController.tabBar.hidden=NO;
            [viewController.view removeFromSuperview];
            [zhedangview removeFromSuperview];
            self.navigationItem.titleView.alpha=1.0;
            self.navigationItem.leftBarButtonItem.customView.alpha=1.0;
            self.navigationItem.rightBarButtonItem.customView.alpha=1.0;
            
            [super pushViewController:viewController animated:NO];
        }];
    }else{
        [super pushViewController:viewController animated:NO];
    }
    
}

#pragma mark UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate
{
    // Enable the gesture again once the new controller is shown
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
        self.interactivePopGestureRecognizer.enabled = YES;
}

@end
