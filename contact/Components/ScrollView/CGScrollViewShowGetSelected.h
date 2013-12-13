//
//  CGScrollViewShowGetSelected.h
//  clubCard
//
//  Created by wang shuguan on 13-11-18.
//  Copyright (c) 2013年 wang shuguan. All rights reserved.
//
@protocol CGScrollViewShowDelegate <NSObject>
@optional
-(void)scrollViewShowGetSelectedAtIndex:(int)index;

@end
#import "CGScrollViewShow.h"

@interface CGScrollViewShowGetSelected : CGScrollViewShow<UIScrollViewDelegate>
@property(nonatomic,assign)id<CGScrollViewShowDelegate>scrollViewShowDelegate;
@property(nonatomic,assign)int index;
@end
