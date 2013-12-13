//
//  ViewControllerImpl.h
//  BaseProject
//
//  Created by lingzerg on 13-8-19.
//  Copyright (c) 2013年 lingzerg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IViewController.h"
@interface ViewControllerImpl : UIViewController<IViewController>
{
}
-(void)loadData;
- (void)showAnimated:(BOOL)animated title:(NSString *)title whileExecutingBlock:(dispatch_block_t)block completionBlock:(void (^)())completion;
@end
