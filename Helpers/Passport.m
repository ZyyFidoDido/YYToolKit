//
//  Passport.m
//  yitiangogo
//
//  Created by jfy on 15/12/4.
//  Copyright © 2015年 四川易田电子商务有限公司. All rights reserved.
//

#import "Passport.h"

@implementation Passport

+(UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
//制作参差文本
+(NSMutableAttributedString *)attributed:(NSString *)string stringofRange:(NSRange)range
{
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:string];
    // 设置文本的字体以及大小
    [attriString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Helvetica-Bold" size:22] range:NSMakeRange(8, 1)];
    [attriString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:range];
    return attriString;
}
//裁剪返回方形图片
+(UIImage *)CreateWithImageInRectWithsSquarImage:(UIImage *)image
{
    if (image.size.height<image.size.width) {
        image = [UIImage imageWithCGImage:CGImageCreateWithImageInRect([image CGImage], CGRectMake((image.size.width-image.size.height)/2, 0, image.size.height, image.size.height))];
    }else if(image.size.height>image.size.width)
    {
        image = [UIImage imageWithCGImage:CGImageCreateWithImageInRect([image CGImage], CGRectMake(0, (image.size.height-image.size.width)/2, image.size.width, image.size.width))];
    }
    return image;
}
//@"yyyy-MM-dd HH:mm:ss"
+(NSString *)DataTypeFormateTime:(NSString *)time{
    if ([time isEqual:[NSNull null]]||time.length==0||[time isEqualToString:@"(null)"]) {
        return @"";
    }
    time = [time substringToIndex:time.length - 3];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; // 设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:time.integerValue];
    NSString *theDay = [formatter stringFromDate:nowDate];//日期的年月日
    return [NSString stringWithFormat:@"%@",theDay];
}

//"yyyy-MM-dd HH:mm"
+(NSString *)DataTypeFormateTimeYMDHM:(NSString *)time{
    if ([time isEqual:[NSNull null]]||time.length==0||[time isEqualToString:@"(null)"]) {
        return @"";
    }
    time = [time substringToIndex:time.length - 3];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd  HH:mm"]; // 设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:time.integerValue];
    NSString *theDay = [formatter stringFromDate:nowDate];//日期的年月日
    return [NSString stringWithFormat:@"%@",theDay];
}

//"yyyy.MM.dd HH:mm"
+(NSString *)DataTypeFormateTimeYMDHM2:(NSString *)time {
    if ([time isEqual:[NSNull null]]||time.length==0||[time isEqualToString:@"(null)"]) {
        return @"";
    }
    time = [time substringToIndex:time.length - 3];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy.MM.dd HH:mm"]; // 设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:time.integerValue];
    NSString *theDay = [formatter stringFromDate:nowDate];//日期的年月日
    return [NSString stringWithFormat:@"%@",theDay];
}


//"MM月dd日 HH:mm"
+(NSString *)DataTypeFormateTimeMDHMChinese:(NSString *)time{
    if ([time isEqual:[NSNull null]]||time.length==0||[time isEqualToString:@"(null)"]) {
        return @"";
    }
    time = [time substringToIndex:time.length - 3];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM月dd日  HH:mm"]; // 设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:time.integerValue];
    NSString *theDay = [formatter stringFromDate:nowDate];//日期的年月日
    return [NSString stringWithFormat:@"%@",theDay];
}

//"yyyy-MM-dd"
+(NSString *)DataTypeFormateTimeYMD:(NSString *)time{
    if ([time isEqual:[NSNull null]]||time.length==0||[time isEqualToString:@"(null)"]) {
        return @"";
    }
//    time = [NSString stringWithFormat:@"%ld",(time.integerValue / 1000)];
    time = [time substringToIndex:time.length - 3];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"]; // 设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
//    NSString *timeStr = [time substringToIndex:10];
    NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:time.integerValue];
    NSString *theDay = [formatter stringFromDate:nowDate];//日期的年月日
    return [NSString stringWithFormat:@"%@",theDay];
}

