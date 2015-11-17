//
//  PromotionImageV.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/13.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "PromotionImageV.h"
#import "Defines.h"

@interface PromotionImageV ()
{
    UILabel *lineLa;
    UIImageView *lconImageV;
    UILabel *czLabel;
}
@end

@implementation PromotionImageV
@synthesize imageV,label;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setup {
    
    imageV = [[UIImageView alloc] init];
    [self addSubview:imageV];
    
    label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    
    lineLa = [[UILabel alloc] init];
    lineLa.backgroundColor = color(237, 237, 237, 1);
    [self addSubview:lineLa];
    
    lconImageV = [[UIImageView alloc] init];
    lconImageV.backgroundColor = [UIColor clearColor];
    lconImageV.image = [UIImage imageNamed:@"商城-首页_10"];
    [self addSubview:lconImageV];
    
    czLabel = [[UILabel alloc] init];
    czLabel.text = @"超值";
    czLabel.textColor = [UIColor whiteColor];
    czLabel.textAlignment = NSTextAlignmentCenter;
    czLabel.font = [UIFont systemFontOfSize:8];
    [lconImageV addSubview:czLabel];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    imageV.frame = CGRectMake(10, 5, 80, 80);
    label.frame = CGRectMake(10, 90, 80, 15);
    lineLa.frame = CGRectMake(100, 0, 1, 90);
    lconImageV.frame = CGRectMake(80, 73, 20, 10);
    czLabel.frame = CGRectMake(0, 0, 20, 10);
    
}

@end
