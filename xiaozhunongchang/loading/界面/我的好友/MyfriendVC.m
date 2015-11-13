//
//  MyfriendVC.m
//  PigFarm
//
//  Created by 技术部－张劲松 on 15/11/12.
//  Copyright (c) 2015年 技术部－张劲松. All rights reserved.
//

#import "MyfriendVC.h"

@interface MyfriendVC ()

@end

@implementation MyfriendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated {
    [self hidenTabBar];
}

- (void)hidenTabBar {
    self.tabBarController.hidesBottomBarWhenPushed = NO;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
