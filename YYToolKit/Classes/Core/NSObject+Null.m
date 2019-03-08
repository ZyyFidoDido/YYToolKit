//
//  NSObject+Null.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import "NSObject+Null.h"

@implementation NSObject (Null)

- (BOOL)zp_isNull {
    return [self isKindOfClass:[NSNull class]];
}


- (id)zp_stringNullValue{
    if ([self zp_isNull]) {
        return @"";
    }
    return self;
}
@end
