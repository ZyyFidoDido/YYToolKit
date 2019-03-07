//
//  UILabel+MyProperty.h
//  YJinJin
//
//  Created by 桃子leas on 2017/10/12.
//  Copyright © 2017年 YiTian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (MyProperty)

- (CGSize)yy_sizeRectWithSize:(CGSize)size;


/**
 *  改变行间距
 */
+ (void)yy_changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)yy_changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)yy_changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

/**
 设置斜体文字
 
 @param _angle 角度
 */
- (void)yy_XieTiLabelWithAngle:(CGFloat)_angle;


/**
 带有图片的 字符串
 
 @param _image 图片
 @param _bounds CGRect
 @param _str 文字
 */
- (void)yy_textWithImage:(UIImage *)_image imageBounds:(CGRect)_bounds str:(NSString *)_str;


/**
 label的数字 递增float
 
 @param fromVlue 随便一个起始数,如 0
 @param toValue  到目标数,如 88.77
 */
- (void)yy_animationForNumFormValue:(CGFloat)fromVlue toValue:(CGFloat)toValue;


/**
 label的数字 递增int
 
 @param fromVlue 随便一个起始数,如 0
 @param toValue  到目标数,如 100
 */
- (void)yy_animationForNumFormIntValue:(int)fromVlue toIntValue:(int)toValue;


@end
