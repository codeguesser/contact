//
//  CGLabel.h
//  WTD
//
//  Created by Wangshuguan-mac on 13-7-12.
//  Copyright (c) 2013年 ling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGLabel : UILabel
-(void)changeFrameByFollowedFrame:(CGRect)frame andOffsize:(CGSize)size;
-(void)reloadSize;
@end
