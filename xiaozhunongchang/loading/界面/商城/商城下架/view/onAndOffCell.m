//
//  onAndOffCell.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/16.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "onAndOffCell.h"
#import "Defines.h"

@interface onAndOffCell ()
{
    UILabel *price;
    UILabel *lineLa;
}
@end

@implementation onAndOffCell
@synthesize imageV,nameLa,yieldLa,timeLa,priceLa,button;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    imageV = [[UIImageView alloc] init];
    [self.contentView addSubview:imageV];
    
    nameLa = [[UILabel alloc] init];
    nameLa.textColor = [UIColor blackColor];
    nameLa.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:nameLa];
    
    timeLa = [[UILabel alloc] init];
    timeLa.textColor = color(105, 105, 105, 1);
    timeLa.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:timeLa];
    
    yieldLa = [[UILabel alloc] init];
    yieldLa.textColor = color(105, 105, 105, 1);
    yieldLa.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:yieldLa];
    
    priceLa = [[UILabel alloc] init];
    priceLa.textColor = color(189, 0, 0, 1);
    priceLa.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:priceLa];
    
    price = [[UILabel alloc] init];
    price.textColor = color(105, 105, 105, 1);
    price.text = @"参考价格：";
    price.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:price];
    
    lineLa = [[UILabel alloc] init];
    lineLa.backgroundColor = color(214, 214, 214, 1);
    [self.contentView addSubview:lineLa];
    
    button = [[UIButton alloc] init];
    [button setTitleColor:ZCnongzhuang forState:UIControlStateNormal];
    button.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:button];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    imageV.frame = CGRectMake(10, 10, 100, 100);
    nameLa.frame = CGRectMake(120, 10, ScreenWidth-130, 20);
    timeLa.frame = CGRectMake(120, 39, ScreenWidth-130, 14);
    yieldLa.frame = CGRectMake(120, 53, ScreenWidth-130, 14);
    price.frame = CGRectMake(120, 67, 55, 14);
    priceLa.frame = CGRectMake(175, 67, ScreenWidth-185, 14);
    button.frame = CGRectMake(ScreenWidth-70, 5, 60, 20);
    lineLa.frame = CGRectMake(0, 119, ScreenWidth, 1);
}

@end
