//
//  NSDate+YyCategory.m
//  YTSellingCC
//
//  Created by Yitian on 2018/12/12.
//  Copyright © 2018 YiTian. All rights reserved.
//

#import "NSDate+YyCategory.h"

@implementation NSDate (YyCategory)

+(NSString *)yy_getNowTimeTimestamp{
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval a=[dat timeIntervalSince1970];
    
    NSString*timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
    
    return timeString;
    
}



+ (NSString *)timeIntervalFromLastTime:(NSDate *)lastTime{
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM"];
    
    NSString *newString = [formatter stringFromDate:[NSDate date]];
    NSString *lastString = [formatter stringFromDate:lastTime];
    
    
    NSDateFormatter *formatterMM = [[NSDateFormatter alloc] init];
    [formatterMM setDateFormat:@"MM"];
    
    NSString *nowMM = [formatterMM stringFromDate:[NSDate date]];
    NSString *lastMM = [formatterMM stringFromDate:lastTime];
    
    
    NSString *returnString = @"";
    
    if ([newString isEqualToString:lastString]) {
        
        [formatter setDateFormat:@"HH:mm"];
        NSString *tempString = [formatter stringFromDate:lastTime];
        
        NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
        [formatter1 setDateFormat:@"hh:mm"];
        
        if ([tempString integerValue] > 12) {
            
            NSString *times = [formatter stringFromDate:lastTime];
            
            if (times.length > 2) {
                
                NSString *hours = [times substringToIndex:2];
                NSString *news = [NSString stringWithFormat:@"%2ld",[hours integerValue] - 12];
                
                times = [times stringByReplacingOccurrencesOfString:hours withString:news];
            }
            
            returnString = [NSString stringWithFormat:@"下午 %@",times];
        }else{
            returnString = [NSString stringWithFormat:@"上午 %@",[formatter stringFromDate:lastTime]];
        }
    }else{
        //同月
        if ([nowMM integerValue] == [lastMM integerValue]) {
            if ([newString integerValue] - [lastString integerValue] == 1) {
                [formatter setDateFormat:@"HH:mm"];
                returnString = [NSString stringWithFormat:@"昨天 %@",[formatter stringFromDate:lastTime]];
            }
            else {
                [formatter setDateFormat:@"MM月dd日 HH:mm"];
                returnString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:lastTime]];
            }
        }
        else {
            [formatter setDateFormat:@"MM月dd日 HH:mm"];
            returnString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:lastTime]];
        }
        
        //        if ([newString integerValue] - [lastString integerValue] == 1) {
        //
        //            returnString = @"昨天";
        //        }else{
        //            [formatter setDateFormat:@"MM月dd日"];
        //            returnString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:lastTime]];
        //        }
    }
    
    return returnString;
}

+ (NSString *)dynamicTimeFromLastTime:(NSDate *)lastTime{
    NSString *returnString = @"";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    
    NSString *newString = [formatter stringFromDate:[NSDate date]];
    NSString *lastString = [formatter stringFromDate:lastTime];
    if ([newString isEqual:lastString]) {
        double timeValue = [[NSDate date] timeIntervalSinceDate:lastTime];
        if (timeValue < 60 ) {
            returnString = @"刚刚";
        }else if (timeValue >= 60 && timeValue < 60*60){
            returnString = [NSString stringWithFormat:@"%.0f分钟前",timeValue/60];
        }else{
            NSDateFormatter *tempformater = [[NSDateFormatter alloc] init];
            [tempformater setDateFormat:@"dd-MM"];
            [formatter setDateFormat:@"HH:mm"];
            NSString *tempNow = [tempformater stringFromDate:[NSDate date]];
            NSString *tempLast = [tempformater stringFromDate:lastTime];
            if ((tempNow.length > 2) && (tempLast.length > 2)) {
                int dayDistance = [[tempNow substringToIndex:2] intValue] - [[tempLast substringToIndex:2] intValue];
                if (dayDistance == 0) {
                    returnString = [NSString stringWithFormat:@"今天%@",[formatter stringFromDate:lastTime]];
                }else if (dayDistance == 1){
                    returnString = [NSString stringWithFormat:@"昨天%@",[formatter stringFromDate:lastTime]];
                }else{
                    [formatter setDateFormat:@"MM-dd"];
                    returnString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:lastTime]];
                }
            }
        }
    }else{
        [formatter setDateFormat:@"yyyy-MM-dd"];
        returnString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:lastTime]];
    }
    
    return returnString;
}


