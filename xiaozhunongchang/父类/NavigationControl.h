//
//  NavigationControl.h
//  TestASIHttp
//
//  Created by admin on 15/1/21.
//  Copyright (c) 2015年 ___ZhongZhong___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationControl : UINavigationController<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@property (strong, nonatomic) NSDictionary *footerStyles;
@property (strong, nonatomic) UIImageView *firstView;
@end
