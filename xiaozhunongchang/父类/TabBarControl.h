//
//  TabBarControl.h
//  XiaoLongRen
//
//  Created by admin on 15/1/26.
//  Copyright (c) 2015年 ___ZhongZhong___. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TabBarControl : UITabBarController{
    
}

@property (strong, nonatomic) UIView *barView;
@property (strong, nonatomic) UILabel *upLabel;
@property (strong, nonatomic) UILabel *hotUpLabel;
-(void)doSelected:(int)page;
@end
