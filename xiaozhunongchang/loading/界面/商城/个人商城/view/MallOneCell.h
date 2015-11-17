//
//  MallOneCell.h
//  xiaozhunongchang
//
//  Created by Apple on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MalldetailsDeledate <NSObject>

- (void)nextMalldetails;

@end

@interface MallOneCell : UITableViewCell

@property (nonatomic,strong) UIImageView *imageV;
@property (nonatomic,strong) UILabel *nameLa;
@property (nonatomic,strong) UILabel *timeLa;
@property (nonatomic,strong) UILabel *reserveLa;
@property (nonatomic,strong) UILabel *alreadyLa;
@property (nonatomic,strong) UILabel *priceLa;

@property (nonatomic,assign) id <MalldetailsDeledate> detailsDeledate;

@end
