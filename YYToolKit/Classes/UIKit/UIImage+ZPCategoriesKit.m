//
//  UIImage+ZPCategoriesKit.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import "UIImage+ZPCategoriesKit.h"

@implementation UIImage (ZPCategoriesKit)

+ (UIImage *)zp_imageWithColor:(UIColor *)color size:(CGSize)size{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



+ (UIImage *)zp_stretchableImage:(UIImage *)image{
    return  [self zp_stretchableImage:image left:0.5 top:0.5];
}


+ (UIImage *)zp_stretchableImage:(UIImage *)image left:(CGFloat)left top:(CGFloat)top{
    UIImage *temp=image;
    temp=[temp stretchableImageWithLeftCapWidth:temp.size.width*left topCapHeight:temp.size.height*top];
    return temp;
}

@end
