//
//  MyAddressViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/16.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "MyAddressViewController.h"
#import "AddNewAddressViewController.h"
#import "ModifyAddressViewController.h"

@interface MyAddressViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation MyAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBtnWithImg];
    self.title = @"我的收货地址";
    // Do any additional setup after loading the view from its nib.
    _MyAddressTableView.delegate = self;
    _MyAddressTableView.dataSource = self;
    _MyAddressTableView.tableFooterView = [[UIView alloc] init];
    _MyAddressTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark --- 添加新地址
- (IBAction)AddNewAddress:(id)sender {
    AddNewAddressViewController *address = [[AddNewAddressViewController alloc] init];
    [self.navigationController pushViewController:address animated:YES];
}

#pragma mark --- 删除地址
- (IBAction)DeleteAddress:(id)sender {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"A"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyAddressTableViewCell" owner:nil options:nil] lastObject];
    }
    [self addFenGeXian:cell andRect:CGRectMake(0, 43, ScreenWidth, 1)];
    if (indexPath.row == 0) {
        [self addFenGeXian:cell andRect:CGRectMake(0, 0, ScreenWidth, 1)];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ModifyAddressViewController *modify = [[ModifyAddressViewController alloc] init];
    [self.navigationController pushViewController:modify animated:YES];
}

@end
