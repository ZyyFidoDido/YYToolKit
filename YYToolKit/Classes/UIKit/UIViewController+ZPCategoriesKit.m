//
//  UIViewController+ZPCategoriesKit.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import "UIViewController+ZPCategoriesKit.h"

@implementation UIViewController (ZPCategoriesKit)


- (void)zp_setupEdges {
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

+ (UIViewController *)zp_instanceFromStoryBoard{
    NSString *name = NSStringFromClass([self class]);
    UIStoryboard *sb = [UIStoryboard storyboardWithName:name bundle:nil];
    UIViewController *controller = [sb instantiateViewControllerWithIdentifier:name];
    return controller;
}


- (void)zp_createNotificationCenter:(NSString *)notificationName usingBlock:(void (^)(NSNotification *note))block {
    [[NSNotificationCenter defaultCenter] addObserverForName:notificationName object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        block(note);
    }];
}

@end
