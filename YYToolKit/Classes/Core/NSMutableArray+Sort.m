//
//  NSMutableArray+Sort.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import "NSMutableArray+Sort.h"

@implementation NSMutableArray (Sort)

- (NSMutableArray *)zp_reverse {
    return [[[self reverseObjectEnumerator] allObjects] mutableCopy];
}


- (void)zp_orderAZ {
    [self sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

- (void)zp_sortWithKey:(NSString *)key ascending:(BOOL)flag{
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:key ascending:flag]];
    [self sortUsingDescriptors:sortDescriptors];
}

@end
