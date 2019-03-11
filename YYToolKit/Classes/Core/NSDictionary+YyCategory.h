//
//  NSDictionary+YyCategory.h
//  YJinJin
//
//  Created by Yitian on 2018/11/8.
//  Copyright © 2018 YiTian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (YyCategory)


/**
 json -> 字典

 @param jsonString jsonStr
 @return 字典
 */
+ (NSDictionary *)yy_dictionaryWithJsonString:(NSString *)jsonString ;
@end

NS_ASSUME_NONNULL_END
