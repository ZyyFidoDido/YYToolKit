//
//  NSString+ZPCategoriesKit.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (ZPCategoriesKit)

/**
 *   Contain string
 *
 *  @param string
 *
 *  @return
 */
- (BOOL)zp_isContainString:(NSString *)string;

/**
 *  是否为nil 或者null 空
 *
 *  @return
 */
- (BOOL)zp_isEmpty;


/**
 *  是否包含中文
 *
 *  @return
 */
- (BOOL)zp_isContainChinese;


/**
 *  是否只有英文和数字
 *
 *  @return
 */
- (BOOL)zp_isOnlyContainNumberOrLatter;

/**
 *  是否为整型
 *
 *  @return
 */
- (BOOL)zp_isPureInt;

/**
 *  是否为浮点型
 *
 *  @return
 */
- (BOOL)zp_isPureFloat;

/**
 *  Calculated according to the content
 *
 *  @param string    content
 *  @param limitSize size
 *  @param attribute Additional parameter
 *
 *  @return
 */
- (CGSize)zp_sizeWithlimitSize:(CGSize)limitSize attribute:(NSDictionary *)attribute;

/**
 *  转化成拼音大写
 *
 *  @return return value description
 */
- (NSString *)zp_pinyinUppercase;

/**
 *  转化成拼音小写
 *
 *  @return return value description
 */
- (NSString *)zp_pinyinLowercase;

/**
 *  获取程序的版本号   CFBundleShortVersionString
 *
 *  @return return value description
 */
+ (NSString *)zp_getMyApplicationVersion;

/**
 *  获取程序的名字    CFBundleName
 *
 *  @return return value description
 */
+ (NSString *)zp_getMyApplicationName;


/**
 *  32位md5大写
 *
 *  @return return value description
 */
- (NSString *)zp_md5_32_UppercaseString;

/**
 *  32位md5小写
 *
 *  @return return value description
 */
- (NSString *)zp_md5_32_LowercaseString;

/**
 *  64位md5大写
 *
 *  @return return value description
 */
- (NSString *)zp_md5_64_UppercaseString;

/**
 *  64位md5小写
 *
 *  @return return value description
 */
- (NSString *)zp_md5_64_LowercaseString;


@end
