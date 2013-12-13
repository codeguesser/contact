//
//  PullRefreshTableViewController.m
//  Plancast
//
//  Created by Leah Culver on 7/2/10.
//  Copyright (c) 2010 Leah Culver
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import <QuartzCore/QuartzCore.h>
#import "PullRefreshTableViewController.h"

@implementation PullRefreshTableViewController
- (IBAction)goBack:(id)sender{
    if (self.navigationController&&self.navigationController.viewControllers.count>1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)createRefreshFooterView{
    
	if (_refreshFooterView == nil) {
		
		EGOPULLUPRefreshTableHeaderView *view = [[EGOPULLUPRefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, self.tableView.bounds.size.height , self.view.frame.size.width, self.tableView.bounds.size.height)];
		view.delegate = self;
		[self.tableView addSubview:view];
		_refreshFooterView = view;
		
	}
	
	//  update the last update date
	[_refreshFooterView refreshLastUpdatedDate];
    [self changeViewFrame];
}
- (void)createRefreshHeaderView{
    if (_refreshHeaderView == nil) {
        
		EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height)];
		view.delegate = self;
		[self.tableView addSubview:view];
		_refreshHeaderView = view;
	}
	//  update the last update date
	[_refreshHeaderView refreshLastUpdatedDate];
}
-(void)changeViewFrame{
    if (self.tableView.contentSize.height>self.tableView.frame.size.height) {
        CGRect rect = _refreshFooterView.frame;
        if(self.tableView.superview.frame.size.height>self.tableView.contentSize.height)
            rect.origin.y = self.tableView.superview.frame.size.height;
        else
            rect.origin.y = self.tableView.contentSize.height;
        _refreshFooterView.frame = rect;
    }
    
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadFooterTableViewDataSource{
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_footerReloading = YES;
	
}

- (void)doneLoadingFooterTableViewData{
	
	//  model should call this when its done loading
	_footerReloading = NO;
	[_refreshFooterView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
	
}
- (void)reloadHeaderTableViewDataSource{
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_headerReloading = YES;
	
}

- (void)doneHeaderTableViewDataSource{
	
	//  model should call this when its done loading
	_headerReloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
	
}

- (void)doneTableViewDataSource{
    if(_footerReloading)[self performSelector:@selector(doneLoadingFooterTableViewData) withObject:nil afterDelay:0.0f];
    if (_headerReloading)[self performSelector:@selector(doneHeaderTableViewDataSource) withObject:nil afterDelay:0.0f];
}
#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
	[_refreshFooterView egoRefreshScrollViewDidScroll:scrollView];
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[_refreshFooterView egoRefreshScrollViewDidEndDragging:scrollView];
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
	
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableFooterDidTriggerRefresh:(EGOPULLUPRefreshTableHeaderView*)view{
	
	[self reloadFooterTableViewDataSource];
	
}

- (BOOL)egoRefreshTableFooterDataSourceIsLoading:(EGOPULLUPRefreshTableHeaderView*)view{
	
	return _footerReloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableFooterDataSourceLastUpdated:(EGOPULLUPRefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
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
