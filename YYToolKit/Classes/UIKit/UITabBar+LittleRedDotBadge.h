//
//  UITabBar+LittleRedDotBadge.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (LittleRedDotBadge)


/**
 *  给指定的Item 显示小红点
 *
 *  @param index
 */
- (void)zp_showLittleRedDotOnItemIndex:(NSInteger)index;

/**
 *  将指定的Item上的小红点移除
 *
 *  @param index
 */
- (void)zp_hideLittleRedDotOnItemIndex:(NSInteger)index;

@end
