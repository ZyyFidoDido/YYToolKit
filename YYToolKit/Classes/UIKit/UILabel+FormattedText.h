//
//  UILabel+FormattedText.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (FormattedText)

/**
 *  给指定位置的文字设置颜色
 *
 *  @param textColor
 *  @param range
 */
- (void)zp_setTextColor:(UIColor *)textColor range:(NSRange)range;


/**
 *  给指定位置的文字设置字体
 *
 *  @param font
 *  @param range
 */
- (void)zp_setFont:(UIFont *)font range:(NSRange)range;



/**
 *  找到第一个分割的字符，然后对这个字符后面的文字修改颜色
 *
 *  @param textColor
 *  @param separator
 */
- (void)zp_setTextColor:(UIColor *)textColor afterOccurenceOfString:(NSString*)separator;

/**
 *  找到第一个分割的字符，然后对这个字符后面的文字修改字体
 *
 *  @param font  font
 *  @param separator Division string
 */
- (void)zp_setFont:(UIFont *)font afterOccurenceOfString:(NSString*)separator;

@end
