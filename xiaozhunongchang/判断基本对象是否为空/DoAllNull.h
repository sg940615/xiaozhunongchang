//
//  DoAllNull.h
//  TraveingAPP
//
//  Created by admin on 14-6-30.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoAllNull : NSObject


- (BOOL) isBlankString:(NSString *)string;


-(BOOL) isArrNull:(NSArray *)arr;

-(BOOL) isDicNull:(NSDictionary *)dic;
@end
