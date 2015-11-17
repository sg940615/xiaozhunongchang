//
//  MallOneCell.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "MallOneCell.h"
#import "Defines.h"

@interface MallOneCell ()
{
    UIButton *buyBT;
    UIButton *shopCarBT;
    UILabel *price;
    UILabel *lineLa;
}
@end

@implementation MallOneCell
@synthesize imageV,nameLa,timeLa,reserveLa,alreadyLa,priceLa;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    
    imageV = [[UIImageView alloc] init];
    imageV.userInteractionEnabled = YES;
    [self.contentView addSubview:imageV];
    
    UITapGestureRecognizer *imageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTap)];
    [imageV addGestureRecognizer:imageTap];
    
    nameLa = [[UILabel alloc] init];
    nameLa.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:nameLa];
    
    timeLa = [[UILabel alloc] init];
    timeLa.textColor = color(105, 105, 105, 1);
    timeLa.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:timeLa];
    
    reserveLa = [[UILabel alloc] init];
    reserveLa.textColor = color(105, 105, 105, 1);
    reserveLa.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:reserveLa];
    
    alreadyLa = [[UILabel alloc] init];
    alreadyLa.textColor = color(105, 105, 105, 1);
    alreadyLa.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:alreadyLa];
    
    price = [[UILabel alloc] init];
    price.textColor = color(105, 105, 105, 1);
    price.font = [UIFont systemFontOfSize:12];
    price.text = @"出售价格：";
    [self.contentView addSubview:price];
    
    priceLa = [[UILabel alloc] init];
    priceLa.textColor = color(189, 0, 0, 1);
    priceLa.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:priceLa];
    
    lineLa = [[UILabel alloc] init];
    lineLa.backgroundColor = color(214, 214, 214, 1);
    [self.contentView addSubview:lineLa];
    
    buyBT = [[UIButton alloc] init];
    [buyBT setTitle:@"立即购买" forState:UIControlStateNormal];
    [buyBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buyBT.backgroundColor = ZCnongzhuang;
    [buyBT setFont:[UIFont systemFontOfSize:13]];
    [buyBT addTarget:self action:@selector(buyBT) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:buyBT];
    
    shopCarBT = [[UIButton alloc] init];
    [shopCarBT setTitle:@"加入购物车" forState:UIControlStateNormal];
    [shopCarBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    shopCarBT.backgroundColor = color(226, 88, 29, 1);
    [shopCarBT setFont:[UIFont systemFontOfSize:13]];
    [shopCarBT addTarget:self action:@selector(shopCarBT) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:shopCarBT];
    

}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    imageV.frame = CGRectMake(10, 10, 100, 100);
    nameLa.frame = CGRectMake(118, 10, 170, 20);
    timeLa.frame = CGRectMake(118, 30, 170, 15);
    reserveLa.frame = CGRectMake(118, 45, 170, 15);
    alreadyLa.frame = CGRectMake(118, 60, 170, 15);
    price.frame = CGRectMake(118, 73, 60, 15);
    priceLa.frame = CGRectMake(175, 73, 100, 15);
    buyBT.frame = CGRectMake(118, 90, 80, 20);
    shopCarBT.frame = CGRectMake(208, 90, 80, 20);
    lineLa.frame = CGRectMake(0, 0, ScreenWidth, 1);
}

- (void)buyBT {
    
}

- (void)shopCarBT {
    
}

- (void)imageTap {
    
    [self.detailsDeledate nextMalldetails];
}

@end
