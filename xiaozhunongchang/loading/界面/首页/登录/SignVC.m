//
//  SignVC.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/13.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "SignVC.h"
#import "ForgetPassVC.h"
#import "RegierVC.h"

@interface SignVC ()
- (IBAction)registBT:(id)sender;
- (IBAction)signBT:(id)sender;
- (IBAction)forgetPassBT:(id)sender;

@end

@implementation SignVC
@synthesize SignV;

- (void)viewDidLoad {
    [super viewDidLoad];
    //布局控件
    [self userInterface];
}

- (void)userInterface {
    
    [self setNavLeftBtnWithImg];
    self.title = @"登录";
    [self setBorder:SignV size:1 withColor:[UIColor whiteColor]];
    

}



- (IBAction)registBT:(id)sender {
    RegierVC *vc = [[RegierVC alloc] initWithNibName:@"RegierVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)signBT:(id)sender {
}

- (IBAction)forgetPassBT:(id)sender {
    
    ForgetPassVC *Fvc = [[ForgetPassVC alloc] initWithNibName:@"ForgetPassVC" bundle:nil];
    [self.navigationController pushViewController:Fvc animated:YES];
}
@end
