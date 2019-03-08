//
//  NSDate+ZPCategoriesKit.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDate (ZPCategoriesKit)

- (NSInteger)zp_year;

- (NSInteger)zp_month;

- (NSInteger)zp_day;

- (NSInteger)zp_hour;

- (NSInteger)zp_minute;

- (NSInteger)zp_second;

- (NSString *)zp_weekday;

- (long long)zp_greenTime;

/**
 *  格式化
 *
 *  @return return value description
 */
- (NSDateFormatter *)zp_dateFormatter;

+ (NSDate *)zp_dateWithCLRTicks:(int64_t)ticks withTimeIntervalAddition:(NSTimeInterval)timeIntervalAddition;

+ (NSDate *)zp_dateWithCLRTicks:(long long)ticks;

+ (long long)zp_ticksWithDate:(NSDate *)date;

- (long long)zp_ticksTime;
@end
