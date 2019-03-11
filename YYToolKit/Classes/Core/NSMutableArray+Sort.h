//
//  NSMutableArray+Sort.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Sort)
/**
 *  Array reverse
 *
 *  @return
 */
- (NSMutableArray *)zp_reverse;


/**
 *  order from A  to Z
 */
- (void)zp_orderAZ;


/**
 *  Keyword sort
 *
 *  @param key
 *  @param flag
 */
- (void)zp_sortWithKey:(NSString *)key ascending:(BOOL)flag;
@end
