//
//  MallshelvesVC.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/16.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "MallshelvesVC.h"
#import "onAndOffCell.h"

@interface MallshelvesVC () <UITableViewDataSource,UITableViewDelegate,MSdelegate>
{
    UITableView *mainTV;
    UIView *view;
}

@end

@implementation MallshelvesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self userInterface];
    [self setPopUp];
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

#pragma mark -- 设置弹出框
- (void)setPopUp {
    
    view = [[UIView alloc] initWithFrame:CGRectMake(50, 150, ScreenWidth-100, 120)];
    view.backgroundColor = color(29, 171, 152, 0.7);
    view.hidden = YES;
    [self.view addSubview:view];
    
    UILabel *numLa = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 70, 15)];
    numLa.text = @"上架数量：";
    numLa.font = [UIFont systemFontOfSize:13];
    numLa.textColor = [UIColor whiteColor];
    [view addSubview:numLa];
    
    UILabel *priceLa = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 70, 15)];
    priceLa.text = @"产品单价：";
    priceLa.font = [UIFont systemFontOfSize:13];
    priceLa.textColor = [UIColor whiteColor];
    [view addSubview:priceLa];
    
    CGFloat W = view.frame.size.width;
    
    UIButton *cancelBT = [[UIButton alloc] initWithFrame:CGRectMake( W/3-20, 75, 40, 25)];
    cancelBT.font = [UIFont systemFontOfSize:13];
    [cancelBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelBT setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBT addTarget:self action:@selector(cancelBT) forControlEvents:UIControlEventTouchUpInside];
    [self setBorder:cancelBT size:1 withColor:[UIColor whiteColor]];
    [view addSubview:cancelBT];
    
    UIButton *deterBT = [[UIButton alloc] initWithFrame:CGRectMake( W/3*2-20, 75, 40, 25)];
    deterBT.font = [UIFont systemFontOfSize:13];
    [deterBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [deterBT setTitle:@"确定" forState:UIControlStateNormal];
    [deterBT addTarget:self action:@selector(deterBT) forControlEvents:UIControlEventTouchUpInside];
    [self setBorder:deterBT size:1 withColor:[UIColor whiteColor]];
    [view addSubview:deterBT];

    
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
    cell.MSdelegate = self;
    cell.imageV.image = [UIImage imageNamed:@"three1.jpg"];
    cell.nameLa.text = @"西红柿";
    cell.timeLa.text = @"预计收获时间：2015年11月";
    cell.yieldLa.text = @"预计收获产量：100kg";
    cell.priceLa.text = @"¥20.00/kg";
    [cell.button setTitle:@"马上上架" forState:UIControlStateNormal];
    
    return cell;
}


- (void)nextPopUpBox {
    
    view.hidden = NO;
}

- (void)cancelBT {
    view.hidden = YES;
}

- (void)deterBT {
    view.hidden = YES;
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
