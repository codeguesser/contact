//
//  CGScrollViewFreshHeaderLoadData.m
//  clubCard
//
//  Created by wang shuguan on 13-11-18.
//  Copyright (c) 2013年 wang shuguan. All rights reserved.
//

#import "CGScrollViewFreshHeaderLoadData.h"

@implementation CGScrollViewFreshHeaderLoadData

-(void)Init{
    [super Init];
    isReloadData = YES;
}
-(void)reloadData{
    [self doneTableViewDataSource];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self createRefreshHeaderView];
}
@end
