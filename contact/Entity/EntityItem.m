//
//  EntityItem.m
//  contact
//
//  Created by wang shuguan on 13-11-30.
//  Copyright (c) 2013年 wang shuguan. All rights reserved.
//

#import "EntityItem.h"

@implementation EntityItem
+(EntityObject *)getObjectFromDic:(NSDictionary *)dic{
    EntityItem *t = [EntityItem new];
    t.sid = [dic objectForKey:@"id"];
    t.title = [dic objectForKey:@"title"];
    t.subTitle = [dic objectForKey:@"subTitle"];
    t.cover = [dic objectForKey:@"cover"];
    t.cTime = [dic objectForKey:@"cTime"];
    t.thumb = [dic objectForKey:@"thumb"];
    t.hit = [dic objectForKey:@"hit"];
    t.phone = [dic objectForKey:@"phone"];
    t.address = [dic objectForKey:@"address"];
    t.type = [dic objectForKey:@"type"];
    t.start = [dic objectForKey:@"start"];
    t.end = [dic objectForKey:@"end"];
    t.start = [dic objectForKey:@"start"];
    t.remark = [dic objectForKey:@"remark"];
    t.content = [dic objectForKey:@"content"];
    t.summary = [dic objectForKey:@"summary"];
    t.publishUser = [dic objectForKey:@"publishUser"];
    t.origin = [dic objectForKey:@"origin"];
    t.category = [dic objectForKey:@"category"];
    return t;
}
-(void)setSid:(NSString *)sid{
    if (sid) {
        if ([sid isKindOfClass:[NSString class]]) {
            _sid = sid;
        }else
            _sid = @"";
    }else{
        _sid = @"";
    }
}
-(void)setTitle:(NSString *)title{
    if (title) {
        if ([title isKindOfClass:[NSString class]]) {
            _title = title;
        }else
            _title = @"";
    }else{
        _title = @"";
    }
}
-(void)setSubTitle:(NSString *)subTitle{
    if (subTitle) {
        if ([subTitle isKindOfClass:[NSString class]]) {
            _subTitle = subTitle;
        }else
            _subTitle = @"";
    }else{
        _subTitle = @"";
    }
}
-(void)setCover:(NSString *)cover{
    if (cover) {
        if ([cover isKindOfClass:[NSString class]]) {
            _cover = cover;
        }else
            _cover = @"";
    }else{
        _cover = @"";
    }
}
-(void)setCTime:(NSString *)cTime{
    if (cTime) {
        if ([cTime isKindOfClass:[NSString class]]) {
            _cTime = cTime;
        }else
            _cTime = @"";
    }else{
        _cTime = @"";
    }
    
}
-(void)setThumb:(NSString *)thumb{
    if (thumb) {
        if ([thumb isKindOfClass:[NSString class]]) {
            _thumb = thumb;
        }else
            _thumb = @"";
    }else{
        _thumb = @"";
    }
}
-(void)setHit:(NSString *)hit{
    if (hit) {
        if ([hit isKindOfClass:[NSString class]]) {
            _hit = hit;
        }else
            _hit = @"";
    }else{
        _hit = @"";
    }
}
-(void)setPhone:(NSString *)phone{
    if (phone) {
        if ([phone isKindOfClass:[NSString class]]) {
            _phone = phone;
        }else
            _phone = @"";
    }else{
        _phone = @"";
    }
}
-(void)setAddress:(NSString *)address{
    if (address) {
        if ([address isKindOfClass:[NSString class]]) {
            _address = address;
        }else
            _address = @"";
    }else{
        _address = @"";
    }
}
-(void)setType:(NSString *)type{
    if (type) {
        if ([type isKindOfClass:[NSString class]]) {
            _type = type;
        }else
            _type = @"";
    }else{
        _type = @"";
    }
}
-(void)setStart:(NSString *)start{
    if (start) {
        if ([start isKindOfClass:[NSString class]]) {
            _start = start;
        }else
            _start = @"";
    }else{
        _start = @"";
    }
}
-(void)setEnd:(NSString *)end{
    if (end) {
        if ([end isKindOfClass:[NSString class]]) {
            _end = end;
        }else
            _end = @"";
    }else{
        _end = @"";
    }
}
-(void)setRemark:(NSString *)remark{
    if (remark) {
        if ([remark isKindOfClass:[NSString class]]) {
            _remark = remark;
        }else
            _remark = @"";
    }else{
        _remark = @"";
    }
}
-(void)setContent:(NSString *)content{
    if (content) {
        if ([content isKindOfClass:[NSString class]]) {
            _content = content;
        }else
            _content = @"";
    }else{
        _content = @"";
    }
}
-(void)setSummary:(NSString *)summary{
    if (summary) {
        if ([summary isKindOfClass:[NSString class]]) {
            _summary = summary;
        }else
            _summary = @"";
    }else{
        _summary = @"";
    }
}
-(void)setPublishUser:(NSString *)publishUser{
    if (publishUser) {
        if ([publishUser isKindOfClass:[NSString class]]) {
            _publishUser = publishUser;
        }else
            _publishUser = @"";
    }else{
        _publishUser = @"";
    }
}
-(void)setOrigin:(NSString *)origin{
    if (origin) {
        if ([origin isKindOfClass:[NSString class]]) {
            _origin = origin;
        }else
            _origin = @"";
    }else{
        _origin = @"";
    }
}
-(void)setCategory:(NSString *)category{
    if (category) {
        if ([category isKindOfClass:[NSString class]]) {
            _category = category;
        }else
            _category = @"";
    }else{
        _category = @"";
    }
}
@end
