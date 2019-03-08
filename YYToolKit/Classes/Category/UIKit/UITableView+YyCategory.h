//
//  UITableView+YyCategory.h
//  YTSellingCC
//
//  Created by Yitian on 2018/12/12.
//  Copyright © 2018 YiTian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (YyCategory)

/**
 *  给footView一个透明biew
 */
- (void)yy_cleanFootView;

/**
 *  Roll to the bottom
 *
 *  
 */
- (void)yy_scrollToBottomAnimated:(BOOL)animated;



/**
 *  Roll to the top
 *
 *
 */
- (void)yy_scrollToTopAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
