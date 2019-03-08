//
//  UITextField+LeftPadding.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/3/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import "UITextField+LeftPadding.h"

@implementation UITextField (LeftPadding)


- (void)zp_leftPadding:(CGFloat)padding{
    CGRect frame = self.frame;
    frame.size.width = padding;
    UIView *leftview = [[UIView alloc] initWithFrame:frame];
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = leftview;
}


@end
