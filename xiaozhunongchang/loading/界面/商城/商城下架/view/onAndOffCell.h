//
//  onAndOffCell.h
//  xiaozhunongchang
//
//  Created by Apple on 15/11/16.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MSdelegate <NSObject>

- (void)nextPopUpBox;

@end

@interface onAndOffCell : UITableViewCell


@property (nonatomic,strong) UIImageView *imageV;
@property (nonatomic,strong) UILabel *nameLa;
@property (nonatomic,strong) UILabel *timeLa;
@property (nonatomic,strong) UILabel *yieldLa;
@property (nonatomic,strong) UILabel *priceLa;
@property (nonatomic,strong) UIButton *button;

@property (nonatomic,assign) id <MSdelegate> MSdelegate;

@end
