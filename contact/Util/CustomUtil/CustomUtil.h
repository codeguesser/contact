//
//  CustomUtil.h
//  club-card
//
//  Created by wang shuguan on 13-11-16.
//  Copyright (c) 2013年 rsaif. All rights reserved.
//

#import <Foundation/Foundation.h>
#define U_TOKEN @"TOKEN"
#define U_MEMBERNAME @"MEMBERNAME"
#define U_CARDNO @"CARDNO"
#define U_MEMBERNO @"MEMBERNO"
#define U_MEMBERPOINT @"MEMBERPOINT"
#define U_PHONENUMBER @"PHONENUMBER"
#define U_REMAINSUM @"REMAINSUM"


#define U_SHOPNAME @"SHOPNAME"
#define U_CARDSHOPNAME @"CARDSHOPNAME"
#define U_ABOUT @"ABOUT"
#define U_CONTACTNUMBER @"CONTACTNUMBER"
#define U_ADDRESS @"ADDRESS"
#define U_SHOPID @"SHOPID"
#define U_SHOPPHOTO @"SHOPPHOTO"
#define U_SHOPINFOMATION @"SHOPINFOMATION"


@interface CustomUtil : NSObject

+(BOOL)isUserLogin;
+(void)saveAcessToken:(NSString *)token;
+(NSString *)getToken;
+(void)clearAcessToken;
+(void)clearCardInfo;

+(void)saveMemberName:(NSString *)user;
+(NSString *)getMemberName;
+(void)saveCardNO:(NSString *)code;
+(NSString *)getCardNO;
+(void)saveMemberNO:(NSString *)code;
+(NSString *)getMemberNO;
+(void)saveMemberPoint:(NSString *)code;
+(NSString *)getMemberPoint;
+(void)savePhoneNumber:(NSString *)code;
+(NSString *)getPhoneNumber;
+(void)saveRemainSum:(NSString *)code;
+(NSString *)getRemainSum;

+(BOOL)isGetAboutUs;
+(void)saveShopName:(NSString *)code;
+(NSString *)getShopName;
+(void)saveCardShopName:(NSString *)code;
+(NSString *)getCardShopName;
+(void)saveAbout:(NSString *)code;
+(NSString *)getAbout;
+(void)saveContactNumber:(NSString *)code;
+(NSString *)getContactNumber;
+(void)saveAddress:(NSString *)code;
+(NSString *)getAddress;
+(void)saveShopID:(NSString *)code;
+(NSString *)getShopID;
+(void)saveShopPhoto:(NSString *)code;
+(NSString *)getShopPhoto;
+(void)saveShopInfomation:(NSString *)code;
+(NSString *)getShopInfomation;
@end
