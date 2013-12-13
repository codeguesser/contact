//
//  LoadDataView.m
//  clubCard
//
//  Created by wang shuguan on 13-11-19.
//  Copyright (c) 2013年 wang shuguan. All rights reserved.
//

#import "LoadDataView.h"

@implementation LoadDataView

-(void)Init{
    [super Init];
    arrOfData = [[NSMutableArray alloc]init];
    arrOfDataAdd = [NSMutableArray new];
    arrOfCell = [NSMutableArray new];
    arrOfCellAdd = [NSMutableArray new];
    isReloadData = YES;
    if(!viewLoadData)[self reloadData:nil];
}




-(void)loadData{
    MBProgressHUD *HUD = [[MBProgressHUD alloc]initWithView:self];
    HUD.labelText = @"正在为您加载";
    [self addSubview: HUD];
    [HUD showAnimated:YES whileExecutingBlock:^{
        self.userInteractionEnabled = NO;
        NSMutableArray *arr = [NSMutableArray new];
        [arr addObjectsFromArray:[self dataFromRequest]];
        [arrOfDataAdd removeAllObjects];
        [arrOfDataAdd addObjectsFromArray:arr];
    } completionBlock:^{
        
        [arrOfData addObjectsFromArray:arrOfDataAdd];
        [arrOfCellAdd removeAllObjects];
        
        
        for (id w in arrOfDataAdd) {
            [arrOfCellAdd addObject:[self cellWithData:w]];
        }
        
        
        if(isReloadData) {[arrOfCell removeAllObjects];}
        [arrOfCell addObjectsFromArray:arrOfCellAdd];
        if(isReloadData) [self.tableView reloadData];
        else{
            NSMutableArray *newIndexPathes = [NSMutableArray new];
            int i=0;
            for (id w in arrOfCellAdd) {
                [newIndexPathes addObject:[NSIndexPath indexPathForRow:(arrOfCell.count-arrOfCellAdd.count+i) inSection:0]];
                i++;
            }
            [self.tableView insertRowsAtIndexPaths:newIndexPathes
                                  withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        
        if (arrOfCell.count==0) {
            //数据不存在，显示不存在数据
            [self showNothingView];
        }else{
            [self hideNothingView];
        }
        MBProgressHUD* HUD2 = [[MBProgressHUD alloc] initWithView:self];
        [self addSubview:HUD2];
        HUD2.labelText = @"加载完毕";
        HUD2.mode = MBProgressHUDModeText;
        [HUD2 showAnimated:YES whileExecutingBlock:^{
            sleep(1);
        } completionBlock:^{
            if(isReloadData)
                [self.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
            isLoadFooter = NO;
            self.userInteractionEnabled = YES;
        }];
    }];
}
-(NSArray *)dataFromRequest{
    return [NSArray array];
    //    [Request GetFollowFriendResult:@(!isReloadData?((int)(arrOfData.count)/10)+1:1)];
}
-(UITableViewCell *)cellWithData:(id)w{
    return [UITableViewCell new];
}
-(IBAction)reloadData:(id)sender{
    isReloadData = YES;
    [self loadData];
}

#pragma mark - methods for tableview
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrOfCell.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(clickedAtIndex:andData:)]) {
        [self.delegate clickedAtIndex:indexPath.row andData:[arrOfData objectAtIndex:indexPath.row]];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
