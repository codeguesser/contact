//
//  CGScrollViewLoadHeader.m
//  clubCard
//
//  Created by wang shuguan on 13-11-18.
//  Copyright (c) 2013年 wang shuguan. All rights reserved.
//

#import "CGScrollViewFreshHeader.h"

@implementation CGScrollViewFreshHeader
- (void)createRefreshHeaderView{
    if (_refreshHeaderView == nil) {
        
		EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.bounds.size.height, self.frame.size.width, self.bounds.size.height)];
		view.delegate = self;
		[self addSubview:view];
		_refreshHeaderView = view;
        self.delegate = self;
	}
	//  update the last update date
	[_refreshHeaderView refreshLastUpdatedDate];
}
#pragma mark -
#pragma mark Data Source Loading / Reloading Methods 这里处理数据

- (void)reloadHeaderTableViewDataSource{
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_headerReloading = YES;
//	[self refreshView];
}

- (void)doneHeaderTableViewDataSource{
	
	//  model should call this when its done loading
	_headerReloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self];
	
}
#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)doneTableViewDataSource{
    if (_headerReloading)[self performSelector:@selector(doneHeaderTableViewDataSource) withObject:nil afterDelay:0.0f];
}
#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
	
}

#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	[self reloadHeaderTableViewDataSource];
}
- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
    return _headerReloading;
}
- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
    return [NSDate date];
}









@end
