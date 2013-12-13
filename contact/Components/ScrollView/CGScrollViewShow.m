//
//  CGShowScrollView.m
//  club-card
//
//  Created by rsaif on 13-8-20.
//  Copyright (c) 2013年 rsaif. All rights reserved.
//

#import "CGScrollViewShow.h"

@implementation CGScrollViewShow
@synthesize views = _views;
-(void)reloadSubViews{
    int i=0;
    float widthScreen=0;
    for (UIView *v in _views) {
        if([v isKindOfClass:[UIView class]]){
            CGRect vFrame = CGRectMake(v.frame.size.width*i, 0, v.frame.size.width, v.frame.size.height);
            v.frame = vFrame;
            [self addSubview:v];
            widthScreen+= vFrame.size.width;
            i++;
        }
    }
    self.contentSize = CGSizeMake(widthScreen, self.frame.size.height);
}


@end
