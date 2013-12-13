//
//  CGView.h
//  contact
//
//  Created by wang shuguan on 13-11-28.
//  Copyright (c) 2013年 wang shuguan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGView : UIView
-(void)Init;
-(void)resizeSelf;
-(void)changeFrameByFollowedFrame:(CGRect)frame andOffsize:(CGSize)size;
- (void)showAnimated:(BOOL)animated title:(NSString *)title whileExecutingBlock:(dispatch_block_t)block completionBlock:(void (^)())completion;
@end
