//
//  CGViewTableController.h
//  WTD
//
//  Created by Wangshuguan-mac on 13-7-29.
//  Copyright (c) 2013年 ling. All rights reserved.
//

#import "CGViewController.h"

@interface CGViewTableController : CGViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *arrOfData;
    NSMutableArray *arrOfDataAdd;
    
    NSMutableArray *arrOfCell;
    NSMutableArray *arrOfCellAdd;
    BOOL isReloadData;
    BOOL isLoadFooter;
}
@property(nonatomic,weak)IBOutlet UITableView *tableView;
-(IBAction)reloadData:(id)sender;
-(UITableViewCell *)cellWithData:(id)w;
-(NSArray *)dataFromRequest;

@end
