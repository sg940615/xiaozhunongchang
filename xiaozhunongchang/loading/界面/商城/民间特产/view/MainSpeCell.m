//
//  MainCell.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "MainSpeCell.h"
#import "Defines.h"

@interface MainSpeCell () <FolkDetailsDelegate>
{
    
}
@end

@implementation MainSpeCell
@synthesize oneImgV,twoImgV;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUp];
        self.backgroundColor = color(237, 237, 237, 1);
    }
    return self;
}

- (void)setUp {
    
    oneImgV = [[MainSpeV alloc] init];
    oneImgV.Detaolsdeledate = self;
    [self addSubview:oneImgV];
    
    twoImgV = [[MainSpeV alloc] init];
    twoImgV.Detaolsdeledate = self;
    [self addSubview:twoImgV];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat ImgW = (ScreenWidth - 30)/2;
    CGFloat ImgH = 2*(ScreenWidth-30)/3;
    
    oneImgV.frame = CGRectMake(10, 10, ImgW, ImgH+40);
    twoImgV.frame = CGRectMake(ImgW+20, 10, ImgW, ImgH+40);
}

- (void)nextDetails {
    
    [self.DetailsCellDelegate nextDetails];
}

@end
