//
//  EntityObject.h
//  contact
//
//  Created by wang shuguan on 13-11-27.
//  Copyright (c) 2013年 wang shuguan. All rights reserved.
//
@class EntityObject;
@protocol ICGObject <NSObject>
@required
+(EntityObject *)getObjectFromDic:(NSDictionary *)dic;
@end
#import <Foundation/Foundation.h>

@interface EntityObject : NSObject<ICGObject>
+(NSArray *)getObjecsFromDic:(id)dic;
-(NSDictionary *)exportFromObject;

@end
