//
//  ContactUsViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/13.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "ContactUsViewController.h"

@interface ContactUsViewController ()

@end

@implementation ContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setNavLeftBtnWithImg];
    self.title = @"联系我们";
    self.hidesBottomBarWhenPushed = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(telephoneLabTap)];
    [_contactView addGestureRecognizer:tap];
}

- (void)telephoneLabTap {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",_telephoneLab.text]]];
}


@end
