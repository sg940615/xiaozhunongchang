//
//  MallshelvesVC.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/16.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "MallshelvesVC.h"
#import "onAndOffCell.h"

@interface MallshelvesVC () <UITableViewDataSource,UITableViewDelegate>
{
    UITableView *mainTV;
}

@end

@implementation MallshelvesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self userInterface];
}

- (void)userInterface {
    [self setNavLeftBtnWithImg];
    self.title = @"上架商品";
    
    mainTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    mainTV.delegate = self;
    mainTV.dataSource = self;
    mainTV.showsVerticalScrollIndicator = NO;
    mainTV.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:mainTV];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    onAndOffCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[onAndOffCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.imageV.image = [UIImage imageNamed:@"three1.jpg"];
    cell.nameLa.text = @"西红柿";
    cell.timeLa.text = @"预计收获时间：2015年11月";
    cell.yieldLa.text = @"预计收获产量：100kg";
    cell.priceLa.text = @"¥20.00/kg";
    [cell.button setTitle:@"马上上架" forState:UIControlStateNormal];
    
    return cell;
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
