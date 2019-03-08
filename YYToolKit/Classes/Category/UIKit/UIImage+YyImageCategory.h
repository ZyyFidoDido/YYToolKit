//
//  UIImage+YyImageCategory.h
//  CloudStore
//
//  Created by 张芸瑜 on 2018/4/22.
//  Copyright © 2018年 YiTian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YyImageCategory)


/**
 通过颜色生成图片

 @param _color 颜色
 @param _rect 大小
 @return 返回图片
 */
+ (UIImage *)yy_imageFromColor:(UIColor *)_color Rect:(CGRect)_rect;


/**
 *  根据颜色生成图片
 *
 *  @param color 颜色
 *  @param size  大小
 *
 *  @return return value description
 */
+ (UIImage *)yy_imageWithColor:(UIColor *)color size:(CGSize)size;


/**
 通过颜色生成图片

 @param _color 颜色
 @return 返回图片
 */
+ (UIImage *)yy_imageFromColor:(UIColor *)_color;



/**
 裁剪返回方形图片

 @param image 原始图片
 @return 正方形图片
 */
+ (UIImage *)yy_imageToSquarImage:(UIImage *)image;



/**
 获取图片的主色调

 @param image 被吸取的图片
 @return 返回color
 */
+ (UIColor*)yy_mainColorInImage:(UIImage*)image;

@end
