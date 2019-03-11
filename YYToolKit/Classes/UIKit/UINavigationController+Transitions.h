//
//  UINavigationController+Transitions.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/31.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Transitions)


- (void)zp_pushViewController:(UIViewController *)controller withTransition:(UIViewAnimationTransition)transition;


- (UIViewController *)zp_popViewControllerWithTransition:(UIViewAnimationTransition)transition;

@end
