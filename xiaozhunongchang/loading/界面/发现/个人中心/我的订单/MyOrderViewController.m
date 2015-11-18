//
//  MyOrderViewController.m
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "MyOrderViewController.h"

@interface MyOrderViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *AllTableView;//全部
@property (nonatomic, strong) UITableView *WaitTakeGoodsTableView;//待收货
@property (nonatomic, strong) UITableView *WaitContentTableView;//待评论
@property (nonatomic, strong) UITableView *HistoryListTableView;//历史订单

@property (nonatomic, strong) NSMutableArray *tableViewArr;//存放tableView的数组

@property (nonatomic, strong) NSMutableArray *AllDataArray;//全部数据
@property (nonatomic, strong) NSMutableArray *WaitTakeGoodsArray;//待收货数据
@property (nonatomic, strong) NSMutableArray *WaitContentArray;//待评论数据
@property (nonatomic, strong) NSMutableArray *HistoryArray;//历史订单数据

@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavLeftBtnWithImg];
    self.title = @"我的订单";
    _tableViewArr = [NSMutableArray array];
    // Do any additional setup after loading the view from its nib.
    [self createButton];
    [self createTableView];
}

- (void)createButton {
    NSArray *btnNameArr = @[@"全部",@"待收货",@"待评价",@"历史订单"];
    for (int i = 0; i < btnNameArr.count; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0 + ScreenWidth/4 *i, 0, ScreenWidth/4 - 1, 30);
        [button setTitle:btnNameArr[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 + i;
        button.backgroundColor = [UIColor whiteColor];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:button];
        [self addFenGeXian:button andRect:CGRectMake(0, 29, ScreenWidth/4, 1)];
    }
}

#pragma mark --- 4个切换按钮
- (void)buttonClicked:(UIButton *)button {
    NSInteger n = button.tag - 100;
    for (UITableView *tableView in _tableViewArr) {
        tableView.hidden = YES;
    }
    UITableView *seleteTab = _tableViewArr[n];
    seleteTab.hidden = NO;
}

- (void)createTableView {
    _HistoryListTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, ScreenWidth, ScreenHeight - 94) style:UITableViewStylePlain];
    _HistoryListTableView.delegate = self;
    _HistoryListTableView.dataSource = self;
    [self.view addSubview:_HistoryListTableView];
//    _HistoryListTableView.backgroundColor = [UIColor greenColor];
    _HistoryListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _WaitContentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, ScreenWidth, ScreenHeight - 94) style:UITableViewStylePlain];
    _WaitContentTableView.delegate = self;
    _WaitContentTableView.dataSource = self;
    [self.view addSubview:_WaitContentTableView];
//    _WaitContentTableView.backgroundColor = [UIColor orangeColor];
    _WaitContentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _WaitTakeGoodsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, ScreenWidth, ScreenHeight - 94) style:UITableViewStylePlain];
    _WaitTakeGoodsTableView.delegate = self;
    _WaitTakeGoodsTableView.dataSource = self;
    [self.view addSubview:_WaitTakeGoodsTableView];
//    _WaitTakeGoodsTableView.backgroundColor = [UIColor yellowColor];
    _WaitTakeGoodsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _AllTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, ScreenWidth, ScreenHeight - 94) style:UITableViewStylePlain];
    _AllTableView.delegate = self;
    _AllTableView.dataSource = self;
    [self.view addSubview:_AllTableView];
//    _AllTableView.backgroundColor = [UIColor redColor];
    _AllTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_tableViewArr addObject:_AllTableView];
    [_tableViewArr addObject:_WaitTakeGoodsTableView];
    [_tableViewArr addObject:_WaitContentTableView];
    [_tableViewArr addObject:_HistoryListTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"a"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyOrderTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 185;
}

@end
