//
//  Defines.h
//  ChuangYiShiJie
//
//  Created by 陈钟 on 15/5/18.
//  Copyright (c) 2015年 陈钟. All rights reserved.
//

#ifndef ChuangYiShiJie_Defines_h
#define ChuangYiShiJie_Defines_h
//#define IP @"cysj.coolmoban.com"
#define IP @"211.149.200.125"

#define HeadImagePath @"http://211.149.200.125/Public/images/member/"
#define ChuangImage @"http://211.149.200.125/Public/images/chuang/"
#define HOTIMAGE @"http://211.149.200.125/Public/images/cbit/"
#define ERWEIMA @"http://211.149.200.125/Public/qrcode/"
#define YIC @"http://211.149.200.125/Public/images/yic/"
#define ZKIMAGE @"http://211.149.200.125/Public/images/think/"
#define WORLDGAME @"http://211.149.200.125/Public/images/bit/"
#define SCHOOL @"http://211.149.200.125/Public/images/institutions/"
#define Banner @"http://211.149.200.125/Public/images/banner/"
#define NEWS @"http://211.149.200.125/Public/images/news/"
#define ADDRESSIMAGE @"http://211.149.200.125/Public/images/area/"

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define SDKLV [[[UIDevice currentDevice] systemVersion] floatValue]
#define color(r,g,b,p) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:p]
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define GrayColor color(125, 129, 133, 1)
#define FatherColor color(53, 172, 255, 1)
#define BorderColor color(229, 229, 229, 1)
#define BackGroundColor color(242, 242, 242, 1)
#define GreenColor color(16, 166, 97, 1)
#define OrangeColor color(253, 168, 57, 1)
#define TabberColor color(75,190,170,1)

#define FooterViewControl @"viewcontrol"
#define FooterName @"footername"
#define FooterImage @"footerimage"

#define userlogin @"userlogin_DataToLogin"//存储登录信息
#define CCLettersVCIsShow @"CCLettersVC_Is_Show_JsView"//首页是否显示介绍页面
#endif
