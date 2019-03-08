//
//  NSDate+YyCategory.h
//  YTSellingCC
//
//  Created by Yitian on 2018/12/12.
//  Copyright © 2018 YiTian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (YyCategory)

/**
 当前时间戳
 
 @return 返回数字Str
 */
+(NSString *)yy_getNowTimeTimestamp;

/**
 消息列表 格式化时间用的 上午/下午 年月日 等等
 
 @param lastTime NSDate
 @return str
 */
+ (NSString *) timeIntervalFromLastTime:(NSDate *) lastTime;



/**
 时间显示规则：
 1、刚刚
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
 
 @param lastTime NSDate
 @return str
 */
+ (NSString *) dynamicTimeFromLastTime:(NSDate *) lastTime;



/**
 把时间戳转换为NSDate

 @param time 时间戳str
 @return 返回NSDate
 */
+ (NSDate *)yy_dateFormateTimeStr:(NSString *)time;



/**
 yyyy-MM-dd HH:mm:ss

 @param time str
 @return str
 */
+(NSString *)yy_dateTypeFormateTime:(NSString *)time;


/**
 yyyy-MM-dd HH:mm

 @param time str
 @return str
 */
+(NSString *)yy_dateTypeFormateTimeYMDHM:(NSString *)time;


/**
 yyyy-MM-dd

 @param time str
 @return str
 */
+(NSString *)yy_dateTypeFormateTimeYMD:(NSString *)time;


/**
 HH:mm

 @param time str
 @return str
 */
+(NSString *)yy_dateTypeFormateTimeHM:(NSString *)time;

/**
 //"MM月dd日 HH:mm"
 @return "MM月dd日 HH:mm"
 */
+(NSString *)yy_dateTypeFormateTimeMDHMChinese:(NSString *)time;


// 一个时间到下一个时间多久
+ (NSString *) newDataWithOldData:(NSString *) time forleng:(CGFloat) length;

+ (CGFloat ) lengthWithOldData:(NSString *) oldData fromNewData:(NSString *) newData;



- (NSInteger)zy_year;

- (NSInteger)zy_month;

- (NSInteger)zy_day;

- (NSInteger)zy_hour;

- (NSInteger)zy_minute;

- (NSInteger)zy_second;

- (NSString *)zy_weekday;

- (long long)zy_greenTime;

/**
 *  格式化
 *
 *  @return return value description
 */
- (NSDateFormatter *)zy_dateFormatter;

+ (NSDate *)zy_dateWithCLRTicks:(int64_t)ticks withTimeIntervalAddition:(NSTimeInterval)timeIntervalAddition;

+ (NSDate *)zy_dateWithCLRTicks:(long long)ticks;

+ (long long)zy_ticksWithDate:(NSDate *)date;

- (long long)zy_ticksTime;


/**
 时间str -> date
 */
+ (NSDate *)yy_DateFromTimeStr:(NSString *)_dateStr dateFormatter:(NSString *)_formatter;

@end

NS_ASSUME_NONNULL_END
