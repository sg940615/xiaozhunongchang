//
//  AccountAndSafeViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/16.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "AccountAndSafeViewController.h"
#import "ChangePasswordViewController.h"
#import "PrivacySetViewController.h"

@interface AccountAndSafeViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation AccountAndSafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBtnWithImg];
    self.title = @"账户与安全";
    // Do any additional setup after loading the view from its nib.
    _AASTableView.delegate = self;
    _AASTableView.dataSource = self;
    _AASTableView.scrollEnabled = NO;
    _AASTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark --- 退出登录
- (IBAction)logOut:(id)sender {
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"a"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"a"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"账户安全";
    }
    else {
        cell.textLabel.text = @"隐私设置";
    }
    
    if (indexPath.row == 0) {
        [self addFenGeXian:cell andRect:CGRectMake(0, 43, ScreenWidth, 1)];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        ChangePasswordViewController *change = [[ChangePasswordViewController alloc] init];
        [self.navigationController pushViewController:change animated:YES];
    }
    else {
        PrivacySetViewController *privacy = [[PrivacySetViewController alloc] init];
        [self.navigationController pushViewController:privacy animated:YES];
    }
}

@end
