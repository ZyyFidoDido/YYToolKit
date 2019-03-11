//
//  UIImage+WaterMark.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import "UIImage+WaterMark.h"

@implementation UIImage (WaterMark)
#pragma mark -public
-(UIImage *)zp_waterWithText:(NSString *)text direction:(ImageWaterDirect)direction fontColor:(UIColor *)fontColor fontSize:(CGFloat)fontSize moveXY:(CGPoint)moveXY{

    CGSize size = self.size;

    CGRect rect = (CGRect){CGPointZero,size};

    //新建图片图形上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);

    //绘制图片
    [self drawInRect:rect];

    //绘制文本
    NSDictionary *attr =@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize],NSForegroundColorAttributeName:fontColor};

    CGRect strRect = [self calWidth:text attr:attr direction:direction rect:rect marginXY:moveXY];

    [text drawInRect:strRect withAttributes:attr];

    //获取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

    //结束图片图形上下文
    UIGraphicsEndImageContext();

    return newImage;
}

-(UIImage *)zp_waterWithWaterImage:(UIImage *)waterImage direction:(ImageWaterDirect)direction waterSize:(CGSize)waterSize  moveXY:(CGPoint)moveXY{

    CGSize size = self.size;

    CGRect rect = (CGRect){CGPointZero,size};

    //新建图片图形上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);

    //绘制图片
    [self drawInRect:rect];

    //计算水印的rect
    CGSize waterImageSize = CGSizeEqualToSize(waterSize, CGSizeZero)?waterImage.size:waterSize;
    CGRect calRect = [self rectWithRect:rect size:waterImageSize direction:direction moveXY:moveXY];

    //绘制水印图片
    [waterImage drawInRect:calRect];

    //获取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

    //结束图片图形上下文
    UIGraphicsEndImageContext();

    return newImage;
}

#pragma mark -pirate
-(CGRect)calWidth:(NSString *)str attr:(NSDictionary *)attr direction:(ImageWaterDirect)direction rect:(CGRect)rect marginXY:(CGPoint)marginXY{

    CGSize size =  [str sizeWithAttributes:attr];

    CGRect calRect = [self rectWithRect:rect size:size direction:direction moveXY:marginXY];

    return calRect;
}

-(CGRect)rectWithRect:(CGRect)rect size:(CGSize)size direction:(ImageWaterDirect)direction moveXY:(CGPoint)moveXY{

    CGPoint point = CGPointZero;

    //右上
    if(ImageWaterDirectTopRight == direction) point = CGPointMake(rect.size.width - size.width, 0);

    //左下
    if(ImageWaterDirectBottomLeft == direction) point = CGPointMake(0, rect.size.height - size.height);

    //右下
    if(ImageWaterDirectBottomRight == direction) point = CGPointMake(rect.size.width - size.width, rect.size.height - size.height);

    //正中
    if(ImageWaterDirectCenter == direction) point = CGPointMake((rect.size.width - size.width)*.5f, (rect.size.height - size.height)*.5f);

    point.x+=moveXY.x;
    point.y+=moveXY.y;
    
    CGRect calRect = (CGRect){point,size};
    
    return calRect;
}


@end
