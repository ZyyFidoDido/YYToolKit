//
//  NSObject+yyNotification.h
//  YTSellingCC
//
//  Created by Yitian on 2018/12/12.
//  Copyright © 2018 YiTian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (yyNotification)

- (void)yy_PostNotiWithName:(NSString *)name obj:(id)obj;

- (void)yy_AddNotiWithName:(NSString *)name getBlock:(void (^)(NSNotification *notification))block;

- (void)yy_RemoveNotiWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
