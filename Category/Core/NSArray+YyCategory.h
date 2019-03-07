//
//  NSArray+YyCategory.h
//  YTSellingCC
//
//  Created by Yitian on 2018/12/12.
//  Copyright © 2018 YiTian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (YyCategory)

/**
 json -> 数组
 
 @param jsonStr jsonStr
 @return 数组
 */
+ (NSArray *)yy_ArrayWithJsonString:(NSString *)jsonStr;

@end

NS_ASSUME_NONNULL_END
