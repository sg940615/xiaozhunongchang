//
//  ManageCell.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "ManageCell.h"
#import "Defines.h"
#import "manageV.h"

@interface ManageCell ()
{
    UILabel *lineLa;
    UILabel *price;
    manageV *offBT;
    manageV *alterBT;
}

@end

@implementation ManageCell
@synthesize imageV,nameLa,onTimeLa,reserveLa,onNumLa,alreadyLa,unReserverLa,priceLa,MatureTLa;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}


- (void)setup {
    
    lineLa = [[UILabel alloc] init];
    lineLa.backgroundColor = color(214, 214, 214, 1);
    [self addSubview:lineLa];
    
    imageV = [[UIImageView alloc] init];
    [self addSubview:imageV];
    
    nameLa = [[UILabel alloc] init];
    nameLa.font = [UIFont systemFontOfSize:14];
    [self addSubview:nameLa];
    
    MatureTLa = [[UILabel alloc] init];
    MatureTLa.textColor = color(105, 105, 105, 1);
    MatureTLa.font = [UIFont systemFontOfSize:11];
    [self addSubview:MatureTLa];
    
    onTimeLa = [[UILabel alloc] init];
    onTimeLa.textColor = color(105, 105, 105, 1);
    onTimeLa.font = [UIFont systemFontOfSize:11];
    [self addSubview:onTimeLa];
    
    reserveLa = [[UILabel alloc] init];
    reserveLa.textColor = color(105, 105, 105, 1);
    reserveLa.font = [UIFont systemFontOfSize:11];
    [self addSubview:reserveLa];
    
    onNumLa = [[UILabel alloc] init];
    onNumLa.textColor = color(105, 105, 105, 1);
    onNumLa.font = [UIFont systemFontOfSize:11];
    [self addSubview:onNumLa];
    
    alreadyLa = [[UILabel alloc] init];
    alreadyLa.textColor = color(105, 105, 105, 1);
    alreadyLa.font = [UIFont systemFontOfSize:11];
    [self addSubview:alreadyLa];
    
    unReserverLa = [[UILabel alloc] init];
    unReserverLa.textColor = color(105, 105, 105, 1);
    unReserverLa.font = [UIFont systemFontOfSize:11];
    [self addSubview:unReserverLa];
    
    price = [[UILabel alloc] init];
    price.textColor = color(105, 105, 105, 1);
    price.text = @"价格:";
    price.font = [UIFont systemFontOfSize:11];
    [self addSubview:price];
    
    priceLa = [[UILabel alloc] init];
    priceLa.textColor = color(189, 0, 0, 1);
    priceLa.font = [UIFont systemFontOfSize:12];
    [self addSubview:priceLa];

    offBT = [[manageV alloc] init];
    offBT.label.text = @"下架";
    offBT.imageV.image = [UIImage imageNamed:@"上架_03"];
    [self addSubview:offBT];
    
    alterBT = [[manageV alloc] init];
    alterBT.label.text = @"修改";
    alterBT.imageV.image = [UIImage imageNamed:@"上架_07"];
    [self addSubview:alterBT];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    imageV.frame = CGRectMake(10, 42, 100, 100);
    nameLa.frame = CGRectMake(10, 16, 100, 20);
    lineLa.frame = CGRectMake(0, 159, ScreenWidth, 1);
    MatureTLa.frame = CGRectMake(120, 42, 150, 14);
    onTimeLa.frame = CGRectMake(120, 56, 150, 14);
    reserveLa.frame = CGRectMake(120, 70, 150, 14);
    onNumLa.frame = CGRectMake(120, 84, 150, 14);
    alreadyLa.frame = CGRectMake(120, 98, 150, 14);
    unReserverLa.frame = CGRectMake(120, 112, 150, 14);
    price.frame = CGRectMake(120, 126, 35, 16);
    priceLa.frame = CGRectMake(150, 126, 150, 16);
    offBT.frame = CGRectMake(ScreenWidth - 60, 10, 50, 20);
    alterBT.frame = CGRectMake(ScreenWidth-60, 130, 50, 20);
    
}

@end
