//
//  CGScrollViewFreshHeaderLoadData.h
//  clubCard
//
//  Created by wang shuguan on 13-11-18.
//  Copyright (c) 2013年 wang shuguan. All rights reserved.
//

#import "CGScrollViewFreshHeader.h"

@interface CGScrollViewFreshHeaderLoadData : CGScrollViewFreshHeader{
    
//    NSMutableArray *arrOfCell;
//    NSMutableArray *arrOfCellAdd;
    BOOL isReloadData;
    BOOL isLoadFooter;
}

-(void)reloadData;
@end
