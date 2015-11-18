//
//  PersonalInformationViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/13.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "PersonalInformationViewController.h"

@interface PersonalInformationViewController ()

@end

@implementation PersonalInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.hidesBottomBarWhenPushed = YES;
    self.title = @"基本信息";
    [self setNavLeftBtnWithImg];
    [self setNavRightBtnWithString:@"编辑"];
//    [self addFenGeXian:_PersonalScrollView andRect:CGRectMake(0, 49, ScreenWidth, 1)];
    for (int i = 0; i < 11; i ++) {
        [self addFenGeXian:_PersonalScrollView andRect:CGRectMake(0, 49 + 40 * i, ScreenWidth, 1)];
    }
    _PersonalScrollView.contentSize = CGSizeMake(0, 650);
    _PersonalScrollView.showsVerticalScrollIndicator = NO;
}

- (void)rightAction {
    
}

@end
