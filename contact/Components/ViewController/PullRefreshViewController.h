//
//  PullRefreshViewController.h
//  baixing
//
//  Created by wangshuguan on 13-9-15.
//  Copyright (c) 2013年 rsaif. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOPULLUPRefreshTableHeaderView.h"
#import "EGORefreshTableHeaderView.h"
#import "MBProgressHUD.h"
@interface PullRefreshViewController : UIViewController<EGOPULLUPRefreshTableFooterDelegate,EGORefreshTableHeaderDelegate> {
    
	EGOPULLUPRefreshTableHeaderView *_refreshFooterView;
    EGORefreshTableHeaderView *_refreshHeaderView;
	
	//  Reloading var should really be your tableviews datasource
	//  Putting it here for demo purposes
	BOOL _footerReloading;
    BOOL _headerReloading;
}
-(void)Init;
@property(nonatomic,strong)IBOutlet UITableView *tableView;
- (void)createRefreshFooterView;
- (void)reloadFooterTableViewDataSource;
- (void)createRefreshHeaderView;
- (void)reloadHeaderTableViewDataSource;
- (void)doneTableViewDataSource;
//- (void)doneLoadingTableViewData;
- (IBAction)goBack:(id)sender;

@end
