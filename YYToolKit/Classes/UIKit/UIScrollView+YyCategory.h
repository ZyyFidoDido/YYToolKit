//
//  UIScrollView+YyCategory.h
//  YTSellingCC
//
//  Created by Yitian on 2018/12/26.
//  Copyright © 2018 YiTian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (YyCategory)

/**
 滚到顶部
 */
- (void)yy_rollToTop;


/**
 滚到底部
 */
- (void)yy_rollToBottom;



/**
 滚动到中间
 */
- (void)yy_rollToMid;

@end

NS_ASSUME_NONNULL_END
