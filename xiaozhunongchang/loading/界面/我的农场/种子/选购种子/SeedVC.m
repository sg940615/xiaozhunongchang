//
//  SeedVC.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/17.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "SeedVC.h"
#import "OwnSeedCell.h"

@interface SeedVC () <UITableViewDataSource,UITableViewDelegate>
{
    UIButton *lastBT1;
    UIButton *lastBT2;
    UIButton *lastBT3;
    UILabel *lineLa;
    UIView *view;
    UIScrollView *mainSV;
}
@end

@implementation SeedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self userInterface];
    [self seedClass];
    [self setSeason];
}


- (void)userInterface {
    self.title = @"选购种子";
    self.view.backgroundColor = [UIColor whiteColor];
    
    mainSV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 32, ScreenWidth, ScreenHeight-96)];
    mainSV.contentSize = CGSizeMake(ScreenWidth*2, ScreenHeight-96);
    mainSV.showsHorizontalScrollIndicator = NO;
    mainSV.pagingEnabled = YES;
    [self.view addSubview:mainSV];
    
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 60)];
    view.backgroundColor = [UIColor whiteColor];
    [mainSV addSubview:view];
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth-45, 0, 30, 30)];
    imageV.image = [UIImage imageNamed:@"关注_03"];
    [self.view addSubview:imageV];
    
    for (int i=0; i<2; i++) {
        
        UIButton *seedBT = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth-55)/2*i, 0, (ScreenWidth-55)/2, 30)];
        [seedBT setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        seedBT.tag = 1000+i;
        [seedBT setTitleColor:ZCnongzhuang forState:UIControlStateSelected];
        seedBT.titleLabel.font = [UIFont systemFontOfSize:14];
        [seedBT addTarget:self action:@selector(seedBT:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:seedBT];
        switch (i) {
            case 0:
                [seedBT setTitle:@"自选种子" forState:UIControlStateNormal];
                seedBT.selected = YES;
                lastBT1 = seedBT;
                break;
                case 1:
                [seedBT setTitle:@"联合农场" forState:UIControlStateNormal];
                break;
            default:
                break;
        }
    }
    
    lineLa = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, (ScreenWidth-55)/2, 2)];
    lineLa.backgroundColor = ZCnongzhuang;
    [self.view addSubview:lineLa];

}

#pragma mark -- 种子分类
- (void)seedClass {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 50, 29)];
    label.text = @"种子分类：";
    label.textColor = color(93, 93, 93, 1);
    label.font = [UIFont systemFontOfSize:10];
    [view addSubview:label];
    
    UILabel *lineLa2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 31, ScreenWidth-10, 1)];
    lineLa2.backgroundColor = color(206, 206, 206, 1);
    [view addSubview:lineLa2];
    
    for (int i=0 ; i<3; i++) {
        UIButton *classBT = [[UIButton alloc] initWithFrame:CGRectMake(60+(52*i), 7, 45, 15)];
        [classBT setTitleColor:color(80, 81, 81, 1) forState:UIControlStateNormal];
        classBT.backgroundColor = color(200, 203, 202, 1);
        classBT.titleLabel.font = [UIFont systemFontOfSize:10];
        [classBT addTarget:self action:@selector(classBT:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:classBT];
        switch (i) {
            case 0:
                [classBT setTitle:@"蔬菜类" forState:UIControlStateNormal];
                classBT.selected = YES;
                lastBT2 = classBT;
                classBT.backgroundColor = ZCnongzhuang;
                break;
                case 1:
                [classBT setTitle:@"水果类" forState:UIControlStateNormal];
                break;
                case 2:
                [classBT setTitle:@"其他类" forState:UIControlStateNormal];
                break;
            default:
                break;
        }
    }
    
}

#pragma mark -- 设置种植月份
- (void)setSeason {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 50, 29)];
    label.text = @"种植月份：";
    label.textColor = color(93, 93, 93, 1);
    label.font = [UIFont systemFontOfSize:10];
    [view addSubview:label];
    
    UILabel *lineLa2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 59, ScreenWidth-10, 1)];
    lineLa2.backgroundColor = color(206, 206, 206, 1);
    [view addSubview:lineLa2];
    
    for (int i=0 ; i<4; i++) {
        UIButton *SeasonBT = [[UIButton alloc] initWithFrame:CGRectMake(60+(52*i), 37, 45, 15)];
        [SeasonBT setTitleColor:color(80, 81, 81, 1) forState:UIControlStateNormal];
        SeasonBT.backgroundColor = color(200, 203, 202, 1);
        SeasonBT.titleLabel.font = [UIFont systemFontOfSize:10];
        [SeasonBT addTarget:self action:@selector(SeasonBT:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:SeasonBT];
        switch (i) {
            case 0:
                [SeasonBT setTitle:@"春季" forState:UIControlStateNormal];
                break;
            case 1:
                [SeasonBT setTitle:@"夏季" forState:UIControlStateNormal];
                SeasonBT.selected = YES;
                lastBT3 = SeasonBT;
                SeasonBT.backgroundColor = ZCnongzhuang;
                break;
            case 2:
                [SeasonBT setTitle:@"秋季" forState:UIControlStateNormal];
                break;
            case 3:
                [SeasonBT setTitle:@"冬季" forState:UIControlStateNormal];
            default:
                break;
        }
    }

    
}

- (void)setTableView {
   
    UITableView *mainTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, ScreenWidth, ScreenHeight-156) style:UITableViewStylePlain];
    mainTV.delegate = self;
    mainTV.dataSource = self;
    mainTV.separatorStyle = UITableViewCellSelectionStyleNone;
    [mainSV addSubview:mainTV];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    OwnSeedCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[OwnSeedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;

}

- (void)seedBT:(UIButton *)button {
    if (button.selected == NO) {
        button.selected = YES;
        lastBT1.selected = NO;
        lastBT1 = button;
    }
    
    [UIView animateWithDuration:0.1 animations:^{
        CGRect seed = lineLa.frame;
        if (button.tag == 1000) {
            seed.origin.x = 0;
            [lineLa setFrame:seed];
            
        }else {
            seed.origin.x = (ScreenWidth-55)/2;
            [lineLa setFrame:seed];
        }
    }];
    
    [UIView animateWithDuration:0.35 animations:^{
        if (button.tag == 1000) {
            CGPoint main = mainSV.contentOffset;
            main.x = 0;
            [mainSV setContentOffset:main];
        }else {
            CGPoint main = mainSV.contentOffset;
            main.x = ScreenWidth;
            [mainSV setContentOffset:main];
        }
    }];
}

- (void)classBT:(UIButton *)button {
    
    if (button.selected == NO) {
        button.selected = YES;
        button.backgroundColor = ZCnongzhuang;
        lastBT2.selected = NO;
        lastBT2.backgroundColor = color(200, 203, 202, 1);
        lastBT2 = button;
    }
}

- (void)SeasonBT:(UIButton *)button {
    
    if (button.selected == NO) {
        button.selected = YES;
        button.backgroundColor = ZCnongzhuang;
        lastBT3.selected = NO;
        lastBT3.backgroundColor = color(200, 203, 202, 1);
        lastBT3 = button;
    }
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
