//
//  Config.h
//  WTD
//
//  Created by Wangshuguan-mac on 13-7-4.
//  Copyright (c) 2013年 ling. All rights reserved.
//

#ifndef WTD_Config_h
#define WTD_Config_h
#import "Language.h"
#import "ViewStyle.h"
#import "MBProgressHUD.h"
#pragma mark - ---常量
//设置web服务接口
#define CURRENTxmlns @"http://tempuri.org/"
//#define HOSTDOMAIN @"192.168.1.253:88"
//#define WEBSEARVICE  [NSString stringWithFormat:@"http://%@/phonecard/webservice/WebService.asmx",HOSTDOMAIN]
#define HOSTDOMAIN @"219.157.1.122"
#define WEBSEARVICE  [NSString stringWithFormat:@"http://%@:88/je/ws",HOSTDOMAIN]

//设置初始化字体大小
#define FirstFontSize [UIFont systemFontOfSize:17.0f]
#define SecondFontSize [UIFont systemFontOfSize:14.0f]

//设置下拉常量
typedef enum{
	EGOOPullRefreshPulling = 0,
	EGOOPullRefreshNormal,
	EGOOPullRefreshLoading,
} EGOPullRefreshState;
#define MY_PAGE_SIZE 10

//设置Webservice变量结构
#define API_STATUS @"Status"
#define API_CONTENT @"Items"
#define API_MSG @"Message"
#define PROJECT_NAME [[[NSBundle mainBundle] infoDictionary] valueForKey:@"key"]

//设置是否启用coredata
#define COREDATA_USED true

#pragma mark - -------常用的函数

//TODO:数字转字符串
#define strFromNum(n) [NSString stringWithFormat:@"%@",n]
//TODO:应用沙盒目录
#define DOCUMENT_DIR [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSAllDomainsMask, YES) objectAtIndex:0]
//TODO:显示警告
#define SHOWMESSAGE(xx) {MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:self.view];[self.view addSubview:HUD];HUD.labelText = xx;HUD.mode = MBProgressHUDModeText;[HUD show:YES];[HUD hide:YES afterDelay:1];}
//TODO:判断IOS7设备
#define IS_IOS7_DEVICE [[[UIDevice currentDevice] systemVersion] floatValue]>=7.0
//TODO:IOS7设备的不同API的调用
#define DiffApi(oldapi,newapi) ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0)?newapi:oldapi
//TODO:自动填充内容
#define AUTO_FILL_SIZE(font,str,width) [[[UIDevice currentDevice]systemVersion]floatValue]>=7.0?CGSizeMake(([str boundingRectWithSize:CGSizeMake(width, 2000.0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size.width),([str boundingRectWithSize:CGSizeMake(width, 2000.0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size.height+10)):[str sizeWithFont:font constrainedToSize:CGSizeMake(width, 2000.0)];
//TODO:转换Unicode字符串到UTF8
#define Uni2Utf8(unicodeStr) [[NSPropertyListSerialization propertyListFromData:[[[@"\""stringByAppendingString:[[unicodeStr stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"] stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""]] stringByAppendingString:@"\""] dataUsingEncoding:NSUTF8StringEncoding] mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL] stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"]
//TODO:打印URL日志
#define URLLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
//TODO:获取屏幕的宽高
#define SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height

//TODO:判断IOS5设备
#define IS_IPHONE_5  ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
//TODO:获取当前设备的StoryBoard
#define SOTORYBOARD IS_IPHONE_5?@"MainStoryboard2":@"MainStoryboard2"
//TODO:从Storyboard加载ViewController
#define STORYBOARD_CONTROLLER(xx) [[UIStoryboard storyboardWithName:SOTORYBOARD bundle:nil] instantiateViewControllerWithIdentifier:xx]
//TODO:用字符串创建一个ViewController
#define CreateViewController(classname) [[NSClassFromString(classname) alloc]initWithNibName:classname bundle:nil]
//TODO:用字符串创建一个Cell
#define CreateCell(classname) [[[NSBundle mainBundle]loadNibNamed:classname owner:self options:nil] objectAtIndex:0]
#endif