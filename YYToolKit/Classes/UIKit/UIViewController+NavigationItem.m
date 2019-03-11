//
//  UIViewController+NavigationItem.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/31.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import "UIViewController+NavigationItem.h"
#import "BlocksKit+UIKit.h"
@implementation UIViewController (NavigationItem)

- (UIBarButtonItem *)zp_barButtonItemTitle:(NSString *)titleName handler:(void (^)(id))action {
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] bk_initWithTitle:titleName style:UIBarButtonItemStylePlain handler:^(id sender) {
        action(sender);
    }];

    return bar;
}


- (UIBarButtonItem *)zp_barButtonItemImage:(UIImage *)image handler:(void (^)(id))action {
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] bk_initWithImage:image style:UIBarButtonItemStylePlain handler:^(id sender) {
        action(sender);
    }];
    return bar;
}


- (UIBarButtonItem *)zp_barButtonItemSystemItem:(UIBarButtonSystemItem)systemItem handler:(void (^)(id))action{
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] bk_initWithBarButtonSystemItem:systemItem handler:^(id sender) {
        action(sender);
    }];
    return bar;
    
}


@end
