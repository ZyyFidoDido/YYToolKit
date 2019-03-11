//
//  UITextField+LimitLength.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/3/24.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (LimitLength)

/**
 *  显示textField输入的长度
 *
 *  @param length   输入的长度
 *  @param endBlock 当超出限制时
 */
- (void)zp_limitLenth:(NSInteger)length endBlock:(void(^)())endBlock;


@end
