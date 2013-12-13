//
//  Service.m
//  contact
//
//  Created by wang shuguan on 13-11-27.
//  Copyright (c) 2013年 wang shuguan. All rights reserved.
//

#import "Service.h"
#import <ASIHTTPRequest.h>
@implementation Service
//登录    WebService请求
/*
+(CGDataResult *)Login:(NSString *)userName andPasswd:(NSString *)pwd andParent:(UIViewController *)parent
{
    //试图获取基础信息
    
    NSString   *url = [NSString stringWithFormat:@"%@/Login?username=%@&password=%@&shopId=%@",WEBSEARVICE,userName,pwd,[CustomUtil getCardNO]];
    NSLog(@"%@",[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
    ASIHTTPRequest  *request = [[ASIHTTPRequest alloc]initWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    [request startSynchronous];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[XMLReader dictionaryForXMLData:request.responseData error:nil]];
    
    if ([dic objectForKey:@"entityMsg"]) {
        [dic setValue:[[dic objectForKey:@"entityMsg"] objectForKey:@"Msg"] forKey:API_MSG];
        [dic setValue:[[dic objectForKey:@"entityMsg"] objectForKey:@"Success"] forKey:API_STATUS];
        [dic setValue:[dic objectForKey:@"entityMsg"] forKey:API_CONTENT];
    }else{
        [dic setValue:@"false" forKey:API_STATUS];
        [dic setValue:@"网络错误" forKey:API_MSG];
        [dic setValue:[dic objectForKey:@"entityMsg"] forKey:API_CONTENT];
    }
    
    return [CGDataResult getResultFromDic:dic className:@"UserObject"];
}

+(CGDataResult *)getProductListByCat:(int)catid andIndex:(int)index{
    NSString   *url = [NSString stringWithFormat:@"%@?act=getItemList&categoryId=%d&pageIndex=%d&pageSize=10",WEBSEARVICE,catid,index];
    NSLog(@"%@",[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
    ASIHTTPRequest  *request = [[ASIHTTPRequest alloc]initWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    [request startSynchronous];
    NSLog(@"%@",request.responseString);
    NSError *error;
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[NSJSONSerialization JSONObjectWithData:[request.responseString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error]];
    
    if (![dic valueForKey:API_STATUS]) {
        [dic setValue:@"false" forKey:API_STATUS];
        [dic setValue:request.error forKey:API_MSG];
        [dic setValue:dic forKey:API_CONTENT];
    }
    return [CGDataResult getResultFromDic:dic className:@"EntityItem"];
}
;
+(CGDataResult *)getHomeProductsWithIndex:(int)index{
    return [Service getProductListByCat:0 andIndex:index];
}
+(CGDataResult *)getProductWithIndex:(int)index{
    NSString   *url = [NSString stringWithFormat:@"%@?act=getItemDetail&id=%d",WEBSEARVICE,index];
    NSLog(@"%@",[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
    ASIHTTPRequest  *request = [[ASIHTTPRequest alloc]initWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    [request startSynchronous];
    NSLog(@"%@",request.responseString);
    NSError *error;
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[NSJSONSerialization JSONObjectWithData:[request.responseString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error]];
    
    if (![dic valueForKey:API_STATUS]) {
        [dic setValue:@"false" forKey:API_STATUS];
        [dic setValue:request.error forKey:API_MSG];
        [dic setValue:dic forKey:API_CONTENT];
    }
    return [CGDataResult getResultFromDic:dic className:@"EntityItem"];
} */
@end
