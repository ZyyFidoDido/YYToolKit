//
//  UIImage+WaterMark.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 *  水印方向
 */
typedef enum {

    //左上
    ImageWaterDirectTopLeft=0,

    //右上
    ImageWaterDirectTopRight,

    //左下
    ImageWaterDirectBottomLeft,

    //右下
    ImageWaterDirectBottomRight,

    //正中
    ImageWaterDirectCenter
    
}ImageWaterDirect;
@interface UIImage (WaterMark)


/**
 *  给image添加文字水印
 *
 *  @param text      文字
 *  @param direction 添加方向
 *  @param fontColor 添加文字的颜色
 *  @param fontSize  文字的大小
 *  @param moveXY    根据位置xy坐标移动
 *
 *  @return return value description
 */
-(UIImage *)zp_waterWithText:(NSString *)text direction:(ImageWaterDirect)direction fontColor:(UIColor *)fontColor fontSize:(CGFloat)fontSize moveXY:(CGPoint)moveXY;

/**
 *  给image添加图片水印
 *
 *  @param waterImage 图片
 *  @param direction   添加方向
 *  @param waterSize  图片大小
 *  @param moveXY     根据位置xy坐标移动
 *
 *  @return return value description
 */
-(UIImage *)zp_waterWithWaterImage:(UIImage *)waterImage direction:(ImageWaterDirect)direction waterSize:(CGSize)waterSize  moveXY:(CGPoint)moveXY;

@end
