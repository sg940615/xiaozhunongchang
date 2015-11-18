//
//  FarmViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/17.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "FarmViewController.h"
#import "MenuListViewController.h"

@interface FarmViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation FarmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBtnWithImg];
    self.title = @"农庄";
    [self setNavRightBtnWithString:@"登陆"];
    // Do any additional setup after loading the view from its nib.
    _menuTableView.delegate = self;
    _menuTableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"a"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FarmTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 116;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuListViewController *menuList = [[MenuListViewController alloc] init];
    [self.navigationController pushViewController:menuList animated:YES];
}

@end
