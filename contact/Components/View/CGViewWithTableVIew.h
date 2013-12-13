//
//  CGViewWithTableVIew.h
//  clubCard
//
//  Created by wang shuguan on 13-11-19.
//  Copyright (c) 2013年 wang shuguan. All rights reserved.
//

#import "CGView.h"
#import "CGNothingView.h"

#import "ILoadView.h"
@interface CGViewWithTableVIew : CGView{
    CGNothingView *nothingView;
}

@property(nonatomic,strong)IBOutlet UITableView *tableView;
@property(nonatomic,assign)IBOutlet id<ILoadData>delegate;
-(void)showNothingView;
-(void)hideNothingView;
@end
