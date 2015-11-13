//
//  FatherVC.h
//  ChuangYiShiJie
//
//  Created by 陈钟 on 15/4/10.
//  Copyright (c) 2015年 陈钟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Defines.h"
#import "MKNetworkKit.h"
#import "DoAllNull.h"
//#import "ZZUITapGestureRecognizer.h"
#import "ZZLoadView.h"
//#import "ZZButton.h"

@interface FatherVC : UIViewController{
    MKNetworkEngine *engine;
    AppDelegate *appdelegate;
    DoAllNull *donull;
}

@property (strong, nonatomic) UIBarButtonItem *rightbar;
@property (strong, nonatomic) UIView *backview;
@property (strong, nonatomic) AppDelegate *appdelegate;
@property (strong, nonatomic) MKNetworkEngine *engine;
@property (strong, nonatomic) DoAllNull *donull;

//隐藏Tabbar
-(void)hidenTabBar;
//修改导航返回按钮
-(void)setNavLeftBtnWithImg;
//返回操作
-(void)backAction;
//修改导航右边按钮--图片类型
-(void)setNavRightBtnWithImgName:(NSString *)imagename;
//修改导航右边按钮--文字类型
-(void)setNavRightBtnWithString:(NSString *)string;
//修改导航右边按钮---view
-(void)setNarRightBtnWithView:(UIView *)view;
//右边自定义 单个按钮点击事件
-(void)rightAction;
//修改导航titleview
-(void)setNavTitleView:(UIView *)titleview;
//设置边框
-(void)setBorder:(UIView *)view size:(float)size;
//设置边框+颜色
-(void)setBorder:(UIView *)view size:(float)size withColor:(UIColor *)color;
//设置成圆形
-(void) setYuan:(UIView *)view size:(double)size;
//设置分割线
-(void)addFenGeXian:(UIView *)view andRect:(CGRect)rect;
-(void)addFenGeXian:(UIView *)view andRect:(CGRect)rect withColor:(UIColor *)color;
//设置view居中
-(void)setViewInCenterByX:(UIView *)view fatherView:(UIView *)fatherViiew;
//
-(void)setViewInCenterByX:(UIView *)view fatherViewWidth:(double)fatherWidth;

//弹出一个提示框
-(void)alertTishi:(NSString *)string withDelegate:(UIViewController *)viewcontrol;
//弹出错误提示框
-(void)alertNetWorkErrorwithDelegate:(UIViewController *)viewcontrol;

//跳转TabBar页面
-(void)tabBarSelectedIndex:(int)page;

@end
