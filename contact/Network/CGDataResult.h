//
//  CGDataResult.h
//  contact
//
//  Created by wang shuguan on 13-11-27.
//  Copyright (c) 2013年 wang shuguan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGDataResult : NSObject
@property(strong,nonatomic)NSString *errorMsg;
@property(strong,nonatomic)NSString *status;
@property(strong,nonatomic)NSArray *dataList;
+(CGDataResult *)getResultFromDic:(NSDictionary *)dic className:(NSString *)classname;
@end
