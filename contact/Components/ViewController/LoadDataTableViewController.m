//
//  LoadDataViewController.m
//  WTD
//
//  Created by Wangshuguan-mac on 13-7-28.
//  Copyright (c) 2013年 ling. All rights reserved.
//

#import "LoadDataTableViewController.h"

@interface LoadDataTableViewController ()

@end

@implementation LoadDataTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view
    arrOfData = [[NSMutableArray alloc]init];
    arrOfDataAdd = [NSMutableArray new];
    arrOfCell = [NSMutableArray new];
    arrOfCellAdd = [NSMutableArray new];
    isReloadData = YES;
    if(!viewLoadData)[self reloadData:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)reloadFooterTableViewDataSource{
	[super reloadFooterTableViewDataSource];
    isReloadData = NO;
    [self loadData];
}
- (void)reloadHeaderTableViewDataSource{
    [super reloadHeaderTableViewDataSource];
    [self reloadData:nil];
}


-(void)loadData{
    MBProgressHUD *HUD = [[MBProgressHUD alloc]initWithView:self.view];
    HUD.labelText = @"正在为您加载";
    [self.view addSubview: HUD];
    [HUD showAnimated:YES whileExecutingBlock:^{
        self.view.userInteractionEnabled = NO;
        NSMutableArray *arr = [NSMutableArray new];
        [arr addObjectsFromArray:[self dataFromRequest]];
        [arrOfDataAdd removeAllObjects];
        [arrOfDataAdd addObjectsFromArray:arr];
    } completionBlock:^{
        
        [self doneTableViewDataSource];
        if(isReloadData) [arrOfData removeAllObjects];
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
        
        [self createRefreshHeaderView];
        
        
        
        
        MBProgressHUD* HUD2 = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD2];
        HUD2.labelText = @"加载完毕";
        HUD2.mode = MBProgressHUDModeText;
        [HUD2 showAnimated:YES whileExecutingBlock:^{
            sleep(1);
        } completionBlock:^{
            if(isReloadData)
                [self.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
            isLoadFooter = NO;
            self.view.userInteractionEnabled = YES;
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if(!isLoadFooter){[self createRefreshFooterView];isLoadFooter = YES;}
}
@end
