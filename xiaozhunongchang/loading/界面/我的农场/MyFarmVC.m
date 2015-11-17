//
//  MyFarmVC.m
//  PigFarm
//
//  Created by 技术部－张劲松 on 15/11/12.
//  Copyright (c) 2015年 技术部－张劲松. All rights reserved.
//

#import "MyFarmVC.h"
#import "FarmMenuCell.h"
#import "BackpackVC.h"
#import "SeedVC.h"

@interface MyFarmVC () <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *menuTV;
    NSArray *imgArray;
    NSArray *nameArray;
    UIScrollView *mainSV;
    
}
@end

@implementation MyFarmVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self userInterface];
    [self setMainSV];
    [self setMenu];
    [self setClass];
    [self setImage];
}

- (void)viewWillAppear:(BOOL)animated {
    [self hidenTabBar];
}

- (void)hidenTabBar {
    self.tabBarController.hidesBottomBarWhenPushed = NO;
}

- (void)userInterface {
    
    UIBarButtonItem *leftNav = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"农场(1)_03"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAc)];
    leftNav.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftNav;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 30)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 2, 26, 26)];
    imageV.image = [UIImage imageNamed:@"土地托管-参与体验_03"];
    [view addSubview:imageV];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, 2, 144, 26)];
    label.font = [UIFont systemFontOfSize:12];
    label.text = @"你的土地还没有种植，马上";
    [view addSubview:label];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label.frame), 2, 30, 26)];
    [button setTitle:@"种植" forState:UIControlStateNormal];
    [button setTitleColor:ZCnongzhuang forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];

    imgArray = [[NSArray alloc] initWithObjects:@"农场(1)_07",@"农场(1)_10",@"农场(1)_12",@"农场(1)_14", nil];
    nameArray = [[NSArray alloc] initWithObjects:@"视频",@"种子",@"背包",@"土地运营", nil];
}

#pragma mark -- 设置右侧菜单栏
- (void)setMenu {
    menuTV = [[UITableView alloc] initWithFrame:CGRectMake(-90, 0, 90, 200) style:UITableViewStylePlain];
    menuTV.backgroundColor = color(82, 85, 85, 0.7);
    menuTV.delegate = self;
    menuTV.dataSource = self;
    menuTV.showsVerticalScrollIndicator = NO;
    menuTV.separatorStyle = UITableViewCellSelectionStyleNone;
    [self setBorder:menuTV size:1 withColor:color(62, 65, 66, 1)];
    [self.view addSubview:menuTV];
}
#pragma mark -- 设置播放视频
- (void)setMainSV {
    
    mainSV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, ScreenWidth, ScreenHeight-143)];
    mainSV.contentSize = CGSizeMake(ScreenWidth, 560);
    mainSV.backgroundColor = color(237, 237, 237, 1);
    mainSV.showsVerticalScrollIndicator = NO;
    [self.view addSubview:mainSV];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 10, ScreenWidth, 200)];
    view.backgroundColor = [UIColor whiteColor];
    [mainSV addSubview:view];
    
}

#pragma mark -- 设置分类
- (void)setClass {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 220, ScreenWidth, 90)];
    view.backgroundColor = [UIColor whiteColor];
    [mainSV addSubview:view];
    
    CGFloat JJ = (ScreenWidth-240)/5;
    
    for (int i= 0; i<5; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((1+i)*JJ+60*i, 15, 60, 60)];
        button.tag = 1000+i;
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"农场(1)_%d",20+i*2]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(classBT:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
    }
    
}

#pragma mark -- 设置优秀农场截图
- (void)setImage {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 320, ScreenWidth, 240)];
    view.backgroundColor = [UIColor whiteColor];
    [mainSV addSubview:view];
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, ScreenWidth, 200)];
    imageV.image = [UIImage imageNamed:@"西红柿1.jpg"];
    [view addSubview:imageV];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8, 10, ScreenWidth-16, 20)];
    label.text = @"优秀农场截图";
    label.font = [UIFont systemFontOfSize:14];
    [view addSubview:label];
    
    
}

- (void)classBT:(UIButton *)button {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 2) {
        
        BackpackVC *bpVC = [[BackpackVC alloc] initWithNibName:@"BackpackVC" bundle:nil];
        bpVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:bpVC animated:YES];
    }else if (indexPath.row == 1) {
        
        SeedVC *sVC = [[SeedVC alloc] initWithNibName:@"SeedVC" bundle:nil];
        sVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:sVC animated:YES];
    }
    [UIView animateWithDuration:0.3 animations:^{
        CGRect menu = menuTV.frame;
        menu.origin.x = -90;
        [menuTV setFrame:menu];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    FarmMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[FarmMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.imageV.image = [UIImage imageNamed:imgArray[indexPath.row]];
    cell.name.text = nameArray[indexPath.row];
    
    return cell;
}

- (void)leftAc {
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect menu = menuTV.frame;
        if (menu.origin.x == 0) {
            menu.origin.x = -90;
            [menuTV setFrame:menu];
        }else {
            menu.origin.x = 0;
            [menuTV setFrame:menu];
        }
    }];
}

- (void)button {

    
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
