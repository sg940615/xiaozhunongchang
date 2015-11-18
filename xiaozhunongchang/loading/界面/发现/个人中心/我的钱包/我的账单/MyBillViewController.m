//
//  MyBillViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "MyBillViewController.h"

@interface MyBillViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MyBillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBtnWithImg];
    self.title = @"我的账单";
    // Do any additional setup after loading the view from its nib.
    _MyBillTableView.delegate = self;
    _MyBillTableView.dataSource = self;
    _MyBillTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"a"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyBillTableViewCell" owner:nil options:nil] lastObject];
    }
    [self addFenGeXian:cell andRect:CGRectMake(0, 43, ScreenWidth, 1)];
    return cell;
}

@end
