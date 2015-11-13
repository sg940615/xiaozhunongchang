//
//  ZZStringSize.h
//  ChuangYiShiJie
//
//  Created by 陈钟 on 15/4/17.
//  Copyright (c) 2015年 陈钟. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ZZStringSize : NSObject

+(CGSize)getSizeToString:(NSString *)string forFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode) lineBreakMode;

@end
