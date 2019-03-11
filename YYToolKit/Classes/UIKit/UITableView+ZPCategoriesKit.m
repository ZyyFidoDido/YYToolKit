//
//  UITableView+ZPCategoriesKit.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import "UITableView+ZPCategoriesKit.h"

@implementation UITableView (ZPCategoriesKit)

- (void)zp_eliminateExtraSeparators {
    UIView *sb = [UIView new];
    sb.backgroundColor = [UIColor clearColor];
    self.tableFooterView = sb;
}


- (void)zp_scrollToBottomAnimated:(BOOL)animated{
    if (self.contentSize.height > self.frame.size.height){
        CGPoint offset = CGPointMake(0, self.contentSize.height - self.frame.size.height);
        [self setContentOffset:offset animated:animated];
    }
}

- (void)zp_scrollToTopAnimated:(BOOL)animated{
    [self scrollRectToVisible:CGRectMake(0.f, 0.f,self.frame.size.width, self.frame.size.height) animated:animated];
}

@end
