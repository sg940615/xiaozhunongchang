//
//  PersonalCenterViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/13.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "PersonalInformationViewController.h"
#import "MyWalletViewController.h"
#import "MyOrderViewController.h"
#import "MyAddressViewController.h"
#import "PlantHistoryViewController.h"
#import "MyMessageViewController.h"
#import "AccountAndSafeViewController.h"
#import "IdeaAndFeedbackViewController.h"
#import "FunctionIntroductionViewController.h"


@interface PersonalCenterViewController () <UITableViewDataSource,UITableViewDelegate>


@end

@implementation PersonalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBtnWithImg];
    self.title = @"个人中心";
    self.hidesBottomBarWhenPushed = YES;
    // Do any additional setup after loading the view from its nib.
    _PersonalCenterTableView.delegate = self;
    _PersonalCenterTableView.dataSource = self;
    _PersonalCenterTableView.tableHeaderView = _headerView;
    _PersonalCenterTableView.tableFooterView = _footerView;
    _PersonalCenterTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _PersonalCenterTableView.scrollEnabled = NO;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cid = @"a";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cid];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PersonalCenterCell" owner:nil options:nil] lastObject];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1000];
    UILabel *label = (UILabel *)[cell viewWithTag:1001];
    NSArray *nameArr = @[@"基本信息",@"我的钱包",@"我的订单",@"我的收货地址",@"种植历史",@"我的消息",@"账户与安全",@"意见反馈",@"功能介绍"];
    NSArray *imageArr = @[@"个人中心_03",@"个人中心_06",@"个人中心_08",@"个人中心_10",@"个人中心_12",@"个人中心_14",@"个人中心_16",@"个人中心_18",@"个人中心_20"];
    
    [self addFenGeXian:cell andRect:CGRectMake(0, 29, ScreenWidth, 1)];
    if (indexPath.row == 0) {
        [self addFenGeXian:cell andRect:CGRectMake(0, 0, ScreenWidth, 1)];
    }
    
    if (indexPath.section == 0) {
        imageView.image = [UIImage imageNamed:imageArr[indexPath.row]];
        label.text = nameArr[indexPath.row];
    }
    else {
        imageView.image = [UIImage imageNamed:@"个人中心_22"];
        label.text = @"关于小猪农场";
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 9;
    }
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0: {
                PersonalInformationViewController *personal = [[PersonalInformationViewController alloc] init];
                [self.navigationController pushViewController:personal animated:YES];
            }
                break;
            case 1: {
                MyWalletViewController *wallet = [[MyWalletViewController alloc] init];
                [self.navigationController pushViewController:wallet animated:YES];
            }
                break;
            case 2: {
                MyOrderViewController *order = [[MyOrderViewController alloc] init];
                [self.navigationController pushViewController:order animated:YES];
            }
                break;
            case 3: {
                MyAddressViewController *address = [[MyAddressViewController alloc] init];
                [self.navigationController pushViewController:address animated:YES];
            }
                break;
            case 4: {
                PlantHistoryViewController *plant = [[PlantHistoryViewController alloc] init];
                [self.navigationController pushViewController:plant animated:YES];
            }
                break;
            case 5: {
                MyMessageViewController *message = [[MyMessageViewController alloc] init];
                [self.navigationController pushViewController:message animated:YES];
            }
                break;
            case 6: {
                AccountAndSafeViewController *aas = [[AccountAndSafeViewController alloc] init];
                [self.navigationController pushViewController:aas animated:YES];
            }
                break;
            case 7: {
                IdeaAndFeedbackViewController *idea = [[IdeaAndFeedbackViewController alloc] init];
                [self.navigationController pushViewController:idea animated:YES];
            }
                break;
            case 8: {
                FunctionIntroductionViewController *function = [[FunctionIntroductionViewController alloc] init];
                [self.navigationController pushViewController:function animated:YES];
            }
            default:
                break;
        }
    }
}

@end
