//
//  UIViewController+ZPCategoriesKit.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ZPCategoriesKit)


/**
 *  取消延展性直接全屏显示  当没有navigationbar时这个可以解决view没有被状态栏盖住的原因
 */
- (void)zp_setupEdges;


/**
 *  Loading file from StoryBoard
 *
 *  @return
 */
+ (UIViewController *)zp_instanceFromStoryBoard;



/**
 *  create notification
 *
 *  @param notificationName notificationName description
 *  @param block            block description
 */
- (void)zp_createNotificationCenter:(NSString *)notificationName usingBlock:(void (^)(NSNotification *note))block;

@end
