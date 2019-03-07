//
//  UIView+gesAction.h
//  YJinJin
//
//  Created by 桃子leas on 17/3/13.
//  Copyright © 2017年 YiTian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (gesAction)

//* 添加点击手势
- (void)setTapActionWithBlock:(void (^)(void))block;

//* 添加长按手势
- (void)setLongPressActionWithBlock:(void (^)(void))block;

@end
