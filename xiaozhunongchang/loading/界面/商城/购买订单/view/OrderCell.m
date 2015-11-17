//
//  OrderCell.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/16.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "OrderCell.h"
#import "Defines.h"

@interface OrderCell ()
{
    UILabel *lineLa;
}
@end

@implementation OrderCell
@synthesize nameLa,valueLa;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    nameLa = [[UILabel alloc] init];
    nameLa.textColor = color(92, 91, 91, 1);
    nameLa.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:nameLa];
    
    valueLa = [[UILabel alloc] init];
    valueLa.textColor = color(92, 91, 91, 1);
    valueLa.textAlignment = NSTextAlignmentRight;
    valueLa.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:valueLa];
    
    lineLa = [[UILabel alloc] init];
    lineLa.backgroundColor = color(196, 196, 196, 1);
    [self.contentView addSubview:lineLa];
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    nameLa.frame = CGRectMake(10, 10, 80, 20);
    valueLa.frame = CGRectMake(ScreenWidth/3-10, 10, ScreenWidth/3*2, 20);
    lineLa.frame = CGRectMake(0, 29, ScreenWidth, 1);
}

@end
