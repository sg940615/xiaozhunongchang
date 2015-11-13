//
//  ZZLoadView.m
//  ChuangYiShiJie
//
//  Created by 陈钟 on 15/5/19.
//  Copyright (c) 2015年 陈钟. All rights reserved.
//

#import "ZZLoadView.h"
#import "AppDelegate.h"
#import "FatherVC.h"

@implementation ZZLoadView{
    AppDelegate *appdelegate;
    FatherVC *fathervc;
    UIActivityIndicatorView *activity;
    ZZLoadViewType zzloadType;
    UIView *thisLoadView;
    UIView *showView;
    UILabel *textLab;
    MKNetworkOperation *zzoperation;
}
//显示加载框
-(void)showLoadViewWithMKNetworkKit:(MKNetworkOperation *)operation withZZLoadType:(ZZLoadViewType)loadType withString:(NSString *)string{
    appdelegate=[[UIApplication sharedApplication]delegate];
    fathervc=[[FatherVC alloc]init];
    zzloadType=loadType;
    zzoperation=operation;
    if (!thisLoadView) {
        if (loadType==ZZLoadViewTypeCannotOperation || loadType==ZZLoadViewTypeDefault) {
            UIView *loadView=[[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
            [loadView setBackgroundColor:[UIColor colorWithRed:0. green:0. blue:0. alpha:0.5]];
            
            showView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
            [showView setBackgroundColor:[UIColor whiteColor]];
            [fathervc setYuan:showView size:4.0];
            showView.center=loadView.center;
            [loadView addSubview:showView];
            
            activity=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            [activity startAnimating];
            activity.center=CGPointMake(CGRectGetHeight(showView.frame)/2, CGRectGetHeight(showView.frame)/2);
            [showView addSubview:activity];
            
            [fathervc addFenGeXian:showView andRect:CGRectMake(CGRectGetHeight(showView.frame), 8, 1, CGRectGetHeight(showView.frame)-16)];
            
            textLab=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetHeight(showView.frame), 0, CGRectGetWidth(showView.frame)-CGRectGetHeight(showView.frame)*2, CGRectGetHeight(showView.frame))];
            [textLab setTextAlignment:NSTextAlignmentCenter];
            [textLab setFont:[UIFont systemFontOfSize:14]];
            if(string){
                [textLab setText:string];
            }else{
                [textLab setText:@"加载中..."];
            }
            [textLab setTextColor:[UIColor lightGrayColor]];
            [showView addSubview:textLab];
            
            [fathervc addFenGeXian:showView andRect:CGRectMake(CGRectGetMinX(textLab.frame)+CGRectGetWidth(textLab.frame), 8, 1, CGRectGetHeight(showView.frame)-16)];
            
            UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(textLab.frame)+CGRectGetWidth(textLab.frame), 0, CGRectGetHeight(showView.frame), CGRectGetHeight(showView.frame))];
            [btn setTitle:@"X" forState:UIControlStateNormal];
            [btn setTitleColor:BorderColor forState:UIControlStateNormal];
            [showView addSubview:btn];
            [btn addTarget:self action:@selector(closeLoadViewAction) forControlEvents:UIControlEventTouchUpInside];
            [appdelegate.window addSubview:loadView];
            thisLoadView=loadView;
        }else if (loadType==ZZLoadViewTypeCanOperation){
            UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 70, 70)];
            [fathervc setYuan:view size:5.0];
            view.center=CGPointMake(ScreenWidth/2, ScreenHeight/2);
            [view setBackgroundColor:color(0, 0, 0, 0.8)];
            [appdelegate.window addSubview:view];
            
            activity=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            activity.center=CGPointMake(CGRectGetWidth(view.frame)/2, CGRectGetHeight(view.frame)/2);
            [view addSubview:activity];
            [activity startAnimating];
            thisLoadView=view;
        }
    }else{
        if (loadType==ZZLoadViewTypeCannotOperation || loadType==ZZLoadViewTypeDefault) {
            if(string){
                [textLab setText:string];
            }else{
                [textLab setText:@"加载中..."];
            }
        }
    }
}
//关闭加载框
-(void)closeLoadView{
    if (activity) {
        [activity stopAnimating];
    }
    
    if (showView) {
        for(UIView *view in showView.subviews){
            [view removeFromSuperview];
        }
        [showView removeFromSuperview];
    }
    if (thisLoadView) {
        for(UIView *view in thisLoadView.subviews){
            [view removeFromSuperview];
        }
        [thisLoadView removeFromSuperview];
        thisLoadView = nil;
    }
}
////关闭按钮点击事件
-(void)closeLoadViewAction{
    [self closeLoadView];
    if (zzoperation) {
        [zzoperation cancel];
    }
}

@end
