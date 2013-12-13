//
//  LoadDataViewController.h
//  baixing
//
//  Created by wangshuguan on 13-9-15.
//  Copyright (c) 2013年 rsaif. All rights reserved.
//

#import "PullRefreshView.h"

@interface LoadDataViewWithFreshView : PullRefreshView<UITableViewDataSource,UITableViewDelegate>{
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
