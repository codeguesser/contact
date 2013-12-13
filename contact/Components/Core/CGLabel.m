//
//  CGLabel.m
//  WTD
//
//  Created by Wangshuguan-mac on 13-7-12.
//  Copyright (c) 2013年 ling. All rights reserved.
//

#import "CGLabel.h"

@implementation CGLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

-(void)reloadSize{
    
    self.numberOfLines = 0;
    UIFont *font = self.font;
    NSString *str = self.text;
    float width = self.frame.size.width;
    CGSize size = AUTO_FILL_SIZE(font,str,width);
    CGRect rect = self.frame;
    size.width = self.frame.size.width;
    rect.size = size;
    self.frame = rect;
}
-(void)changeFrameByFollowedFrame:(CGRect)frame andOffsize:(CGSize)size{
    CGRect f = CGRectMake(frame.origin.x+size.width, frame.origin.y+frame.size.height+size.height, self.frame.size.width, self.frame.size.height);
    self.frame = f;
}
@end
