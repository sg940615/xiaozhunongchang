//
//  RegierVC.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/13.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "RegierVC.h"

@interface RegierVC ()
- (IBAction)regierBT:(id)sender;
- (IBAction)agreeBT:(id)sender;
- (IBAction)signBT:(id)sender;


@end

@implementation RegierVC
@synthesize mainV;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self userInterface];
}

//布局控件
- (void)userInterface {
    
    [self setNavLeftBtnWithImg];
    self.title = @"注册";
    [self setBorder:mainV size:1 withColor:[UIColor whiteColor]];
    
}



- (IBAction)regierBT:(id)sender {
}

- (IBAction)agreeBT:(id)sender {
}

- (IBAction)signBT:(id)sender {
}
@end
