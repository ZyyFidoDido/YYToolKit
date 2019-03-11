//
//  ZPPushNavigationController.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/30.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import "ZPPushNavigationController.h"

@implementation ZPPushNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
