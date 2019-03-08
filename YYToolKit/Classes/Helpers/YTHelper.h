//
//  YTHelper.h
//  YitianServicesApp
//
//  Created by Tgs on 16/5/18.
//  Copyright © 2016年 YiTtian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface YTHelper : NSObject

+(UIImage *)imageWithColor:(UIColor *)color ;
//字符串去空
+(id)isValueNSStringWith:(NSString *)str;
//MD5
+(NSString *)md5:(NSString *)str;

+(void)getStoreLogin;

+ (id) stringChangeObject:(NSString *) jsonString;

//  Mr liao  字符串设置不同属性
+ (NSMutableAttributedString *)attrStrFrom:(NSString *)titleStr
                                 numberStr:(NSString *)numberStr
                                  fontSize:(CGFloat)fontSize
                                     color:(UIColor  *)color;



/**
 消息列表 格式化时间用的

 @param lastTime str
 @return str
 */
+ (NSString *) timeIntervalFromLastTime:(NSDate *) lastTime;

/*时间显示规则：1、刚刚
 2、1分钟前、2分钟前.....59分钟前:
 4、昨天 23:00
 5、06-29
 6、2016-06-29
 1分钟前
 3、今天12:50
 小于1分钟
 大于等于1小分钟，小于1小时
 大于等于1小时，小于1个自然天
 超过一个自然天
 超过两个自然天
 超过一个自然年
 */

+ (NSString *) dynamicTimeFromLastTime:(NSDate *) lastTime;

/**
 排序方法
 
 @param array 对象
 @param key 排序字段
 @return 排序结果 // 数据按字母排序，同时返回所有字母
 */

+ (NSDictionary *) alphabeticalWithArray:(NSArray *) array withKey:(NSString *) key;
+ (UIViewController *)keyPresentingViewController;
+ (UIViewController *)viewController:(UIView *) view;
//是否含有表情
+ (BOOL)stringContainsEmoji:(NSString *)string;
+ (NSString *)filterEmoji:(NSString *)string;
//获取网络图片大小
+ (CGSize)getImageSizeWithURL:(id)URL;
//获取设备型号
+ (NSString*)iphoneType;
+ (NSString *)flattenHTML:(NSString *)html;
+ (NSString *) myVersion;




/**
  3.0 zyy  json -> array

 @param jsonStr jsonStr
 @return NSArray
 */
+ (NSArray *)yy_JsonToArray:(NSString *)jsonStr;



/**
 数据采集 缩减写法

 @param accessType 访问类型
 @param accessId 访问类型为“圈子”、“直播”必填：圈子id、直播id
 @param productId 商品id
 */
+ (void)yy_dataS:(NSString *)accessType aid:(NSString *)accessId pid:(NSString *)productId;


/**
 给搜索写的 缩减写法

 @param accessType 访问类型
 @param searchName 搜索的内容
 */
+ (void)yy_dataS:(NSString *)accessType searchName:(NSString *)searchName;
+ (void)dataStatisticsWithType:(NSString *)accessType accessId:(NSString *)accessId productId:(NSString *)productId searchName:(NSString *)searchName;


@end
