//
//  ILoadView.h
//  contact
//
//  Created by wang shuguan on 13-12-4.
//  Copyright (c) 2013年 wang shuguan. All rights reserved.
//

#ifndef contact_ILoadView_h
#define contact_ILoadView_h
@class EntityObject;
@protocol ILoadData <NSObject>

-(void)clickedAtIndex:(int)sender andData:(EntityObject *)data;

@end

#endif
