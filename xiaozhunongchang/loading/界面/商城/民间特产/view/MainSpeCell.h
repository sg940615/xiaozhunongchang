//
//  MainCell.h
//  xiaozhunongchang
//
//  Created by Apple on 15/11/14.
//  Copyright © 2015年 技术部－张劲松. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainSpeV.h"

@protocol FolkDetailsCellDelegate <NSObject>

- (void)nextDetails;

@end

@interface MainSpeCell : UITableViewCell

@property (nonatomic,strong) MainSpeV *oneImgV;
@property (nonatomic,strong) MainSpeV *twoImgV;
@property (nonatomic,assign) id <FolkDetailsCellDelegate> DetailsCellDelegate;

@end
