//
//  UIResponder+Appearance.m
//  YTSellingCC
//
//  Created by Yitian on 2018/12/12.
//  Copyright © 2018 YiTian. All rights reserved.
//

#import "UIResponder+Appearance.h"
#import "UIImage+YyImageCategory.h"

#define Appearance_Width  [[UIScreen mainScreen] bounds].size.width

@implementation UIResponder (Appearance)

- (void)yy_setupTabBarAppearanceWithTitleSelectedColor:(UIColor *)titleSelectedColor titleNormalColor:(UIColor *)titleNormalColor{
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleSelectedColor,NSForegroundColorAttributeName,
                                                       nil]forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleNormalColor,NSForegroundColorAttributeName,
                                                       nil]forState:UIControlStateNormal];
    
    [[UITabBar appearance] setTintColor:titleSelectedColor];
    
}


- (void)yy_setupTabBarAppearanceWithBackgroundColor:(UIColor *)backgroundColor{
    [[UITabBar appearance] setBarTintColor:backgroundColor];
}


- (void)yy_setupTabBarAppearanceWithTintColor:(UIColor *)tintColor{
    [[UITabBar appearance] setTintColor:tintColor];
}


- (void)yy_setupTabBarAppearanceWithBackgroundColor:(UIColor *)backgroundColor didSelectedBackgroundColor:(UIColor *)didSelectedBackgroundColor itemsCount:(NSInteger)itemsCount {
    UIImage *norml = [UIImage yy_imageWithColor:backgroundColor size:CGSizeMake(Appearance_Width/itemsCount, 49)];
    UIImage *selectedImage = [UIImage yy_imageWithColor:didSelectedBackgroundColor size:CGSizeMake(Appearance_Width/itemsCount, 49)];
    [self yy_setupTabBarAppearanceWithBackgroundImage:norml didSelectedBackgroundImage:selectedImage];
}


- (void)yy_setupTabBarAppearanceWithBackgroundImage:(UIImage *)backgroundImage didSelectedBackgroundImage:(UIImage *)didSelectedBackgroundImage {
    [[UITabBar appearance] setSelectionIndicatorImage:didSelectedBackgroundImage];
    [[UITabBar appearance] setBackgroundImage:backgroundImage];
}





- (void)yy_setupNavigationBarAppearanceWithBackgroundColor:(UIColor *)backgroundColor
                                              barItemColor:(UIColor *)barItemColor
                                                      font:(UIFont *)font
                                                 textColor:(UIColor *)textColor{
    
    [[UINavigationBar appearance] setBarTintColor: backgroundColor];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage yy_imageWithColor:backgroundColor size:CGSizeMake(Appearance_Width, 64)] forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setTintColor:barItemColor];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          textColor, NSForegroundColorAttributeName,
                                                          font, NSFontAttributeName,
                                                          nil]];
}

@end
