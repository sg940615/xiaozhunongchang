//
//  PlantHistoryViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/16.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "PlantHistoryViewController.h"

@interface PlantHistoryViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation PlantHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBtnWithImg];
    self.title = @"种植历史";
    // Do any additional setup after loading the view from its nib.
    _PlantHistoryTableView.delegate = self;
    _PlantHistoryTableView.dataSource = self;
    _PlantHistoryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark --- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"a"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PlantHistoryTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

#pragma mark --- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

@end
