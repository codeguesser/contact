//
//  CustomUtil.m
//  club-card
//
//  Created by wang shuguan on 13-11-16.
//  Copyright (c) 2013年 rsaif. All rights reserved.
//

#import "CustomUtil.h"
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
@implementation CustomUtil

+(BOOL)isUserLogin{
    if ([USER_DEFAULT valueForKey:U_TOKEN]) {
        return YES;
    }else{
        return NO;
    }
}
+(void)saveAcessToken:(NSString *)token
{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    [settings setObject:token forKey:U_TOKEN];
    [settings synchronize];
}
+(NSString *)getToken
{
    NSUserDefaults  *settings = USER_DEFAULT;
    return [settings valueForKey:U_TOKEN];
}
+(void)clearAcessToken
{
    NSUserDefaults  *settings = USER_DEFAULT;
    [settings removeObjectForKey:U_TOKEN];
//    [settings removeObjectForKey:U_MEMBERNAME];
    [settings removeObjectForKey:U_CARDNO];
    [settings removeObjectForKey:U_MEMBERNO];
    [settings removeObjectForKey:U_MEMBERPOINT];
    [settings removeObjectForKey:U_PHONENUMBER];
    [settings removeObjectForKey:U_REMAINSUM];
    [settings removeObjectForKey:U_SHOPID];
    [settings removeObjectForKey:U_SHOPNAME];
    [settings removeObjectForKey:U_ABOUT];
    [settings removeObjectForKey:U_CONTACTNUMBER];
    [settings removeObjectForKey:U_ADDRESS];
    [settings removeObjectForKey:U_SHOPINFOMATION];
    [settings removeObjectForKey:U_SHOPPHOTO];
    [settings removeObjectForKey:U_SHOPINFOMATION];
    [settings removeObjectForKey:U_CARDSHOPNAME];

    
    
    
    [settings synchronize];
}
+(void)saveMemberName:(NSString *)user
{
    NSUserDefaults  *settings = USER_DEFAULT;
    [settings setObject:user forKey:U_MEMBERNAME];
    [settings synchronize];
}
+(NSString *)getMemberName
{
    NSUserDefaults  *settings = USER_DEFAULT;
    return [settings valueForKey:U_MEMBERNAME];
}
+(void)saveCardNO:(NSString *)code
{
    NSUserDefaults  *settings = USER_DEFAULT;
    [settings setObject:code forKey:U_CARDNO];
    [settings synchronize];
}
+(NSString *)getCardNO
{
    NSUserDefaults  *settings = USER_DEFAULT;
    return [settings valueForKey:U_CARDNO];
}
+(void)saveMemberNO:(NSString *)code{
    NSUserDefaults  *settings = USER_DEFAULT;
    [settings setObject:code forKey:U_MEMBERNO];
    [settings synchronize];
}
+(NSString *)getMemberNO{
    NSUserDefaults  *settings = USER_DEFAULT;
    return [settings valueForKey:U_MEMBERNO];
}
+(void)saveMemberPoint:(NSString *)code{
    NSUserDefaults  *settings = USER_DEFAULT;
    [settings setObject:code forKey:U_MEMBERPOINT];
    [settings synchronize];
}
+(NSString *)getMemberPoint{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    return [settings valueForKey:U_MEMBERPOINT];
}

+(void)savePhoneNumber:(NSString *)code{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    [settings setObject:code forKey:U_PHONENUMBER];
    [settings synchronize];
}
+(NSString *)getPhoneNumber{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    return [settings valueForKey:U_PHONENUMBER];
}
+(void)saveRemainSum:(NSString *)code{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    [settings setObject:code forKey:U_REMAINSUM];
    [settings synchronize];
}
+(NSString *)getRemainSum{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    return [settings valueForKey:U_REMAINSUM];
}

+(BOOL)isGetAboutUs{
    if ([CustomUtil getAbout]) {
        return YES;
    }
    return NO;
}
+(void)saveShopName:(NSString *)code{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    [settings setObject:code forKey:U_SHOPNAME];
    [settings synchronize];
}
+(NSString *)getShopName{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    return [settings valueForKey:U_SHOPNAME];
}
+(void)saveCardShopName:(NSString *)code{
    NSUserDefaults  *settings = USER_DEFAULT;
    [settings setObject:code forKey:U_CARDSHOPNAME];
    [settings synchronize];
}
+(NSString *)getCardShopName{
    NSUserDefaults  *settings = USER_DEFAULT;
    return [settings valueForKey:U_CARDSHOPNAME];
}
+(void)saveAbout:(NSString *)code{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    [settings setObject:code forKey:U_ABOUT];
    [settings synchronize];
}
+(NSString *)getAbout{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    return [settings valueForKey:U_ABOUT];
}
+(void)saveContactNumber:(NSString *)code{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    [settings setObject:code forKey:U_CONTACTNUMBER];
    [settings synchronize];
}
+(NSString *)getContactNumber{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    return [settings valueForKey:U_CONTACTNUMBER];
}
+(void)saveAddress:(NSString *)code{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    [settings setObject:code forKey:U_ADDRESS];
    [settings synchronize];
}
+(NSString *)getAddress{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    return [settings valueForKey:U_ADDRESS];
}
+(void)saveShopID:(NSString *)code{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    [settings setObject:code forKey:U_SHOPID];
    [settings synchronize];
}
+(NSString *)getShopID{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    return [settings valueForKey:U_SHOPID];
}
+(void)saveShopPhoto:(NSString *)code{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    [settings setObject:code forKey:U_SHOPPHOTO];
    [settings synchronize];
}
+(NSString *)getShopPhoto{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    return [settings valueForKey:U_SHOPPHOTO];
}

+(void)saveShopInfomation:(NSString *)code{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    [settings setObject:code forKey:U_SHOPINFOMATION];
    [settings synchronize];
}
+(NSString *)getShopInfomation{
    
    NSUserDefaults  *settings = USER_DEFAULT;
    return [settings valueForKey:U_SHOPINFOMATION];
}
+(void)clearCardInfo{
    NSUserDefaults  *settings = USER_DEFAULT;
    [settings removeObjectForKey:U_SHOPPHOTO];
    [settings removeObjectForKey:U_SHOPINFOMATION];
}
@end
