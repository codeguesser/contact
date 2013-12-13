//
//  LoadDataViewController.h
//  WTD
//
//  Created by Wangshuguan-mac on 13-7-28.
//  Copyright (c) 2013年 ling. All rights reserved.
//

#import "PullRefreshTableViewController.h"

@interface LoadDataTableViewController : PullRefreshTableViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *arrOfData;
    NSMutableArray *arrOfDataAdd;
    
    NSMutableArray *arrOfCell;
    NSMutableArray *arrOfCellAdd;
    BOOL isReloadData;
    BOOL isLoadFooter;
    
    BOOL viewLoadData;
}
-(IBAction)reloadData:(id)sender;
-(UITableViewCell *)cellWithData:(id)w;
-(NSArray *)dataFromRequest;
@end
