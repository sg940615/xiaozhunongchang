//
//  MallDetailsCell.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/16.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "MallDetailsCell.h"
#import "Defines.h"

@interface MallDetailsCell ()
{
    UILabel *lineLa;
}
@end

@implementation MallDetailsCell
@synthesize imageV,nameLa1,brankLa1,nameLa2,brankLa2;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    imageV = [[UIImageView alloc] init];
    imageV.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:imageV];
    
    nameLa1 = [[UILabel alloc] init];
    nameLa1.font = [UIFont systemFontOfSize:11];
    nameLa1.textColor = color(164, 163, 163, 1);
    [self.contentView addSubview:nameLa1];
    
    nameLa2 = [[UILabel alloc] init];
    nameLa2.font = [UIFont systemFontOfSize:11];
    nameLa2.textColor = color(164, 163, 163, 1);
    [self.contentView addSubview:nameLa2];
    
    brankLa1 = [[UILabel alloc] init];
    brankLa1.font = [UIFont systemFontOfSize:11];
    brankLa1.textColor = color(164, 163, 163, 1);
    [self.contentView addSubview:brankLa1];
    
    brankLa2 = [[UILabel alloc] init];
    brankLa2.font = [UIFont systemFontOfSize:11];
    brankLa2.textColor = color(164, 163, 163, 1);
    [self.contentView addSubview:brankLa2];
    
    lineLa = [[UILabel alloc] init];
    lineLa.backgroundColor = color(236, 236, 236, 1);
    [self.contentView addSubview:lineLa];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat Y = self.frame.size.height-1;
    
    imageV.frame = CGRectMake(0, 0, ScreenWidth, 15);
    nameLa1.frame = CGRectMake(15, 15, 100, 25);
    nameLa2.frame = CGRectMake(115, 15, 100, 25);
    brankLa1.frame = CGRectMake(15, 0, 100, 25);
    brankLa2.frame = CGRectMake(115, 0, 100, 25);
    lineLa.frame = CGRectMake(0, Y, ScreenWidth, 1);
    
}






@end
