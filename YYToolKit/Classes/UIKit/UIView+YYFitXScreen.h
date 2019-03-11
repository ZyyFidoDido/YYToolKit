//
//  UIView+YYFitXScreen.h
//  YJinJin
//
//  Created by Yitian on 2018/7/17.
//  Copyright © 2018年 YiTian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YYFitXScreen)

//判断 是否有 刘海屏
- (BOOL)judgeBangScreen;

/*
 
 99766 navView 高度变88
 26662 贴在底边的view 上移34
 9766524 贴上边的view 下移88
 92675   贴上边的view 下移到 20 + 24 的位置
 9794439 主要是给 详情页的 webview
 473775  让贴底的view 高度变为34
 
 **/

@end
