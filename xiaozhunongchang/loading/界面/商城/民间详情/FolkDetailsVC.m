//
//  FolkDetailsVC.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "FolkDetailsVC.h"
#import "FolkSeedCell.h"
#import "BuyOrderVC.h"
#import "EvaluationCell.h"
#import "ZZStringSize.h"

@interface FolkDetailsVC () <UITableViewDataSource,UITableViewDelegate>
{
    UIScrollView *mainSV;
    UIView *oneV;
    UITableView *seedTV;
    NSArray *paraArray;
    UITableView *evaTV;
}
@end

@implementation FolkDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self userInterface];
    [self setButton];
    [self setSeed];
    [self setDetails];
    [self setEvaluation];
}
//布局UIScrollView
- (void)userInterface {
    [self setNavLeftBtnWithImg];
    self.title = @"天然蜂蜜";
    
    mainSV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-104)];
    mainSV.contentSize = CGSizeMake(ScreenWidth, 1440);
    mainSV.backgroundColor = color(236, 236, 236, 1);
    mainSV.showsVerticalScrollIndicator = NO;
    [self.view addSubview:mainSV];
    
    oneV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 230)];
    oneV.backgroundColor = [UIColor whiteColor];
    [mainSV addSubview:oneV];
    
    UIImageView *oneImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 150)];
    oneImgV.image = [UIImage imageNamed:@"two2.jpg"];
    [oneV addSubview:oneImgV];
    
    UILabel *nameLa = [[UILabel alloc] initWithFrame:CGRectMake(12, 155, ScreenWidth-24, 20)];
    nameLa.text = @"纯天然蜂蜜";
    nameLa.textColor = color(76, 76, 76, 1);
    nameLa.font = [UIFont systemFontOfSize:14];
    [oneV addSubview:nameLa];
    
    UILabel *piceLa = [[UILabel alloc] initWithFrame:CGRectMake(12, 175, ScreenWidth-24, 20)];
    piceLa.text = @"¥80.00";
    piceLa.textColor = color(188, 0, 0, 1);
    piceLa.font = [UIFont systemFontOfSize:14];
    [oneV addSubview:piceLa];
    
    UILabel *expressLa = [[UILabel alloc] initWithFrame:CGRectMake(12, 210, 80, 15)];
    expressLa.text = @"快递：15.00";
    expressLa.textColor = color(131, 131, 131, 1);
    expressLa.font = [UIFont systemFontOfSize:11];
    [oneV addSubview:expressLa];

    UILabel *addressLa= [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-92, 210, 80, 15)];
    addressLa.text = @"贵州遵义";
    addressLa.textColor = color(131, 131, 131, 1);
    addressLa.textAlignment = NSTextAlignmentRight;
    addressLa.font = [UIFont systemFontOfSize:11];
    [oneV addSubview:addressLa];
    
    UILabel *salesLa= [[UILabel alloc] init];
    salesLa.text = @"月销量：324";
    salesLa.textColor = color(131, 131, 131, 1);
    salesLa.textAlignment = NSTextAlignmentCenter;
    [salesLa sizeToFit];
    salesLa.font = [UIFont systemFontOfSize:11];
    salesLa.frame = CGRectMake((ScreenWidth-salesLa.frame.size.width)/2, 210, salesLa.frame.size.width, 15);
    [oneV addSubview:salesLa];
    
    paraArray = [[NSArray alloc] initWithObjects:@"品牌：纯天然",@"净含量：500g",@"包装方式：瓶装", nil];
   
}

#pragma mark -- 设置产品详情
- (void)setDetails {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 350, ScreenWidth, 800)];
    [mainSV addSubview:view];
    
    for (int i=0; i<2; i++) {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 400*i, ScreenWidth, 400)];
        imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"xiangq%d.jpg",i+1]];
        [view addSubview:imageV];
    }
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
    imageV.image = [UIImage imageNamed:@"民间特产详情_024"];
    imageV.backgroundColor = [UIColor clearColor];
    [view addSubview:imageV];
}

