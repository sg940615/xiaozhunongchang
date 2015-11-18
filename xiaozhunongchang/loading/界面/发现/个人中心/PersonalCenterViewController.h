//
//  PersonalCenterViewController.h
//  xiaozhunongchang
//
//  Created by 罗鸿博 on 15/11/13.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import "FatherVC.h"

@interface PersonalCenterViewController : FatherVC
@property (strong, nonatomic) IBOutlet UIImageView *signImageView;
@property (strong, nonatomic) IBOutlet UILabel *telephoneLab;
@property (strong, nonatomic) IBOutlet UITableView *PersonalCenterTableView;
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLab;
@property (strong, nonatomic) IBOutlet UIView *footerView;

@end
