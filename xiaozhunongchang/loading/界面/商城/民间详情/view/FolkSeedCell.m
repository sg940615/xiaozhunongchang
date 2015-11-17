//
//  FolkSeedCell.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/16.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "FolkSeedCell.h"
#import "Defines.h"

@interface FolkSeedCell ()
{
    UILabel *lineLa;
}
@end

@implementation FolkSeedCell
@synthesize imageV,nameLa,brankLa;

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
    
    nameLa = [[UILabel alloc] init];
    nameLa.font = [UIFont systemFontOfSize:11];
    nameLa.textColor = [UIColor blackColor];
    [self.contentView addSubview:nameLa];
    
    brankLa = [[UILabel alloc] init];
    brankLa.font = [UIFont systemFontOfSize:11];
    brankLa.textColor = [UIColor blackColor];
    [self.contentView addSubview:brankLa];
    
    lineLa = [[UILabel alloc] init];
    lineLa.backgroundColor = color(236, 236, 236, 1);
    [self.contentView addSubview:lineLa];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat Y = self.frame.size.height-1;
    
    imageV.frame = CGRectMake(0, 0, ScreenWidth, 20);
    brankLa.frame = CGRectMake(5, 23, ScreenWidth-10, 15);
    nameLa.frame = CGRectMake(5, 8, ScreenWidth-10, 15);
    lineLa.frame = CGRectMake(0, Y, ScreenWidth, 1);
}

@end
