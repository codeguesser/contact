//
//  ViewControllerImpl.m
//  BaseProject
//
//  Created by lingzerg on 13-8-19.
//  Copyright (c) 2013年 lingzerg. All rights reserved.
//

#import "ViewControllerImpl.h"

@interface ViewControllerImpl ()

@end

@implementation ViewControllerImpl
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)reloadView{

}
- (void)showAnimated:(BOOL)animated title:(NSString *)title whileExecutingBlock:(dispatch_block_t)block completionBlock:(void (^)())completion {
    MBProgressHUD *HUD;
    //初始化进度框，置于当前的View当中
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.mode = MBProgressHUDModeText;
	dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    HUD.labelText = title;
	[HUD showAnimated:animated whileExecutingBlock:block onQueue:queue completionBlock:completion];
}
-(void)Init{
    if(IS_IOS7_DEVICE)self.edgesForExtendedLayout = UIRectEdgeNone;
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
@end
