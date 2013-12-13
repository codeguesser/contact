//
//  IViewController.h
//  BaseProject
//
//  Created by lingzerg on 13-8-19.
//  Copyright (c) 2013年 lingzerg. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol IViewController <NSObject>
@property(nonatomic,assign)BOOL isHideNavigationBar;
-(void)reloadView;
@end
