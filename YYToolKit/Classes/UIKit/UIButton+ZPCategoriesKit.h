//
//  UIButton+ZPCategoriesKit.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZPButtonType) {
    ZPButtonType_titleLeft_imageRight = 0,
    ZPButtonType_titleRight_imageLeft,
    ZPButtonType_titleDown_imageUp
};

@interface UIButton (ZPCategoriesKit)


/**
 *  系统自带的button 设置文字和图片的显示方式
 *
 *  @param space 图片和文字之间的间距
 *  @param type  显示的方式
 */
- (void)zp_layoutButtonWithSpace:(CGFloat)space type:(ZPButtonType)type;


/**
 *   取消高亮
 */
- (void)zp_cancelHighlight;


/**
 *  添加一个设置背景色的状态
 *
 *  @param backgroundColor
 *  @param state
 */
- (void)zp_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end
