//
//  manageV.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "manageV.h"
#import "Defines.h"

@implementation manageV
@synthesize imageV,label;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    
    imageV = [[UIImageView alloc] init];
    imageV.backgroundColor = [UIColor clearColor];
    [self addSubview:imageV];
    
    label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = color(174, 174, 174, 1);
    [self addSubview:label];
}

- (void)layoutSubviews {
    [self superview];
    
    imageV.frame = CGRectMake(0, 0, 20, 20);
    label.frame = CGRectMake(20, 0, 30, 20);
    
}

@end
