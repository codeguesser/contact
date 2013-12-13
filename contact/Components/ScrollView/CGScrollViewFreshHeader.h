//
//  CGScrollViewLoadHeader.h
//  clubCard
//
//  Created by wang shuguan on 13-11-18.
//  Copyright (c) 2013年 wang shuguan. All rights reserved.
//

#import "CGScrollView.h"
#import "EGORefreshTableHeaderView.h"

@interface CGScrollViewFreshHeader : CGScrollView<EGORefreshTableHeaderDelegate,UIScrollViewDelegate>{
    
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _headerReloading;
}
- (void)createRefreshHeaderView;
- (void)reloadHeaderTableViewDataSource;
- (void)doneTableViewDataSource;

@end
