//
//  NSString+ZPCategoriesKit.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//
#import <CommonCrypto/CommonDigest.h>
#import "NSString+ZPCategoriesKit.h"
#import "NSObject+Null.h"

@implementation NSString (ZPCategoriesKit)
- (BOOL)zp_isEmpty {

    NSString *temp = self;
    BOOL result = YES;

    if ([self isKindOfClass:[NSNumber class]]) {
        temp = [NSString stringWithFormat:@"%@",self];
    }

    if (self == nil) {

    } else if ([self zp_isNull]){

    } else if ([temp zp_removeSpace].length == 0) {

    }else {

        result = NO;
    }

    return  result;
}

- (BOOL)zp_isContainString:(NSString *)string{
    return [self rangeOfString:string].location != NSNotFound;
}

- (BOOL)zp_isContainChinese{
    for(int i=0; i< [self length];i++){
        int a = [self characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
            return YES;
    }
    return NO;
}

- (BOOL)zp_isOnlyContainNumberOrLatter {
    if( [self zp_isEmpty]) return NO;

    for (NSInteger i = 0; i < self.length; i++) {
        unichar ch = [self characterAtIndex:i];
        if (!(((ch >= 'a') && (ch <= 'z')) || ((ch >= 'A') && (ch <= 'Z')) || ((ch >= '0') && (ch <= '9')))){ //0=48
            return NO;
        }
    }



    return YES;
}

- (BOOL)zp_isPureInt{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

- (BOOL)zp_isPureFloat{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}



+ (NSString *)zp_getMyApplicationVersion{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [info objectForKey:@"CFBundleShortVersionString"];
    return version;
}

+ (NSString *)zp_getMyApplicationName{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *name = [info objectForKey:@"CFBundleName"];
    return name;
}

- (CGSize)zp_sizeWithlimitSize:(CGSize)limitSize attribute:(NSDictionary *)attribute{
    return  [self boundingRectWithSize:limitSize
                               options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading
                            attributes:attribute
                               context:nil].size;
}

- (NSString *)zp_pinyinUppercase{
    if ([self zp_isEmpty]) {
        return self;
    }
    return [[self zp_pinyin] uppercaseString];
}

- (NSString *)zp_pinyinLowercase{
    if ([self zp_isEmpty]) {
        return self;
    }
    return [[self zp_pinyin] lowercaseString];
}






- (NSString *)zp_md5_32_UppercaseString{
    return [[self zp_md5:2] uppercaseString];
}

- (NSString *)zp_md5_32_LowercaseString{
    return [[self zp_md5:2] lowercaseString];
}
- (NSString *)zp_md5_64_UppercaseString{
    return [[self zp_md5:4] uppercaseString];
}

- (NSString *)zp_md5_64_LowercaseString{
    return [[self zp_md5:4] lowercaseString];
}

#pragma -mark PrivateMethod
- (NSString *)zp_removeSpace {
    return  [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)zp_md5:(NSInteger)count{
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];

    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);

    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * count];

    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    
    return [result copy];
}

- (NSString *)zp_pinyin {
    //先转换为带声调的拼音
    NSMutableString *str = [self mutableCopy];

    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);

    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    return str;
}

@end
