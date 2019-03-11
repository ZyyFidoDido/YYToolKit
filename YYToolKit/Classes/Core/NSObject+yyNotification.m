//
//  NSObject+yyNotification.m
//  YTSellingCC
//
//  Created by Yitian on 2018/12/12.
//  Copyright © 2018 YiTian. All rights reserved.
//

#import "NSObject+yyNotification.h"

@implementation NSObject (yyNotification)


-(void)yy_PostNotiWithName:(NSString *)name obj:(id)obj{
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj];
}

-(void)yy_AddNotiWithName:(NSString *)name getBlock:(void (^)(NSNotification *))block{
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:name object:nil] subscribeNext:^(NSNotification *notification) {
        block(notification);
    }];
}

- (void)yy_RemoveNotiWithName:(NSString *)name{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:name object:nil];
}

@end
