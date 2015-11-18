//
//  FarmMenuCell.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/17.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "FarmMenuCell.h"
#import "Defines.h"

@interface FarmMenuCell ()
{
    UILabel *lineLa;
}
@end

@implementation FarmMenuCell
@synthesize imageV,name;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setUp];
        
    }
    return self;
}

- (void)setUp {
    
    imageV = [[UIImageView alloc] init];
    [self.contentView addSubview:imageV];
    
    name = [[UILabel alloc] init];
    name.textColor = [UIColor whiteColor];
    name.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:name];
    
    lineLa = [[UILabel alloc] init];
    lineLa.backgroundColor = color(62, 65, 66, 1);
    [self.contentView addSubview:lineLa];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    imageV.frame = CGRectMake(5, 10, 30, 30);
    name.frame = CGRectMake(40, 10, 50, 30);
    lineLa.frame = CGRectMake(0, 49, 90, 1);
}

@end