+ (NSDate *)yy_dateFormateTimeStr:(NSString *)time {
    if ([time isEqual:[NSNull null]]||time.length==0||[time isEqualToString:@"(null)"]) {
        return nil;
    }
    time = [time substringToIndex:time.length - 3];
    NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:time.integerValue];
    return nowDate;
}

//@"yyyy-MM-dd HH:mm:ss"
+(NSString *)yy_dateTypeFormateTime:(NSString *)time {
    if ([time isEqual:[NSNull null]]||time.length==0||[time isEqualToString:@"(null)"]) {
        return @"";
    }
    if (time.length<13) {
        return time;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; // 设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSString *timeStr = [time substringToIndex:10];
    NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:timeStr.integerValue];
    NSString *theDay = [formatter stringFromDate:nowDate];//日期的年月日
    return [NSString stringWithFormat:@"%@",theDay];
}

//"yyyy-MM-dd HH:mm"
+(NSString *)yy_dateTypeFormateTimeYMDHM:(NSString *)time {
    if ([time isEqual:[NSNull null]]||time.length==0||[time isEqualToString:@"(null)"]) {
        return @"";
    }
    if (time.length<13) {
        return time;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd  HH:mm"]; // 设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSString *timeStr = [time substringToIndex:10];
    NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:timeStr.integerValue];
    NSString *theDay = [formatter stringFromDate:nowDate];//日期的年月日
    return [NSString stringWithFormat:@"%@",theDay];
}

//"yyyy-MM-dd"
+(NSString *)yy_dateTypeFormateTimeYMD:(NSString *)time
{
    if ([time isEqual:[NSNull null]]||time.length==0||[time isEqualToString:@"(null)"]) {
        return @"";
    }
    if (time.length<13) {
        return time;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"]; // 设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSString *timeStr = [time substringToIndex:10];
    NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:timeStr.integerValue];
    NSString *theDay = [formatter stringFromDate:nowDate];//日期的年月日
    return [NSString stringWithFormat:@"%@",theDay];
}

//"HH:mm"
+(NSString *)yy_dateTypeFormateTimeHM:(NSString *)time {
    if ([time isEqual:[NSNull null]]||time.length==0||[time isEqualToString:@"(null)"]) {
        return @"";
    }
    if (time.length<13) {
        return time;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"]; // 设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSString *timeStr = [time substringToIndex:10];
    NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:timeStr.integerValue];
    NSString *theDay = [formatter stringFromDate:nowDate];//日期的年月日
    return [NSString stringWithFormat:@"%@",theDay];
}

//"MM月dd日 HH:mm"
+(NSString *)yy_dateTypeFormateTimeMDHMChinese:(NSString *)time {
    if ([time isEqual:[NSNull null]]||time.length==0||[time isEqualToString:@"(null)"]) {
        return @"";
    }
    if (time.length<13) {
        return time;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM月dd日  HH:mm"]; // 设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSString *timeStr = [time substringToIndex:10];
    NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:timeStr.integerValue];
    NSString *theDay = [formatter stringFromDate:nowDate];//日期的年月日
    return [NSString stringWithFormat:@"%@",theDay];
}


+ (NSString *)newDataWithOldData:(NSString *)time forleng:(CGFloat)length{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *oldDate = [formatter dateFromString:time];
    NSTimeInterval poor = length*60*60;
    NSDate * newDate = [oldDate dateByAddingTimeInterval:poor];
    return [formatter stringFromDate:newDate];
    
    
    
}

