//
//  MallVC.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "MallVC.h"
#import "MallOneCell.h"
#import "ManageVC.h"
#import "MalldetailsVC.h"

@interface MallVC () <UITableViewDataSource,UITableViewDelegate,MalldetailsDeledate>
{
    UITableView *mainTV;
}

@end

@implementation MallVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self userInterface];
}

- (void)userInterface {
    
    [self setNavLeftBtnWithImg];
    
    [self setNavRightBtnWithString:@"管理"];
    
    mainTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    mainTV.delegate = self;
    mainTV.dataSource = self;
    mainTV.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:mainTV];
    
    UIButton *shopCarBT = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-50, ScreenHeight-134, 40, 40)];
    shopCarBT.backgroundColor = [UIColor clearColor];
    [shopCarBT setImage:[UIImage imageNamed:@"民间特产详情_07"] forState:UIControlStateNormal];
    [shopCarBT addTarget:self action:@selector(shopCarBT) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shopCarBT];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    MallOneCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MallOneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.detailsDeledate = self;
    cell.imageV.image = [UIImage imageNamed:@"three1.jpg"];
    cell.nameLa.text = @"雪梨";
    cell.timeLa.text = @"预计收货时间：2015年11月";
    cell.reserveLa.text = @"可预订量：30kg";
    cell.alreadyLa.text = @"已预订：15kg";
    cell.priceLa.text = @"￥20.00/kg";
    
    return cell;
}

- (void)nextMalldetails {
    
    MalldetailsVC *detailsVC = [[MalldetailsVC alloc] initWithNibName:@"MalldetailsVC" bundle:nil];
    [self.navigationController pushViewController:detailsVC animated:YES];

}

- (void)rightAction {
    
    ManageVC *Mvc =[[ManageVC alloc] initWithNibName:@"ManageVC" bundle:nil];
    [self.navigationController pushViewController:Mvc animated:YES];
}

- (void)shopCarBT {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
