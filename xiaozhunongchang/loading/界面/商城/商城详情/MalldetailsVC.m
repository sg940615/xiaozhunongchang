//
//  MalldetailsVC.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/16.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "MalldetailsVC.h"
#import "MallDetailsCell.h"
#import "ZZStringSize.h"

@interface MalldetailsVC () <UITableViewDataSource,UITableViewDelegate>
{
    UIScrollView *mainSV;
    UIView *oneV;
    UITableView *seedTV;
    NSArray *paraArray;
    NSArray *valueArray;
}

@end

@implementation MalldetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self userInterface];
    [self setSeed];
    [self setButton];
    [self setUntrient];
}

- (void)userInterface {
    
    [self setNavLeftBtnWithImg];
    self.title = @"西红柿";
   
    mainSV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64)];
    mainSV.contentSize = CGSizeMake(ScreenWidth, ScreenHeight*2);
    mainSV.backgroundColor = color(236, 236, 236, 1);
    mainSV.showsVerticalScrollIndicator = NO;
    [self.view addSubview:mainSV];
    
    oneV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 250)];
    oneV.backgroundColor = [UIColor whiteColor];
    [mainSV addSubview:oneV];
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
    imageV.image = [UIImage imageNamed:@"one1.jpg"];
    [oneV addSubview:imageV];
    
    UIButton *speakBT = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-45, 210, 30, 30)];
    [speakBT setImage:[UIImage imageNamed:@"商城-首页-个人商城-详情_03"] forState:UIControlStateNormal];
    [speakBT addTarget:self action:@selector(speakBT) forControlEvents:UIControlEventTouchUpInside];
    [oneV addSubview:speakBT];
    
    UILabel *nameLa = [[UILabel alloc] initWithFrame:CGRectMake(10, 205, ScreenWidth-65, 20)];
    nameLa.text = @"西红柿";
    nameLa.textColor = [UIColor blackColor];
    nameLa.font = [UIFont systemFontOfSize:14];
    [oneV addSubview:nameLa];
    
    UILabel *priceLa = [[UILabel alloc] initWithFrame:CGRectMake(10, 225, ScreenWidth-65, 20)];
    priceLa.text = @"¥20.00/kg";
    priceLa.textColor = color(189, 0, 0, 1);
    priceLa.font = [UIFont systemFontOfSize:14];
    [oneV addSubview:priceLa];
    
    paraArray = [[NSArray alloc] initWithObjects:@"植物品种",@"生长周期",@"播种时间",@"适合播种时间",@"种植难易程度", nil];
    valueArray = [[NSArray alloc] initWithObjects:@"蔬菜类",@"2～3个月",@"春季",@"4月份",@"简单", nil];
}

#pragma mark -- 设置种子参数
- (void)setSeed {
    
    seedTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 260, ScreenWidth, 150) style:UITableViewStylePlain];
    seedTV.delegate = self;
    seedTV.dataSource = self;
    seedTV.separatorStyle = UITableViewCellSelectionStyleNone;
    seedTV.showsVerticalScrollIndicator = NO;
    [mainSV addSubview:seedTV];
}

#pragma mark -- 设置底部button
- (void)setButton {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight-104, ScreenWidth, 40)];
    view.backgroundColor = color(236, 236, 236, 0.7);
    [self.view addSubview:view];
    
    UIButton *shopCarBT = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-140, 10, 60, 20)];
    shopCarBT.backgroundColor = ZCnongzhuang;
    [shopCarBT setTitle:@"加入购物车" forState:UIControlStateNormal];
    [shopCarBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [shopCarBT setFont:[UIFont systemFontOfSize:10]];
    [shopCarBT addTarget:self action:@selector(shopCarBT) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:shopCarBT];
    
    UIButton *orderBT = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-70, 10, 60, 20)];
    orderBT.backgroundColor = ZCnongzhuang;
    [orderBT setTitle:@"提交订单" forState:UIControlStateNormal];
    [orderBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [orderBT setFont:[UIFont systemFontOfSize:10]];
    [orderBT addTarget:self action:@selector(orderBT) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:orderBT];
    
    UIButton *shopImgBT = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-50, ScreenHeight-164, 40, 40)];
    shopImgBT.backgroundColor = [UIColor clearColor];
    [shopImgBT setImage:[UIImage imageNamed:@"民间特产详情_07"] forState:UIControlStateNormal];
    [shopImgBT addTarget:self action:@selector(shopImgBT) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shopImgBT];
}

#pragma mark -- 设置营养价值
- (void)setUntrient {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 420, ScreenWidth, 500)];
    view.backgroundColor = [UIColor whiteColor];
    [mainSV addSubview:view];
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
    imageV.image = [UIImage imageNamed:@"民间特产详情_024"];
    imageV.backgroundColor = [UIColor clearColor];
    [view addSubview:imageV];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"含有丰富的维生素、矿物质、碳水化合物、有机酸及少量的蛋白质。有促进消化、利尿、抑制多种细菌作用。番茄中维生素D可保护血管，治高血压。番茄中有谷胱甘肽，有推迟细胞衰老，增加人体抗癌能力。番茄中胡萝卜素可保护皮肤弹性，促进骨骼钙化，防治小童佝偻病、夜盲症和眼干燥症。/n番茄含有对心血管具有保护作用的维生素和矿物质元素，能减少心脏病的发作。/n番茄红素具有独特的抗氧化能力，能清除自由基，保护细胞，使脱氧核糖核酸及基因免遭破坏，能阻止癌变进程。西红柿除了对前列腺癌有预防作用外，还能有效减少胰腺癌、直肠癌、喉癌、口腔癌、肺癌、乳腺癌等癌症的发病危险。/n番茄中的维C，有生津止渴，健胃消食，凉血平肝，清热解毒，降低血压之功效，对高血压、肾脏病人有良好的辅助治疗作用。多吃番茄具有抗衰老作用，使皮肤保持白皙。/n尼克酸能维持胃液的正常分泌，促进红血球的形成，有利于保持血管壁的弹性和保护皮肤。所以食用西红柿对防治动脉硬化、高血压和冠心病也有帮助。西红柿多汁，可以利尿，肾炎病人也宜食用。";
    label.textColor = color(164, 163, 163, 1);
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:10];
    [view addSubview:label];
    
    CGSize laSize = [ZZStringSize getSizeToString:label.text forFont:[UIFont systemFontOfSize:10] constrainedToSize:CGSizeMake(ScreenWidth-20, 10000) lineBreakMode:NSLineBreakByWordWrapping];
    
    mainSV.contentSize = CGSizeMake(ScreenWidth, laSize.height+470);
    view.frame = CGRectMake(0, 420, ScreenWidth, laSize.height+50);
    label.frame = CGRectMake(10, 35, ScreenWidth-20, laSize.height);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return paraArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 45;
    }else {
        return 25;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    MallDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MallDetailsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    if (indexPath.row == 0) {
        cell.imageV.image = [UIImage imageNamed:@"民间特产详情_02"];
        cell.nameLa1.text = paraArray[indexPath.row];
        cell.nameLa2.text = valueArray[indexPath.row];
    }else {
        cell.brankLa1.text = paraArray[indexPath.row];
        cell.brankLa2.text = valueArray[indexPath.row];
    }
    
    return cell;

}

- (void)speakBT {
    
}

- (void)shopCarBT {
    
}

- (void)orderBT {
    
}

- (void)shopImgBT {
    
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
