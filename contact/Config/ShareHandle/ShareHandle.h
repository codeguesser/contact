//
//  ShareHandle.h
//  WTD
//
//  Created by Wangshuguan-mac on 13-7-4.
//  Copyright (c) 2013年 ling. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Config.h"
#import "CoreDataUtil.h"
@interface ShareHandle : NSObject
+(ShareHandle *)shareHandle;
//+(CoreDataUtil *)shareCoreData;
@property(nonatomic,strong)CoreDataUtil *shareCoreData;
@end