+ (CGFloat) lengthWithOldData:(NSString *)oldData fromNewData:(NSString *)newData{
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    NSTimeZone* timeZone = [NSTimeZone systemTimeZone];//设置时区,这个对于时间的处理有时很重要
    [formatter setTimeZone:timeZone];
    NSString *olddateString = [[NSString stringWithFormat:@"%@",oldData] substringToIndex:10];
    NSString *newdateString = [[NSString stringWithFormat:@"%@",newData] substringToIndex:10];
    NSDate *olddate = [NSDate dateWithTimeIntervalSince1970:olddateString.integerValue];
    NSDate *newdate = [NSDate dateWithTimeIntervalSince1970:newdateString.integerValue];
    
    return [olddate timeIntervalSinceDate:newdate];
    
}



//-=-=-=-==-=--=
#pragma mark - date private
- (NSDateComponents *)zy_private_dateComponent {
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute fromDate:self];
    return dateComponents;
}


- (NSDateFormatter *)zy_dateFormatter {
    static  NSDateFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc]init];
    });
    return formatter;
}




#pragma mark - Date component
- (NSInteger)zy_year{
    return [[self zy_private_dateComponent] year];
}

- (NSInteger)zy_month{
    return [[self zy_private_dateComponent] month];
}

- (NSInteger)zy_day{
    return [[self zy_private_dateComponent] day];
}

- (NSInteger)zy_hour{
    return [[self zy_private_dateComponent] hour];
}

- (NSInteger)zy_minute{
    return [[self zy_private_dateComponent] minute];
}

- (NSInteger)zy_second{
    return [[self zy_private_dateComponent] second];
}

- (NSString *)zy_weekday{
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

- (long long)zy_greenTime{
    return  8 * 60 * 60 * 1000;
}

+ (NSDate *)zy_dateWithCLRTicks:(int64_t)ticks withTimeIntervalAddition:(NSTimeInterval)timeIntervalAddition {
    const double GMTOffset = [[NSTimeZone defaultTimeZone] secondsFromGMT];
    const int64_t CLROffset = 621355968000000000;
    double timeStamp = ((double)(ticks - CLROffset) / 10000000.0) - GMTOffset + timeIntervalAddition;
    return [NSDate dateWithTimeIntervalSince1970:timeStamp];
}

+ (NSDate *)zy_dateWithCLRTicks:(long long)ticks{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(ticks/1000)];
    return date;
}

+ (long long)zy_ticksWithDate:(NSDate *)date {
    long long result = [date timeIntervalSinceDate:[NSDate dateWithTimeIntervalSince1970:0]];
    result = result * 1000 ;
    //格林时间
    result = result +  [date zy_greenTime];
    
    return result;
}

- (long long)zy_ticksTime {
    return [NSDate zy_ticksWithDate:self];
}






/**
 时间str -> date  YYYY-MM-dd HH:mm:ss
 */
+ (NSDate *)yy_DateFromTimeStr:(NSString *)_dateStr dateFormatter:(NSString *)_formatter {
    /*
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:_formatter];
    NSDate *datestr = [dateFormatter dateFromString:_dateStr];
    return datestr;
     
     [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
     [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
     */
    
    /* 因为返回的就是 1994-09-12 所以不需要转换
    */
    
    /*
    判断一下
     1,如果是1994-09-12这样的 就直接分割
     2,如果是1458123000000 这样的13位 毫秒 就切割然后转换
     */
    NSString *theDay;
    if ([_dateStr containsString:@"-"] && [_dateStr rangeOfString:@"-"].location != 0) {
        theDay = _dateStr;
    }
    else {
        _dateStr = [_dateStr substringToIndex:_dateStr.length - 3];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"]; // 设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
        NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:_dateStr.integerValue];
        theDay = [formatter stringFromDate:nowDate];//日期的年月日
    }
    
    
    NSArray *array = [theDay componentsSeparatedByString:@"-"];
    NSDateComponents *comps1 = [[NSDateComponents alloc] init];
    [comps1 setYear:[[array objectAtIndex:0] integerValue]];
    [comps1 setMonth:[[array objectAtIndex:1] integerValue]];
    [comps1 setDay:[[array objectAtIndex:2] integerValue]];
    NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:comps1];
    return date;
}





@end
