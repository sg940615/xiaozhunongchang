//
//  EvaluationCell.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/17.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "EvaluationCell.h"
#import "Defines.h"

@interface EvaluationCell ()
{
    UILabel *lineLa;
}
@end

@implementation EvaluationCell
@synthesize imageV,imageV1,imageV2,evaLa1,evaLa2,timeLa;

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
    
    imageV1 = [[UIImageView alloc] init];
    [self.contentView addSubview:imageV1];
    
    imageV2 = [[UIImageView alloc] init];
    [self.contentView addSubview:imageV2];
    
    evaLa1 = [[UILabel alloc] init];
    evaLa1.textColor = color(38, 38, 38, 1);
    evaLa1.numberOfLines = 0;
    evaLa1.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:evaLa1];
    
    evaLa2 = [[UILabel alloc] init];
    evaLa2.textColor = color(38, 38, 38, 1);
    evaLa2.numberOfLines = 0;
    evaLa2.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:evaLa2];
    
    timeLa = [[UILabel alloc] init];
    timeLa.textColor = color(154, 154, 154, 1);
    timeLa.textAlignment = NSTextAlignmentRight;
    timeLa.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:timeLa];
    
    lineLa = [[UILabel alloc] init];
    lineLa.backgroundColor = color(154, 154, 154, 1);
    [self.contentView addSubview:lineLa];
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    CGFloat Y = self.frame.size.height;
    
    imageV.frame = CGRectMake(0, 0, ScreenWidth, 20);
    imageV1.frame = CGRectMake(10, 25, 50, 50);
    imageV2.frame = CGRectMake(10, 5, 50, 50);
//    evaLa1.frame = CGRectMake(70, 25, ScreenWidth-80, 15);
//    evaLa2.frame = CGRectMake(70, 5, ScreenWidth-80, 15);
    timeLa.frame = CGRectMake(ScreenWidth/3-8, Y-23, ScreenWidth/3*2, 15);
    lineLa.frame = CGRectMake(0, Y-1, ScreenWidth, 1);
    
}

@end
