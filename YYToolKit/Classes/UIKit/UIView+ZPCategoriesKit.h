//
//  UIView+ZPCategoriesKit.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZPCategoriesKit)

/**
 *  All sub views of the current view
 *
 *  @return
 */
- (NSArray *)zp_descentViews;


/**
 *  Load Xib file
 *
 *  @return
 */
+ (instancetype)zp_instanceFromXib;



- (UIViewController *)zp_viewController;



- (void)removeAllSubviews;


- (void)dd;
@end
