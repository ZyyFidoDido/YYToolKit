//
//  NSObject+Null.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Null)
/**
 *  是否为NULL
 *
 *  @return return value description
 */
- (BOOL)zp_isNull;

/**
 *  如果为NULL返回空字符串 反之返回自己
 *
 *  @return return value description
 */
- (id)zp_stringNullValue;

@end
