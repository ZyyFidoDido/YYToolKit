//
//  Passport.h
//  yitiangogo
//
//  Created by jfy on 15/12/4.
//  Copyright © 2015年 四川易田电子商务有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Passport : NSObject
+(UIImage *)imageWithColor:(UIColor *)color ;
//制作参差文本
+(NSMutableAttributedString *)attributed:(NSString *)string stringofRange:(NSRange)range;
//裁剪返回方形图片
+(UIImage *)CreateWithImageInRectWithsSquarImage:(UIImage *)image;

//取消searchbar背景色
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
//获取图片颜色
+(UIColor*)mostColor:(UIImage*)image;

//字符串去空
+(id)isValueNSStringWith:(NSString *)str;
//根据时间差值计算系统时间的时间戳
+(NSTimeInterval )getSystemTimer;

//@"yyyy-MM-dd HH:mm:ss"
+(NSString *)DataTypeFormateTime:(NSString *)time;
//"yyyy-MM-dd HH:mm"
+(NSString *)DataTypeFormateTimeYMDHM:(NSString *)time;

//"yyyy.MM.dd HH:mm"
+(NSString *)DataTypeFormateTimeYMDHM2:(NSString *)time;

//"yyyy-MM-dd"
+(NSString *)DataTypeFormateTimeYMD:(NSString *)time;
//"HH:mm"
+(NSString *)DataTypeFormateTimeHM:(NSString *)time;
+(NSDate *)DataFormateTimeInt:(NSString *)time;



/**
 //"MM月dd日 HH:mm"
 @return "MM月dd日 HH:mm"
 */
+(NSString *)DataTypeFormateTimeMDHMChinese:(NSString *)time;

// 一个时间是下一个时间多久
+ (NSString *) newDataWithOldData:(NSString *) time forleng:(CGFloat) length;

+ (CGFloat ) lengthWithOldData:(NSString *) oldData fromNewData:(NSString *) newData;

/**
 时间str -> 时间戳
 */
+ (NSString *)getTimestampFromTime:(NSString *)_dateStr dateFormatter:(NSString *)_formatter;
@end