#pragma mark -- 设置底部Button
- (void)setButton {
    UIButton *shopCarBT = [[UIButton alloc] initWithFrame:CGRectMake(0, ScreenHeight-104, ScreenWidth/2, 40)];
    shopCarBT.backgroundColor = color(173, 173, 173, 1);
    [shopCarBT setTitle:@"加入购物车" forState:UIControlStateNormal];
    [shopCarBT setFont:[UIFont systemFontOfSize:15]];
    [shopCarBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [shopCarBT addTarget:self action:@selector(shopCarBT) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shopCarBT];
    
    UIButton *buyBT= [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/2, ScreenHeight-104, ScreenWidth/2, 40)];
    buyBT.backgroundColor = color(29, 170, 151, 1);
    [buyBT setTitle:@"立即购买" forState:UIControlStateNormal];
    [buyBT setFont:[UIFont systemFontOfSize:15]];
    [buyBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buyBT addTarget:self action:@selector(buyBT) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buyBT];
}
#pragma mark -- 设置种子参数tabelview
- (void)setSeed {
    
    seedTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 240, ScreenWidth, 100) style:UITableViewStylePlain];
    seedTV.delegate = self;
    seedTV.dataSource = self;
    seedTV.separatorStyle = UITableViewCellSelectionStyleNone;
    seedTV.showsVerticalScrollIndicator = NO;
    [mainSV addSubview:seedTV];
}

#pragma mark -- 设置累计评价
- (void)setEvaluation {
    
    evaTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 1160, ScreenWidth, 280) style:UITableViewStylePlain];
    evaTV.delegate = self;
    evaTV.dataSource = self;
    evaTV.separatorStyle = UITableViewCellSelectionStyleNone;
    evaTV.showsVerticalScrollIndicator = NO;
    [mainSV addSubview:evaTV];
    
    UIButton *shopImgBT = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-50, ScreenHeight-174, 40, 40)];
    shopImgBT.backgroundColor = [UIColor clearColor];
    [shopImgBT setImage:[UIImage imageNamed:@"民间特产详情_07"] forState:UIControlStateNormal];
    [shopImgBT addTarget:self action:@selector(shopImgBT) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shopImgBT];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == seedTV) {
        
        return paraArray.count;
    }else {
        
        return 4;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == seedTV) {
        
        if (indexPath.row == 0) {
        return 45;
    }else {
        return 25;
    }
        
    }else {
        
        if (indexPath.row == 0) {
            return 100;
        }else {
            return 80;
        }
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    if (tableView == seedTV) {
        
    FolkSeedCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[FolkSeedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
        if (indexPath.row == 0) {
        cell.imageV.image = [UIImage imageNamed:@"民间特产详情_02"];
        cell.brankLa.text = paraArray[indexPath.row];
    }else {
        cell.nameLa.text = paraArray[indexPath.row];
    }
    return cell;
        
    }else {
        
        EvaluationCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[EvaluationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        
        if (indexPath.row == 0) {
            cell.imageV.image = [UIImage imageNamed:@"民间特产详情_04"];
            cell.imageV1.image = [UIImage imageNamed:@"touxiang1.jpg"];
            cell.evaLa1.text = @"现在的早餐就是这个了，好吃又营养，一上午精力充沛。现在的早餐就是这个了，好吃又营养，一上午精力充沛。现在的早餐就是这个了，好吃又营养，一上午精力充沛。";
            CGSize evaCG = [ZZStringSize getSizeToString:cell.evaLa1.text forFont:[UIFont systemFontOfSize:10] constrainedToSize:CGSizeMake(ScreenWidth-80, 80) lineBreakMode:NSLineBreakByCharWrapping];
            cell.evaLa1.frame = CGRectMake(70, 25, ScreenWidth-80, evaCG.height);
            
            cell.timeLa.text = @"2015-09-23 11:35:26";
        }else {
            cell.imageV2.image = [UIImage imageNamed:@"touxiang1.jpg"];
            cell.evaLa2.text = @"现在的早餐就是这个了，好吃又营养，一上午精力充沛。现在的早餐就是这个了，好吃又营养，一上午精力充沛。现在的早餐就是这个了，好吃又营养，一上午精力充沛。";
            CGSize evaCG = [ZZStringSize getSizeToString:cell.evaLa2.text forFont:[UIFont systemFontOfSize:10] constrainedToSize:CGSizeMake(ScreenWidth-80, 80) lineBreakMode:NSLineBreakByCharWrapping];
            cell.evaLa2.frame = CGRectMake(70, 5, ScreenWidth-80, evaCG.height);
            
            cell.timeLa.text = @"2015-09-23 11:35:26";
        }
     
        return cell;
    }
    
}

- (void)shopCarBT {
    
}

- (void)buyBT {
    
    BuyOrderVC *Bvc = [[BuyOrderVC alloc] initWithNibName:@"BuyOrderVC" bundle:nil];
    [self.navigationController pushViewController:Bvc animated:YES];
}

- (void)shopImgBT {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
