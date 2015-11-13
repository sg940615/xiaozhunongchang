//
//  DoAllNull.m
//  TraveingAPP
//
//  Created by admin on 14-6-30.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import "DoAllNull.h"

@implementation DoAllNull

//字符串判断是否为空
- (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL || [string isEqualToString:@"<null>"]) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}
//数组判断是否为空

-(BOOL) isArrNull:(NSArray *)arr{
    if ([arr isKindOfClass:[NSArray class]] && arr!=NULL && arr !=[NSNull class] && arr!=nil && (NSNull *)arr!=[NSNull null] && arr.count != 0) {
        return NO;
    }else{
        return YES;
    }
    return YES;
}


//判断字典类型时候为空
-(BOOL) isDicNull:(NSDictionary *)dic{
    if (dic!=NULL && dic !=[NSNull class] && dic!=nil && (NSNull *)dic!=[NSNull null]) {
        return NO;
    }else{
        return YES;
    }
    return YES;
}


@end