//"HH:mm"
+(NSString *)DataTypeFormateTimeHM:(NSString *)time{
    if ([time isEqual:[NSNull null]]||time.length==0||[time isEqualToString:@"(null)"]) {
        return @"";
    }
    time = [time substringToIndex:time.length - 3];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"]; // 设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:time.integerValue];
    NSString *theDay = [formatter stringFromDate:nowDate];//日期的年月日
    return [NSString stringWithFormat:@"%@",theDay];
}
+(NSDate *)DataFormateTimeInt:(NSString *)time{
    if ([time isEqual:[NSNull null]]||time.length==0||[time isEqualToString:@"(null)"]) {
        return nil;
    }
    if (time.length<13) {
        return nil;
    }
    NSString *timeStr = [time substringToIndex:10];
    NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:timeStr.integerValue];
    return nowDate;
}



/**
 时间str -> 时间戳
 */
+ (NSString *)getTimestampFromTime:(NSString *)_dateStr dateFormatter:(NSString *)_formatter {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:_formatter];
    NSDate *datestr = [dateFormatter dateFromString:_dateStr];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datestr timeIntervalSince1970]*1000];

    /*
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd"];// ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制

    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];

    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式

    NSString *nowtimeStr = [formatter stringFromDate:datenow];//----------将nsdate按formatter格式转成nsstring

    NSLog(@"%@", nowtimeStr);

    // 时间转时间戳的方法:
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
     */
    
    
    return timeSp;
    
}







//取消searchbar背景色
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
//根据图片获取图片的主色调
+(UIColor*)mostColor:(UIImage*)image{
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize=CGSizeMake(image.size.width/2, image.size.height/2);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, image.CGImage);
    CGColorSpaceRelease(colorSpace);
    
//第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    if (data == NULL) return nil;
    NSCountedSet *cls=[NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
    
    for (int x=0; x<thumbSize.width; x++) {
        for (int y=0; y<thumbSize.height; y++) {
            int offset = 4*(x*y);
            int red = data[offset];
            int green = data[offset+1];
            int blue = data[offset+2];
            int alpha =  data[offset+3];
            if (alpha>0) {//去除透明
                if (red==255&&green==255&&blue==255) {//去除白色
                }else{
                    NSArray *clr=@[@(red),@(green),@(blue),@(alpha)];
                    [cls addObject:clr];
                }

            }
        }
    }
    CGContextRelease(context);
    //第三步 找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
    NSArray *curColor = nil;
    NSArray *MaxColor=nil;
    NSUInteger MaxCount=0;
    while ( (curColor = [enumerator nextObject]) != nil )
    {
        NSUInteger tmpCount = [cls countForObject:curColor];
        if ( tmpCount < MaxCount ) continue;
        MaxCount=tmpCount;
        MaxColor=curColor;
        
    }
    return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f) green:([MaxColor[1] intValue]/255.0f) blue:([MaxColor[2] intValue]/255.0f) alpha:([MaxColor[3] intValue]/255.0f)];
}

+ (id)isValueNSStringWith:(NSString *)str{
    NSString *resultStr = nil;
    if ([str isEqual:[NSNull null]]
        ||[NSString stringWithFormat:@"%@",str]==nil
        ||[NSString stringWithFormat:@"%@",str].length==0
        ||[[NSString stringWithFormat:@"%@",str] isEqual:@"<null>"]
        ||[[NSString stringWithFormat:@"%@",str] isEqual:@"(null)"]) {
        resultStr = @"";
    }else{
        resultStr = [NSString stringWithFormat:@"%@",str];
    }
    return resultStr;
}
//根据时间差值计算系统时间的时间戳
+(NSTimeInterval )getSystemTimer{
//    NSDateFormatter *df = [[NSDateFormatter alloc]init];//格式化
//    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    [df setTimeZone:zone];
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
//    NSInteger interval = [zone secondsFromGMTForDate:datenow];//时差的秒数
//    NSDate *mobileDate = [datenow dateByAddingTimeInterval:interval];
    NSTimeInterval mobNum = [datenow timeIntervalSince1970];//获取系统的时间戳
    NSTimeInterval sys = mobNum-[YTSharednetManager sharedNetManager].sysTimeCount;
    return sys;
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


@end
