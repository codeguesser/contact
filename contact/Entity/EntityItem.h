//
//  EntityItem.h
//  contact
//
//  Created by wang shuguan on 13-11-30.
//  Copyright (c) 2013年 wang shuguan. All rights reserved.
//

#import "EntityObject.h"

@interface EntityItem : EntityObject
@property(nonatomic,strong)NSString *sid;  //编号
@property(nonatomic,strong)NSString *title; //标题
@property(nonatomic,strong)NSString *subTitle; //子标题
@property(nonatomic,strong)NSString *cover; //图片
@property(nonatomic,strong)NSString *cTime; //创建时间
@property(nonatomic,strong)NSString *thumb; //缩略图
@property(nonatomic,strong)NSString *hit;     //点击次数
@property(nonatomic,strong)NSString *phone;   //电话
@property(nonatomic,strong)NSString *address; //地址
@property(nonatomic,strong)NSString *type;    //类型,冗余字段 1为分类 2为文章
@property(nonatomic,strong)NSString *start;   //开始结束标示符, 冗余字段
@property(nonatomic,strong)NSString *end;     //开始结束标示符, 冗余字段
@property(nonatomic,strong)NSString *remark;  //备注
@property(nonatomic,strong)NSString *content; //正文
@property(nonatomic,strong)NSString *summary; //摘要
@property(nonatomic,strong)NSString *publishUser; //发布人
@property(nonatomic,strong)NSString *origin;      //来源,由来,作者
@property(nonatomic,strong)NSString *category; //所属类型
@end
