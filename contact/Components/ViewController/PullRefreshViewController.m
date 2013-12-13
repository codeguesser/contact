//
//  PullRefreshViewController.m
//  baixing
//
//  Created by wangshuguan on 13-9-15.
//  Copyright (c) 2013年 rsaif. All rights reserved.
//

#import "PullRefreshViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface PullRefreshViewController ()

@end

@implementation PullRefreshViewController
-(void)Init{
    if([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0)self.edgesForExtendedLayout = UIRectEdgeNone;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self Init];
    }
    return self;
}
- (id)init
{
    self = [super init];
    if (self) {
        [self Init];
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self Init];
    }
    return self;
}
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
