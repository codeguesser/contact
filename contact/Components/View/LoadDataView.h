//
//  LoadDataView.h
//  clubCard
//
//  Created by wang shuguan on 13-11-19.
//  Copyright (c) 2013年 wang shuguan. All rights reserved.
//

#import "CGViewWithTableVIew.h"

@interface LoadDataView : CGViewWithTableVIew<UITableViewDataSource,UITableViewDelegate>{
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

