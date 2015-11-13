//
//  ZZLoadView.h
//  ChuangYiShiJie
//
//  Created by 陈钟 on 15/5/19.
//  Copyright (c) 2015年 陈钟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKNetworkKit.h"
#import "Defines.h"

typedef enum {
    ZZLoadViewTypeDefault,
    ZZLoadViewTypeCanOperation,
    ZZLoadViewTypeCannotOperation=ZZLoadViewTypeDefault
}ZZLoadViewType;

@interface ZZLoadView : NSObject
{
    
}

//显示加载框
-(void)showLoadViewWithMKNetworkKit:(MKNetworkOperation *)operation withZZLoadType:(ZZLoadViewType)loadType withString:(NSString *)string;
//关闭加载框
-(void)closeLoadView;
@end
