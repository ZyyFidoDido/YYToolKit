//
//  UIResponder+Appearance.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Appearance)
/**
 *  设置系统自带的UITabBar上字体的颜色
 *
 *  @param titleSelectedColor 选择item时title的颜色
 *  @param titleNormalColor   未选择item时title的颜色
 */
- (void)zp_setupTabBarAppearanceWithTitleSelectedColor:(UIColor *)titleSelectedColor titleNormalColor:(UIColor *)titleNormalColor;

/**
 *  设置系统自带UITabBar 的前景色
 *
 *  @param tintColor 
 */
- (void)zp_setupTabBarAppearanceWithTintColor:(UIColor *)tintColor;

/**
 * 设置系统自带的UITabBar的背景色
 *
 *  @param backgroundColor
 */
- (void)zp_setupTabBarAppearanceWithBackgroundColor:(UIColor *)backgroundColor;

/**
 *  设置系统自带的UITabBar选中未选中的背景色
 *
 *  @param backgroundColor            未选择item时tabbaritem的背景颜色
 *  @param didSelectedBackgroundColor 选择item时tabbaritem的背景颜色
 *  @param itemCount                  TabBar上Item的个数
 */
- (void)zp_setupTabBarAppearanceWithBackgroundColor:(UIColor *)backgroundColor
                         didSelectedBackgroundColor:(UIColor *)didSelectedBackgroundColor
                                          itemsCount:(NSInteger)itemsCount;



/**
 *  设置系统自带的UITabBar选中未选中的背景图片
 *
 *  @param backgroundImage            未选择item时tabbaritem的背景图片
 *  @param didSelectedBackgroundImage 选择item时tabbaritem的背景图片
 */
- (void)zp_setupTabBarAppearanceWithBackgroundImage:(UIImage *)backgroundImage didSelectedBackgroundImage:(UIImage *)didSelectedBackgroundImage;





/**
 *  设置NavigationBarAppearance主题
 *
 *  @param backgroundColor 设置bar的背景色
 *  @param barItemColor    设置BarButtonItem的颜色
 *  @param font            设置字体
 *  @param textColor       设置字体颜色
 */
- (void)zp_setupNavigationBarAppearanceWithBackgroundColor:(UIColor *)backgroundColor
                                              barItemColor:(UIColor *)barItemColor
                                                      font:(UIFont *)font
                                                 textColor:(UIColor *)textColor;
@end
