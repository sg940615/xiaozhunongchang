//
//  ForgetPassVC.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/13.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "ForgetPassVC.h"
#import "EmailVC.h"

@interface ForgetPassVC ()
- (IBAction)emailBT:(id)sender;

@end

@implementation ForgetPassVC
@synthesize mainV;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self userInterface];
}

//布局控件
- (void)userInterface {
    
    [self setNavLeftBtnWithImg];
    self.title = @"找回密码";
    [self setBorder:mainV size:1 withColor:[UIColor whiteColor]];
    [self setBorder:mainV size:1 withColor:[UIColor whiteColor]];
    
}

//邮箱验证
- (IBAction)emailBT:(id)sender {
    
    EmailVC *Evc = [[EmailVC alloc] initWithNibName:@"EmailVC" bundle:nil];
    [self.navigationController pushViewController:Evc animated:YES];
    
}
@end
