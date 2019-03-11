//
//  UIResponder+Appearance.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import "UIResponder+Appearance.h"
#import "UIImage+ZPCategoriesKit.h"


#define Appearance_Width  [[UIScreen mainScreen] bounds].size.width




@implementation UIResponder (Appearance)
- (void)zp_setupTabBarAppearanceWithTitleSelectedColor:(UIColor *)titleSelectedColor titleNormalColor:(UIColor *)titleNormalColor{

    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleSelectedColor,NSForegroundColorAttributeName,
                                                       nil]forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleNormalColor,NSForegroundColorAttributeName,
                                                       nil]forState:UIControlStateNormal];

    [[UITabBar appearance] setTintColor:titleSelectedColor];

}


- (void)zp_setupTabBarAppearanceWithBackgroundColor:(UIColor *)backgroundColor{
    [[UITabBar appearance] setBarTintColor:backgroundColor];
}


- (void)zp_setupTabBarAppearanceWithTintColor:(UIColor *)tintColor{
    [[UITabBar appearance] setTintColor:tintColor];
}


- (void)zp_setupTabBarAppearanceWithBackgroundColor:(UIColor *)backgroundColor didSelectedBackgroundColor:(UIColor *)didSelectedBackgroundColor itemsCount:(NSInteger)itemsCount {
    UIImage *norml = [UIImage zp_imageWithColor:backgroundColor size:CGSizeMake(Appearance_Width/itemsCount, 49)];
    UIImage *selectedImage = [UIImage zp_imageWithColor:didSelectedBackgroundColor size:CGSizeMake(Appearance_Width/itemsCount, 49)];
    [self zp_setupTabBarAppearanceWithBackgroundImage:norml didSelectedBackgroundImage:selectedImage];
}


- (void)zp_setupTabBarAppearanceWithBackgroundImage:(UIImage *)backgroundImage didSelectedBackgroundImage:(UIImage *)didSelectedBackgroundImage {
    [[UITabBar appearance] setSelectionIndicatorImage:didSelectedBackgroundImage];
    [[UITabBar appearance] setBackgroundImage:backgroundImage];
}





- (void)zp_setupNavigationBarAppearanceWithBackgroundColor:(UIColor *)backgroundColor
                                              barItemColor:(UIColor *)barItemColor
                                                      font:(UIFont *)font
                                                 textColor:(UIColor *)textColor{

    [[UINavigationBar appearance] setBarTintColor: backgroundColor];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage zp_imageWithColor:backgroundColor size:CGSizeMake(Appearance_Width, 64)] forBarMetrics:UIBarMetricsDefault];

    [[UINavigationBar appearance] setTintColor:barItemColor];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          textColor, NSForegroundColorAttributeName,
                                                          font, NSFontAttributeName,
                                                          nil]];
}
@end
