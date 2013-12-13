//
//  Form.h
//  WTD
//
//  Created by Wangshuguan-mac on 13-7-5.
//  Copyright (c) 2013年 ling. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Form : NSObject
@property(nonatomic,retain)NSArray *views;
@property(nonatomic,retain)NSArray *checks;
@property(nonatomic,retain)NSArray *otherViews;
@property(nonatomic,retain)NSString *error;
@property(nonatomic,retain)NSNumber *errorIndex;
-(void)check;
@end
