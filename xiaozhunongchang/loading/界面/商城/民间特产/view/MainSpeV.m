//
//  MainV.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "MainSpeV.h"
#import "Defines.h"

@implementation MainSpeV
@synthesize imageV,nameLa,priceLa,salesLa;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setUp {
    
    imageV = [[UIImageView alloc] init];
    imageV.userInteractionEnabled = YES;
    [self addSubview:imageV];
    
    UITapGestureRecognizer *imageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTap)];
    [imageV addGestureRecognizer:imageTap];
    
    nameLa = [[UILabel alloc] init];
    nameLa.font = [UIFont systemFontOfSize:13];
    [self addSubview:nameLa];
    
    priceLa = [[UILabel alloc] init];
    priceLa.font = [UIFont systemFontOfSize:13];
    priceLa.textColor = color(193, 0, 0, 1);
    [self addSubview:priceLa];
    
    salesLa = [[UILabel alloc] init];
    salesLa.textColor = color(147, 147, 147, 1);
    salesLa.font = [UIFont systemFontOfSize:11];
    salesLa.textAlignment = NSTextAlignmentRight;
    [self addSubview:salesLa];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat ImgW = (ScreenWidth - 30)/2;
    CGFloat ImgH = 2*(ScreenWidth-30)/3;
    
    imageV.frame = CGRectMake(0, 0, ImgW, ImgH);
    nameLa.frame = CGRectMake(0, ImgH+3, ImgW/2, 17);
    priceLa.frame = CGRectMake(0, ImgH+20, ImgW/2, 17);
    salesLa.frame = CGRectMake(ImgW/2, ImgH+20, ImgW/2, 17);
    
}

- (void)imageTap {
    
    [self.Detaolsdeledate nextDetails];
}

@end
