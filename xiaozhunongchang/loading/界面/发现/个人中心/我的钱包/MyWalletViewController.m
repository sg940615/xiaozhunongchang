//
//  MyWalletViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "MyWalletViewController.h"
#import "PayViewController.h"
#import "MyBillViewController.h"

@interface MyWalletViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation MyWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBtnWithImg];
    self.title = @"我的小猪币";
    
    // Do any additional setup after loading the view from its nib.
    _MyWalletTableView.delegate = self;
    _MyWalletTableView.dataSource = self;
    _MyWalletTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"a"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"a"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [self addFenGeXian:cell andRect:CGRectMake(0, 44, ScreenWidth, 1)];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"小猪币";
        cell.detailTextLabel.text = @"5.00";
    }
    else if (indexPath.row == 1) {
        cell.textLabel.text = @"充值";
    }
    else {
        cell.textLabel.text = @"如何获得小猪币";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0: {
            MyBillViewController *myBill = [[MyBillViewController alloc] init];
            [self.navigationController pushViewController:myBill animated:YES];
        }
            break;
        case 1: {
            PayViewController *pay = [[PayViewController alloc] init];
            [self.navigationController pushViewController:pay animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
