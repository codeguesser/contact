//
//  CGScrollView.h
//  club-card
//
//  Created by rsaif on 13-8-20.
//  Copyright (c) 2013年 rsaif. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IComponent.h"
@interface CGScrollView : UIScrollView<IComponent>
@property(nonatomic,strong)NSMutableArray *views;
-(void)resizeSelf;
-(void)resizeSelfWithOffsize:(CGSize)size;
@end
