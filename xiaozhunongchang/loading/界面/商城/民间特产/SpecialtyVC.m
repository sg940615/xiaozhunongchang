//
//  SpecialtyVC.m
//  xiaozhunongchang
//
//  Created by Apple on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "SpecialtyVC.h"
#import "MainSpeCell.h"
#import "MainSpeV.h"
#import "FolkDetailsVC.h"

@interface SpecialtyVC () <UITableViewDataSource,UITableViewDelegate,FolkDetailsCellDelegate>
{
    UIView *menuV;
    UIButton *lastBT;//上次选中按钮
    UILabel *lineLa;
    UITableView *mainTV;
}

@end

@implementation SpecialtyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self userInterface];
}

//布局控件
- (void)userInterface {
    
    [self setNavLeftBtnWithImg];
   
    menuV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
    menuV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:menuV];
    
    lineLa = [[UILabel alloc] initWithFrame:CGRectMake(0, 42, ScreenWidth/4, 3)];
    lineLa.backgroundColor = ZCnongzhuang;
    [menuV addSubview:lineLa];
    [self setMenuLabel];
    
    mainTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 45, ScreenWidth, ScreenHeight-109) style:UITableViewStylePlain];
    mainTV.delegate = self;
    mainTV.dataSource = self;
    mainTV.showsVerticalScrollIndicator = NO;
    mainTV.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:mainTV];
    
    
}

//设置选项标题
- (void)setMenuLabel {
    for (int i = 0; i<3; i++) {
        UIButton *menuBT = [[UIButton alloc] initWithFrame:CGRectMake(i*ScreenWidth/4, 0, ScreenWidth/4, 42)];
        [menuBT setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [menuBT setTitleColor:ZCnongzhuang forState:UIControlStateSelected];
        [menuBT setFont:[UIFont systemFontOfSize:15]];
        menuBT.tag = 1000+i;
        [menuBT addTarget:self action:@selector(menuAC:) forControlEvents:UIControlEventTouchUpInside];
        switch (i) {
            case 0:
                [menuBT setTitle:@"综合" forState:UIControlStateNormal];
                menuBT.selected = YES;
                lastBT = menuBT;
                break;
                case 1:
                [menuBT setTitle:@"销量" forState:UIControlStateNormal];
                break;
                case 2:
                [menuBT setTitle:@"价格" forState:UIControlStateNormal];
                break;
            default:
                break;
        }
        [menuV addSubview:menuBT];
    }
}
//点击菜单按钮事件
- (void)menuAC:(UIButton *)button {
    
    if (button.tag == 1000) {
        [UIView animateWithDuration:0.1 animations:^{
            CGRect lineCG = lineLa.frame;
            lineCG.origin.x = 0;
            [lineLa setFrame:lineCG];
        }];
    }else if (button.tag == 1001) {
        [UIView animateWithDuration:0.1 animations:^{
            CGRect lineCG = lineLa.frame;
            lineCG.origin.x = ScreenWidth/4;
            [lineLa setFrame:lineCG];
        }];
    }else if (button.tag == 1002) {
        [UIView animateWithDuration:0.1 animations:^{
            CGRect lineCG = lineLa.frame;
            lineCG.origin.x = ScreenWidth/2;
            [lineLa setFrame:lineCG];
        }];
    }
    
    if (button.selected == NO) {
        
        button.selected = YES;
        lastBT.selected = NO;
        lastBT = button;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    CGFloat ImgH = 2*(ScreenWidth-30)/3;
    
    return ImgH+50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    MainSpeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MainSpeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.DetailsCellDelegate = self;
    
    cell.oneImgV.nameLa.text = @"天然蜂蜜";
    cell.oneImgV.imageV.image = [UIImage imageNamed:@"three1.jpg"];
    cell.oneImgV.priceLa.text = @"￥80.00";
    cell.oneImgV.salesLa.text = @"月销324";
    
    cell.twoImgV.nameLa.text = @"天然蜂蜜";
    cell.twoImgV.imageV.image = [UIImage imageNamed:@"three1.jpg"];
    cell.twoImgV.priceLa.text = @"￥80.00";
    cell.twoImgV.salesLa.text = @"月销324";
    
    return cell;
}

- (void)nextDetails {
    
    FolkDetailsVC *Fvc = [[FolkDetailsVC alloc] initWithNibName:@"FolkDetailsVC" bundle:nil];
    [self.navigationController pushViewController:Fvc animated:YES];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
