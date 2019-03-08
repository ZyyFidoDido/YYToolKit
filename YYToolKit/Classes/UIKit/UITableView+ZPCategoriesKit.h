//
//  UITableView+ZPCategoriesKit.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (ZPCategoriesKit)

/**
 *  Eliminate extra Cell
 */
- (void)zp_eliminateExtraSeparators;

/**
 *  Roll to the bottom
 *
 *  @param animated
 */
- (void)zp_scrollToBottomAnimated:(BOOL)animated;



/**
 *  Roll to the top
 *
 *  @param animated
 */
- (void)zp_scrollToTopAnimated:(BOOL)animated;

@end
