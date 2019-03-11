//
//  NSDictionary+YyCategory.m
//  YJinJin
//
//  Created by Yitian on 2018/11/8.
//  Copyright © 2018 YiTian. All rights reserved.
//

#import "NSDictionary+YyCategory.h"

@implementation NSDictionary (YyCategory)

+ (NSDictionary *)yy_dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
