//
//  UITableView+YyCategory.m
//  YTSellingCC
//
//  Created by Yitian on 2018/12/12.
//  Copyright © 2018 YiTian. All rights reserved.
//

#import "UITableView+YyCategory.h"

@implementation UITableView (YyCategory)

- (void)yy_cleanFootView {
    UIView *sb = [UIView new];
    sb.backgroundColor = [UIColor clearColor];
    self.tableFooterView = sb;
}


- (void)yy_scrollToBottomAnimated:(BOOL)animated{
    if (self.contentSize.height > self.frame.size.height){
        CGPoint offset = CGPointMake(0, self.contentSize.height - self.frame.size.height);
        [self setContentOffset:offset animated:animated];
    }
}

- (void)yy_scrollToTopAnimated:(BOOL)animated{
    [self scrollRectToVisible:CGRectMake(0.f, 0.f,self.frame.size.width, self.frame.size.height) animated:animated];
}

@end
