//
//  UITextView+MyProperty.h
//  YJinJin
//
//  Created by 桃子leas on 2017/7/11.
//  Copyright © 2017年 YiTian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (MyProperty)
@property (nonatomic, assign)  NSInteger maxWords;

/**
 *  UITextView+placeholder
 */
@property (nonatomic, copy) NSString *yy_placeHolder;
/**
 *  IQKeyboardManager等第三方框架会读取placeholder属性并创建UIToolbar展示
 */
@property (nonatomic, copy) NSString *placeholder;
/**
 *  placeHolder颜色
 */
@property (nonatomic, strong) UIColor *yy_placeHolderColor;
@end
