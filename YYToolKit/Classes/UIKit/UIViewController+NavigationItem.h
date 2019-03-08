//
//  UIViewController+NavigationItem.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/31.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavigationItem)


- (UIBarButtonItem *)zp_barButtonItemTitle:(NSString *)titleName handler:(void (^)(id sender))action;


- (UIBarButtonItem *)zp_barButtonItemImage:(UIImage *)image handler:(void (^)(id sender))action;


- (UIBarButtonItem *)zp_barButtonItemSystemItem:(UIBarButtonSystemItem)systemItem handler:(void (^)(id sender))action;


@end
