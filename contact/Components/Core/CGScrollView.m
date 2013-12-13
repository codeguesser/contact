//
//  CGScrollView.m
//  club-card
//
//  Created by rsaif on 13-8-20.
//  Copyright (c) 2013年 rsaif. All rights reserved.
//

#import "CGScrollView.h"

@implementation CGScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self Init];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self Init];
    }
    return self;
}

-(void)Init{
    
}
-(void)resizeSelf{
    [self resizeSelfWithOffsize:CGSizeZero];
}
-(void)resizeSelfWithOffsize:(CGSize)size{
    
    float height = 0;
    float width = 0;
    for (UIView *v in self.subviews) {
        if (v.frame.size.height+v.frame.origin.y>height) {
            height = v.frame.size.height+v.frame.origin.y;
        }
        if (v.frame.size.width+v.frame.origin.x>width) {
            width = v.frame.size.width +v.frame.origin.x;
        }
    }
    width+=size.width;
    height+=size.height;
    [self setContentSize:CGSizeMake(width, height)];
}
@end
