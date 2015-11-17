//
//  SearchTF.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "SearchTF.h"
#import "Defines.h"

@implementation SearchTF

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:13];
        self.backgroundColor = color(230, 255, 244, 1);
//        self.background = [UIImage imageWithStretchableName:@"searchbar_textfield_background"];
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        self.leftView = image;
        //默认不显示，设置总是显示
        self.leftViewMode = UITextFieldViewModeAlways;
        //调整位置
//        self.leftView.width +=10;
        image.contentMode = UIViewContentModeCenter;
    }
    return self;
}


@end
