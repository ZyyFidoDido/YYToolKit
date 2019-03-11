//
//  NSDate+ZPCategoriesKit.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import "NSDate+ZPCategoriesKit.h"

@implementation NSDate (ZPCategoriesKit)

#pragma mark - date private
- (NSDateComponents *)zp_private_dateComponent {
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute fromDate:self];
    return dateComponents;
}


- (NSDateFormatter *)zp_dateFormatter {
    static  NSDateFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc]init];
    });
    return formatter;
}




#pragma mark - Date component
- (NSInteger)zp_year{
    return [[self zp_private_dateComponent] year];
}

- (NSInteger)zp_month{
    return [[self zp_private_dateComponent] month];
}

- (NSInteger)zp_day{
    return [[self zp_private_dateComponent] day];
}

- (NSInteger)zp_hour{
    return [[self zp_private_dateComponent] hour];
}

- (NSInteger)zp_minute{
    return [[self zp_private_dateComponent] minute];
}

- (NSInteger)zp_second{
    return [[self zp_private_dateComponent] second];
}

- (NSString *)zp_weekday{
    NSCalendar*calendar = [NSCalendar currentCalendar];
    NSDateComponents*comps;

    NSDate *date = [NSDate date];
    comps =[calendar components:(NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekday |NSCalendarUnitWeekdayOrdinal)
                       fromDate:date];
    NSInteger weekday = [comps weekday]; // 星期几（注意，周日是“1”，周一是“2”。。。。）
    NSString *week = @"";
    switch (weekday) {
        case 1:
            week = @"星期日";
            break;
        case 2:
            week = @"星期一";
            break;
        case 3:
            week = @"星期二";
            break;
        case 4:
            week = @"星期三";
            break;
        case 5:
            week = @"星期四";
            break;
        case 6:
            week = @"星期五";
            break;
        case 7:
            week = @"星期六";
            break;

        default:
            break;
    }

    return week;
}

- (long long)zp_greenTime{
    return  8 * 60 * 60 * 1000;
}

+ (NSDate *)zp_dateWithCLRTicks:(int64_t)ticks withTimeIntervalAddition:(NSTimeInterval)timeIntervalAddition {
    const double GMTOffset = [[NSTimeZone defaultTimeZone] secondsFromGMT];
    const int64_t CLROffset = 621355968000000000;
    double timeStamp = ((double)(ticks - CLROffset) / 10000000.0) - GMTOffset + timeIntervalAddition;
    return [NSDate dateWithTimeIntervalSince1970:timeStamp];
}

+ (NSDate *)zp_dateWithCLRTicks:(long long)ticks{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(ticks/1000)];
    return date;
}

+ (long long)zp_ticksWithDate:(NSDate *)date {
    long long result = [date timeIntervalSinceDate:[NSDate dateWithTimeIntervalSince1970:0]];
    result = result * 1000 ;
    //格林时间
    result = result +  [date zp_greenTime];

    return result;
}

- (long long)zp_ticksTime {
    return [NSDate zp_ticksWithDate:self];
}

@end
