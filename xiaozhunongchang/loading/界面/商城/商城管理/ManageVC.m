//
//  ManageVC.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "ManageVC.h"
#import "ManageCell.h"
#import "shopMallVC.h"
#import "MallshelvesVC.h"

@interface ManageVC () <UITableViewDataSource,UITableViewDelegate>
{
    UITableView *mainTV;
}
@end

@implementation ManageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self userInterface];
    
}

- (void)userInterface {
    
    [self setNavLeftBtnWithImg];
    self.title = @"管理";
    
    mainTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-104) style:UITableViewStylePlain];
    mainTV.delegate = self;
    mainTV.dataSource = self;
    mainTV.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:mainTV];
    
    UIButton *shelvesBT = [[UIButton alloc] initWithFrame:CGRectMake(0, ScreenHeight-104, ScreenWidth/2, 40)];
    shelvesBT.backgroundColor = color(226, 88, 29, 1);
    [shelvesBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [shelvesBT setFont:[UIFont systemFontOfSize:15]];
    [shelvesBT setTitle:@"上架商品" forState:UIControlStateNormal];
    [shelvesBT addTarget:self action:@selector(shelvesBT) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shelvesBT];
    
    UIButton *offBT = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/2, ScreenHeight-104, ScreenWidth/2, 40)];
    offBT.backgroundColor = color(164, 163, 163, 1);
    [offBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [offBT setFont:[UIFont systemFontOfSize:15]];
    [offBT setTitle:@"下架商品" forState:UIControlStateNormal];
    [offBT addTarget:self action:@selector(offBT) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:offBT];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 160;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"cell";
    ManageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ManageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.imageV.image = [UIImage imageNamed:@"three1.jpg"];
    cell.nameLa.text = @"雪梨";
    cell.MatureTLa.text = @"预计收获时间：2015年11月";
    cell.onTimeLa.text = @"上架时间：2015年9月7日";
    cell.reserveLa.text = @"预计收获量：60kg";
    cell.onNumLa.text = @"上架总量：30kg";
    cell.alreadyLa.text = @"已预订：15kg";
    cell.unReserverLa.text = @"未预订：15kg";
    cell.priceLa.text = @"￥20.00/kg";
    
    return cell;
}

- (void)shelvesBT {
    
    MallshelvesVC *shelvesVC = [[MallshelvesVC alloc] initWithNibName:@"MallshelvesVC" bundle:nil];
    [self.navigationController pushViewController:shelvesVC animated:YES];
}

- (void)offBT {
    
    shopMallVC *shopVC = [[shopMallVC alloc] initWithNibName:@"shopMallVC" bundle:nil];
    [self.navigationController pushViewController:shopVC animated:YES];
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
