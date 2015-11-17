//
//  BuyOrderVC.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/16.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "BuyOrderVC.h"
#import "OrderCell.h"

@interface BuyOrderVC () <UITableViewDelegate,UITableViewDataSource>
{
    UIScrollView *mainSV;
    NSArray *paraArray;
    NSArray *valueArray;
}
@end

@implementation BuyOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self userInterface];
    [self setGoods];
    [self setBuyAttribute];
    [self setRemarks];
    [self setButton];
}

- (void)userInterface {
    
    [self setNavLeftBtnWithImg];
    self.title = @"提交订单";
    self.view.backgroundColor = color(242, 242, 242, 1);
    
    mainSV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-104)];
    mainSV.contentSize = CGSizeMake(ScreenWidth, 568);
    mainSV.showsVerticalScrollIndicator = NO;
    [self.view addSubview:mainSV];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 10, ScreenWidth, 100)];
    view.backgroundColor = [UIColor whiteColor];
    [mainSV addSubview:view];
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40, 20, 20)];
    imageV.image = [UIImage imageNamed:@"地址_03"];
    [view addSubview:imageV];
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(30, 10, 100, 20)];
    name.font = [UIFont systemFontOfSize:12];
    name.text = @"收货人：xxx";
    name.textColor = color(92, 91, 91, 1);
    [view addSubview:name];
    
    UILabel *phone = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/3*2, 10, 80, 20)];
    phone.font = [UIFont systemFontOfSize:12];
    phone.text = @"1823564xxxx";
    phone.textColor = color(92, 91, 91, 1);
    [view addSubview:phone];
    
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, ScreenWidth/3*2, 40)];
    address.font = [UIFont systemFontOfSize:11];
    address.numberOfLines = 0;
    address.text = @"收货地址：四川省成都市高新区希望国际A座1708";
    address.textColor = color(92, 91, 91, 1);
    [view addSubview:address];
    
    paraArray = [[NSArray alloc] initWithObjects:@"购买数量",@"配送方式",@"配送时间", nil];
    valueArray = [[NSArray alloc] initWithObjects:@"",@"快递 到付",@"16:00前付款，预计10月2号送达", nil];
}

#pragma mark -- 设置商品信息
- (void)setGoods {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 120, ScreenWidth, 100)];
    view.backgroundColor = color(250, 250, 250, 1);
    [mainSV addSubview:view];
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    imageV.image = [UIImage imageNamed:@"two4.jpg"];
    [view addSubview:imageV];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 17, 100, 20)];
    label1.font = [UIFont systemFontOfSize:12];
    label1.text = @"纯净天然蜂蜜";
    label1.textColor = color(92, 91, 91, 1);
    [view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 37, 100, 20)];
    label2.font = [UIFont systemFontOfSize:12];
    label2.text = @"500g";
    label2.textColor = color(92, 91, 91, 1);
    [view addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(100, 57, 100, 20)];
    label3.font = [UIFont systemFontOfSize:12];
    label3.text = @"邮费：15.00";
    label3.textColor = color(92, 91, 91, 1);
    [view addSubview:label3];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-110, 17, 100, 20)];
    label4.font = [UIFont systemFontOfSize:14];
    label4.textAlignment = NSTextAlignmentRight;
    label4.text = @"¥80.00";
    label4.textColor = color(189, 0, 0, 1);
    [view addSubview:label4];
    
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-60, 37, 50, 20)];
    label5.font = [UIFont systemFontOfSize:14];
    label5.textAlignment = NSTextAlignmentRight;
    label5.text = @"x1";
    label5.textColor = color(58, 58, 58, 1);
    [view addSubview:label5];
}

- (void)setBuyAttribute {
    
    UITableView *mainTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 220, ScreenWidth, 100) style:UITableViewStylePlain   ];
    mainTV.delegate = self;
    mainTV.dataSource = self;
    mainTV.showsVerticalScrollIndicator = NO;
    mainTV.separatorStyle = UITableViewCellSelectionStyleNone;
    [mainSV addSubview:mainTV];
}

- (void)setRemarks {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 330, ScreenWidth, 140)];
    view.backgroundColor = [UIColor whiteColor];
    [mainSV addSubview:view];
    
    UITextView *textV = [[UITextView alloc] initWithFrame:CGRectMake(20, 30, ScreenWidth-40, 100)];
    [self setBorder:textV size:1 withColor:color(196, 196, 196, 1)];
    [view addSubview:textV];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 43, 20)];
    label.text = @"备注：";
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor blackColor];
    [view addSubview:label];
    
}

- (void)setButton {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight-104, ScreenWidth, 40)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UIButton *orderBT = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/2, 0, ScreenWidth/2, 40)];
    orderBT.backgroundColor = ZCnongzhuang;
    [orderBT setTitle:@"提交订单" forState:UIControlStateNormal];
    [orderBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [orderBT setFont:[UIFont systemFontOfSize:15]];
    [orderBT addTarget:self action:@selector(orderBT) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:orderBT];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, ScreenWidth/2-20, 20)];
    label.text = @"共1件，总金额¥137.00";
    label.font = [UIFont systemFontOfSize:13];
    label.textAlignment = NSTextAlignmentRight;
    [view addSubview:label];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return paraArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[OrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.nameLa.text = paraArray[indexPath.row];
    cell.valueLa.text = valueArray[indexPath.row];
    
    return cell;

}

- (void)orderBT {
    
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
