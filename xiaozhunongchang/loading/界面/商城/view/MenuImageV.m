//
//  MenuImageV.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/13.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "MenuImageV.h"
#import "Defines.h"

@implementation MenuImageV
@synthesize imageV,label;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)setup {
    
    imageV= [[UIImageView alloc] init];
    imageV.backgroundColor = [UIColor clearColor];
    [self addSubview:imageV];
    
    label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = color(87, 87, 87, 1);
    label.font = [UIFont systemFontOfSize:12];
    [self addSubview:label];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    imageV.frame = CGRectMake(0, 0, 60, 60);
    label.frame = CGRectMake(0, 60, 60, 20);
}

@end
