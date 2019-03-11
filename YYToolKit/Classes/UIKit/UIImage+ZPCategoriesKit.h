//
//  UIImage+ZPCategoriesKit.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZPCategoriesKit)

/**
 *  根据颜色生成图片
 *
 *  @param color 颜色
 *  @param size  大小
 *
 *  @return return value description
 */
+ (UIImage *)zp_imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  水平垂直居中拉伸图片
 *
 *  @param image
 *
 *  @return
 */
+ (UIImage *)zp_stretchableImage:(UIImage *)image;


/**
 *  指定位置拉伸图片
 *
 *  @param image
 *
 *  @return
 */
+ (UIImage *)zp_stretchableImage:(UIImage *)image left:(CGFloat)left top:(CGFloat)top;

@end
