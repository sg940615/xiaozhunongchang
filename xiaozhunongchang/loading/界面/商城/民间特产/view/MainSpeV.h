//
//  MainV.h
//  xiaozhunongchang
//
//  Created by Apple on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FolkDetailsDelegate <NSObject>

- (void)nextDetails;

@end

@interface MainSpeV : UIView

@property (nonatomic,strong) UIImageView *imageV;
@property (nonatomic,strong) UILabel *nameLa;
@property (nonatomic,strong) UILabel *priceLa;
@property (nonatomic,strong) UILabel *salesLa;

@property (nonatomic,assign) id <FolkDetailsDelegate> Detaolsdeledate;

@end
