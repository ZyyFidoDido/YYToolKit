//
//  NSString+YyCategory.m
//  CloudStore
//
//  Created by Yitian on 2018/5/21.
//  Copyright © 2018年 YiTian. All rights reserved.
//

#import "NSString+YyCategory.h"
#import <sys/utsname.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

//屏幕高度
#define Height   [[UIScreen mainScreen] bounds].size.height

@implementation NSString (YyCategory)


+ (NSAttributedString *)yy_CreatFuTextForJiCaiTitle:(NSString *)_str {
    
    //创建富文本
    NSMutableAttributedString *attri;
    
//    if (@available(iOS 11.4, *)) {
//        attri = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\t %@",_str]];
//    } else {
        attri = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\t\t\t\t\t\t\t\t\t\t%@",_str]];
//    }

    //设置行间距
    NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    // 行间距设置为5
    [paragraphStyle  setLineSpacing:5];
    [attri  addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [attri length])];
    
    return attri;
}

/*
 //NSTextAttachment可以将要插入的图片作为特殊字符处理
 NSTextAttachment *attch = [[NSTextAttachment alloc] init];
 //定义图片内容及位置和大小
 attch.image = [UIImage imageNamed:@"集采.png"];
 attch.bounds = CGRectMake(0, 0, YY_SCALE(35), YY_SCALE(11));
 //创建带有图片的富文本
 NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
 
 
 //将图片放在最后一位
 //[attri appendAttributedString:string];
 //将图片放在第一位
 [attri insertAttributedString:string atIndex:0];
 */

//加法
+ (NSString *)yy_JiaFa:(NSString *)_num1 and:(NSString *)_num2 {
    _num1 = _num1.length > 0 ? _num1 : @"0";
    _num2 = _num2.length > 0 ? _num2 : @"0";
    NSDecimalNumber *count0   = [NSDecimalNumber decimalNumberWithString:_num1];
    NSDecimalNumber *count1   = [NSDecimalNumber decimalNumberWithString:_num2];
    NSDecimalNumber *chengFa  = [count0 decimalNumberByAdding:count1];
    return [NSString stringWithFormat:@"%.2f",chengFa.doubleValue];
}

//减法
+ (NSString *)yy_JianFa:(NSString *)_num1 and:(NSString *)_num2 {
    _num1 = _num1.length > 0 ? _num1 : @"0";
    _num2 = _num2.length > 0 ? _num2 : @"0";
    NSDecimalNumber *count0   = [NSDecimalNumber decimalNumberWithString:_num1];
    NSDecimalNumber *count1   = [NSDecimalNumber decimalNumberWithString:_num2];
    NSDecimalNumber *chengFa  = [count0 decimalNumberBySubtracting:count1];
    return [NSString stringWithFormat:@"%.2f",chengFa.doubleValue];;
}

//乘法
+ (NSString *)yy_ChengFa:(NSString *)_num1 and:(NSString *)_num2 {
    _num1 = _num1.length > 0 ? _num1 : @"0";
    _num2 = _num2.length > 0 ? _num2 : @"0";
    NSDecimalNumber *count0   = [NSDecimalNumber decimalNumberWithString:_num1];
    NSDecimalNumber *count1   = [NSDecimalNumber decimalNumberWithString:_num2];
    NSDecimalNumber *chengFa  = [count0 decimalNumberByMultiplyingBy:count1];
    return [NSString stringWithFormat:@"%.2f",chengFa.doubleValue];;
}

//除法
+ (NSString *)yy_ChuFa:(NSString *)_num1 and:(NSString *)_num2 {
    _num1 = _num1.length > 0 ? _num1 : @"0";
    _num2 = _num2.length > 0 ? _num2 : @"0";
    NSDecimalNumber *count0   = [NSDecimalNumber decimalNumberWithString:_num1];
    NSDecimalNumber *count1   = [NSDecimalNumber decimalNumberWithString:_num2];
    NSDecimalNumber *chengFa  = [count0 decimalNumberByDividingBy:count1];
    return [NSString stringWithFormat:@"%.2f",chengFa.doubleValue];;
}


+ (NSDecimalNumber *)yy_DecimalNumber:(NSString *)_str {
    NSDecimalNumber *amountDe   = [NSDecimalNumber decimalNumberWithString:_str];
    return amountDe;
}

+ (NSString *)yy_DecimalString:(NSString *)_str {
    NSDecimalNumber *amountDe   = [NSDecimalNumber decimalNumberWithString:_str];
    return [NSString stringWithFormat:@"%.2f",amountDe.doubleValue];
}



+ (NSString *)yy_repairLongFloatString:(NSString *)_numStr {
    double num = [[NSString yy_isValueNSString:_numStr] doubleValue];
    NSString *numStr = [NSString stringWithFormat:@"%.2f",num];
    return numStr;
}

+ (NSString *)yy_isValueNSString:(NSString *)str {
    NSString *resultStr = nil;
//    NSString *text = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([str isEqual:[NSNull null]]
        ||[NSString stringWithFormat:@"%@",str]==nil
        ||[NSString stringWithFormat:@"%@",str].length==0
        ||[[NSString stringWithFormat:@"%@",str] isEqual:@"<null>"]
        ||[[NSString stringWithFormat:@"%@",str] isEqual:@"(null)"]
        //||([text length] == 0)
        ) {
        resultStr = @"";
    }else{
        resultStr = [NSString stringWithFormat:@"%@",str];
    }
    return resultStr;
}

+ (BOOL)yy_isEmpty:(NSString *)inputString {
    NSString *string = inputString;
    if([string isKindOfClass:[NSNull class]]){
        return YES;
    }
    if (string == nil) {
        return YES;
    }
    if ([string isEqualToString:@"(null)"]) {
        return YES;
    }
    NSString *text = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([text length] == 0) {
        return YES;
    }
    return NO;
}

/*   //同样是 修复 99.9999998 和 100.00000001 的问题.
 -(float)roundFloat:(float)price{
 NSString *temp = [NSString stringWithFormat:@"%.7f",price];
 NSDecimalNumber *numResult = [NSDecimalNumber decimalNumberWithString:temp];
 NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
 decimalNumberHandlerWithRoundingMode:NSRoundBankers
 scale:2
 raiseOnExactness:NO
 raiseOnOverflow:NO
 raiseOnUnderflow:NO
 raiseOnDivideByZero:YES];
 return [[numResult decimalNumberByRoundingAccordingToBehavior:roundUp] floatValue];
 }
 */


+ (CGSize)yy_StrSizeRectWithSize:(CGSize)size font:(UIFont *)_font str:(NSString *)_text
{
    NSDictionary *attribute = @{NSFontAttributeName:_font};
    
    CGSize retSize = [_text boundingRectWithSize:size
                                         options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                      attributes:attribute
                                         context:nil].size;
    
    return retSize;
}

- (CGSize)yy_sizeWithlimitSize:(CGSize)limitSize attribute:(NSDictionary *)attribute{
    return  [self boundingRectWithSize:limitSize
                               options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading
                            attributes:attribute
                               context:nil].size;
}

//返回 手机型号
+ (NSString*)yy_iphoneType {
    
    //需要导入头文件：#import <sys/utsname.h>
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString*platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if([platform isEqualToString:@"iPhone1,1"])  return@"iPhone 2G";
    
    if([platform isEqualToString:@"iPhone1,2"])  return@"iPhone 3G";
    
    if([platform isEqualToString:@"iPhone2,1"])  return@"iPhone 3GS";
    
    if([platform isEqualToString:@"iPhone3,1"])  return@"iPhone 4";
    
    if([platform isEqualToString:@"iPhone3,2"])  return@"iPhone 4";
    
    if([platform isEqualToString:@"iPhone3,3"])  return@"iPhone 4";
    
    if([platform isEqualToString:@"iPhone4,1"])  return@"iPhone 4S";
    
    if([platform isEqualToString:@"iPhone5,1"])  return@"iPhone 5";
    
    if([platform isEqualToString:@"iPhone5,2"])  return@"iPhone 5";
    
    if([platform isEqualToString:@"iPhone5,3"])  return@"iPhone 5c";
    
    if([platform isEqualToString:@"iPhone5,4"])  return@"iPhone 5c";
    
    if([platform isEqualToString:@"iPhone6,1"])  return@"iPhone 5s";
    
    if([platform isEqualToString:@"iPhone6,2"])  return@"iPhone 5s";
    
    if([platform isEqualToString:@"iPhone7,1"])  return@"iPhone 6 Plus";
    
    if([platform isEqualToString:@"iPhone7,2"])  return@"iPhone 6";
    
    if([platform isEqualToString:@"iPhone8,1"])  return@"iPhone 6s";
    
    if([platform isEqualToString:@"iPhone8,2"])  return@"iPhone 6s Plus";
    
    if([platform isEqualToString:@"iPhone8,4"])  return@"iPhone SE";
    
    if([platform isEqualToString:@"iPhone9,1"])  return@"iPhone 7";
    
    if([platform isEqualToString:@"iPhone9,3"])  return@"iPhone 7";
    
    if([platform isEqualToString:@"iPhone9,2"])  return@"iPhone 7 Plus";
    
    if([platform isEqualToString:@"iPhone9,4"])  return@"iPhone 7 Plus";
    
    if([platform isEqualToString:@"iPhone10,1"]) return@"iPhone 8";
    
    if([platform isEqualToString:@"iPhone10,4"]) return@"iPhone 8";
    
    if([platform isEqualToString:@"iPhone10,2"]) return@"iPhone 8 Plus";
    
    if([platform isEqualToString:@"iPhone10,5"]) return@"iPhone 8 Plus";
    
    if([platform isEqualToString:@"iPhone10,3"]) return@"iPhone X";
    
    if([platform isEqualToString:@"iPhone10,6"]) return@"iPhone X";
    
    if([platform isEqualToString:@"iPod1,1"])  return@"iPod Touch 1G";
    
    if([platform isEqualToString:@"iPod2,1"])  return@"iPod Touch 2G";
    
    if([platform isEqualToString:@"iPod3,1"])  return@"iPod Touch 3G";
    
    if([platform isEqualToString:@"iPod4,1"])  return@"iPod Touch 4G";
    
    if([platform isEqualToString:@"iPod5,1"])  return@"iPod Touch 5G";
    
    if([platform isEqualToString:@"iPad1,1"])  return@"iPad 1G";
    
    if([platform isEqualToString:@"iPad2,1"])  return@"iPad 2";
    
    if([platform isEqualToString:@"iPad2,2"])  return@"iPad 2";
    
    if([platform isEqualToString:@"iPad2,3"])  return@"iPad 2";
    
    if([platform isEqualToString:@"iPad2,4"])  return@"iPad 2";
    
    if([platform isEqualToString:@"iPad2,5"])  return@"iPad Mini 1G";
    
    if([platform isEqualToString:@"iPad2,6"])  return@"iPad Mini 1G";
    
    if([platform isEqualToString:@"iPad2,7"])  return@"iPad Mini 1G";
    
    if([platform isEqualToString:@"iPad3,1"])  return@"iPad 3";
    
    if([platform isEqualToString:@"iPad3,2"])  return@"iPad 3";
    
    if([platform isEqualToString:@"iPad3,3"])  return@"iPad 3";
    
    if([platform isEqualToString:@"iPad3,4"])  return@"iPad 4";
    
    if([platform isEqualToString:@"iPad3,5"])  return@"iPad 4";
    
    if([platform isEqualToString:@"iPad3,6"])  return@"iPad 4";
    
    if([platform isEqualToString:@"iPad4,1"])  return@"iPad Air";
    
    if([platform isEqualToString:@"iPad4,2"])  return@"iPad Air";
    
    if([platform isEqualToString:@"iPad4,3"])  return@"iPad Air";
    
    if([platform isEqualToString:@"iPad4,4"])  return@"iPad Mini 2G";
    
    if([platform isEqualToString:@"iPad4,5"])  return@"iPad Mini 2G";
    
    if([platform isEqualToString:@"iPad4,6"])  return@"iPad Mini 2G";
    
    if([platform isEqualToString:@"iPad4,7"])  return@"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad4,8"])  return@"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad4,9"])  return@"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad5,1"])  return@"iPad Mini 4";
    
    if([platform isEqualToString:@"iPad5,2"])  return@"iPad Mini 4";
    
    if([platform isEqualToString:@"iPad5,3"])  return@"iPad Air 2";
    
    if([platform isEqualToString:@"iPad5,4"])  return@"iPad Air 2";
    
    if([platform isEqualToString:@"iPad6,3"])  return@"iPad Pro 9.7";
    
    if([platform isEqualToString:@"iPad6,4"])  return@"iPad Pro 9.7";
    
    if([platform isEqualToString:@"iPad6,7"])  return@"iPad Pro 12.9";
    
    if([platform isEqualToString:@"iPad6,8"])  return@"iPad Pro 12.9";
    
    if([platform isEqualToString:@"i386"])  return@"iPhone Simulator";
    
    if([platform isEqualToString:@"x86_64"])  return@"iPhone Simulator";
    
    return platform;
    
}

/**
 *  获取程序的版本号   CFBundleShortVersionString
 *
 *  @return return value description
 */
+ (NSString *)yy_getAppVersion {
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [info objectForKey:@"CFBundleShortVersionString"];
    return version;
}

/**
 str 是否包含某个str
 
 @param string 被检测用的str
 @return 包含:YES  不包含:NO
 */
- (BOOL)yy_isContainString:(NSString *)string {
    return [self rangeOfString:string].location != NSNotFound;
}


//判断 是否有 刘海屏
+ (BOOL)yy_judgeBangScreen {
    struct utsname systemInfo;
    uname(&systemInfo);
    BOOL style = NO;
    NSString*platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform rangeOfString:@"iPhone"].location != NSNotFound) {
        NSArray *array = [[platform substringFromIndex:6] componentsSeparatedByString:@","];
        NSInteger mark1 = [array.firstObject integerValue];
        NSInteger mark2 = [array.firstObject integerValue];
        
        if (mark1 > 10) {
            style = YES;
        }
        else {
            if (mark1 == 10) {
                if (mark2==3 || mark2 == 6) {
                    style = YES;
                }
            }
            else {
                style = NO;
            }
        }
        
    }
    return style;
}


//3.0 圈子 把 付款人数等 人数类的显示  整型一下
+ (NSString *)yy_changeLongNum:(NSString *)_num {
    NSString *changeNum;
    NSInteger num = [_num integerValue];
    if (num <= 9999) {
        changeNum = [NSString stringWithFormat:@"已售%ld件",(long)num];
    }
    else {
        
        changeNum = [NSString stringWithFormat:@"已售%.1f万件",num / 10000.0f];
    }
    return changeNum;
}





#pragma mark 正则表达式
+(BOOL)MatchLetter:(NSString *)_str
{
    NSString *str = [_str substringToIndex:1];
    //判断是否以字母开头
    NSString *ZIMU = @"^[A-Za-z]+$";
    NSPredicate *regextestA = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", ZIMU];
    
    if ([regextestA evaluateWithObject:str] == YES)
        return YES;
    else
        return NO;
}

+(BOOL)isChineseFirst:(NSString *)_str
{
    NSString *firstStr = [_str substringToIndex:1];
    
    //是否以中文开头(unicode中文编码范围是0x4e00~0x9fa5)
    int utfCode = 0;
    void *buffer = &utfCode;
    NSRange range = NSMakeRange(0, 1);
    //判断是不是中文开头的,buffer->获取字符的字节数据 maxLength->buffer的最大长度 usedLength->实际写入的长度，不需要的话可以传递NULL encoding->字符编码常数，不同编码方式转换后的字节长是不一样的，这里我用了UTF16 Little-Endian，maxLength为2字节，如果使用Unicode，则需要4字节 options->编码转换的选项，有两个值，分别是NSStringEncodingConversionAllowLossy和NSStringEncodingConversionExternalRepresentation range->获取的字符串中的字符范围,这里设置的第一个字符 remainingRange->建议获取的范围，可以传递NULL
    BOOL b = [firstStr getBytes:buffer maxLength:2 usedLength:NULL encoding:NSUTF16LittleEndianStringEncoding options:NSStringEncodingConversionExternalRepresentation range:range remainingRange:NULL];
    if (b && (utfCode >= 0x4e00 && utfCode <= 0x9fa5))
        return YES;
    else
        return NO;
}






/*
 * 功能 ： 32位MD5
 * 参数 : inputString : 输入字符串
 * return : 返回MD5后的字符串
 */
+(NSString *)yy_md5:(NSString *)inputString {
//    const char *cStr = [str UTF8String];
//    unsigned char result[16];
//    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
//    return [NSString stringWithFormat:
//            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
//            result[0], result[1], result[2], result[3],
//            result[4], result[5], result[6], result[7],
//            result[8], result[9], result[10], result[11],
//            result[12], result[13], result[14], result[15]
//            ];
    
    const char *cStr = [inputString UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest ); // This is the md5 call
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return  output;
}

/*
 * 功能 ： 编码
 * 参数 : inputString : 输入字符串
 * return : 返回编码后的字符串
 */
+ (NSString *)yy_encodeToPercentEscapeString: (NSString *) inputString{
    CFStringRef cfString = CFURLCreateStringByAddingPercentEscapes(
                                                                   NULL, /* allocator */
                                                                   (__bridge CFStringRef)inputString,
                                                                   NULL, /* charactersToLeaveUnescaped */
                                                                   (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                   kCFStringEncodingUTF8);
    NSString *outputStr = [NSString stringWithString:(__bridge NSString *)cfString];
    CFRelease(cfString);
    return outputStr;
}

/*
 * 功能 ： 解码
 * 参数 : inputString : 输入字符串
 * return : 返回解码后的字符串
 */
+ (NSString *)yy_decodeFromPercentEscapeString: (NSString *) inputString{
    NSMutableString *outputStr = [NSMutableString stringWithString:inputString];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@""
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0,[outputStr length])];
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

/*
 * 功能 : 获取UUID
 * return : 返回UUID的字符串
 */
+ (NSString*)yy_generateUUID{
    CFUUIDRef  uuidObj = CFUUIDCreate(nil);
    NSString  *uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(nil, uuidObj);
    CFRelease(uuidObj);
    return uuidString;
}

/*
 * 功能 : 获取UTC时间
 * return : 返回UTC时间的字符串
 */
+ (NSString *)yy_getDateUTCTime{
    char date_str[21] = {0};
    time_t t = time(NULL)-28800;  // UTC秒数
    struct tm *tp = localtime(&t);
    sprintf(date_str, "%04d", tp->tm_year+1900);
    sprintf(date_str+4, "%s", "-");
    sprintf(date_str+5, "%02d", tp->tm_mon+1);
    sprintf(date_str+7, "%s", "-");
    sprintf(date_str+8, "%02d", tp->tm_mday);
    sprintf(date_str+10, "%s", "T");
    sprintf(date_str+11, "%02d", tp->tm_hour);
    sprintf(date_str+13, "%s", ":");
    sprintf(date_str+14, "%02d", tp->tm_min);
    sprintf(date_str+16, "%s", ":");
    sprintf(date_str+17, "%02d", tp->tm_sec);
    sprintf(date_str+19, "%s", "Z");
    NSString *output = [NSString stringWithFormat:@"%s",date_str];
    return output;
}


//HmacSHA1加密；
+(NSString *)yy_HmacSha1:(NSString *)key input:(NSString *)input
{
    const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [input cStringUsingEncoding:NSASCIIStringEncoding];
    //Sha256:
    // unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
    //CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    //sha1
    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC
                                          length:sizeof(cHMAC)];
    
    NSString *hash = [HMAC base64EncodedStringWithOptions:0];//将加密结果进行一次BASE64编码。
    return hash;
}

//密码加密方式：SHA1
+(NSString *)yy_EncriptPassword_SHA1:(NSString *)password{
    const char *cstr = [password cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:password.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString* result = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH *2];
    
    for(int i =0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    
    return [result uppercaseString];
}


#pragma mark - 数据类型转换
/**
 字典转成 jsonStr
 
 @param dict 字典
 @return 返jsonStr
 */
+ (NSString *)yy_textFromDict:(NSDictionary *)dict
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

/**
 base64编码
 
 @param text 输入str
 @return 返回base64编码后的str
 */
+ (NSString *)yy_base64StringFromText:(NSString *)text {
    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [data base64EncodedStringWithOptions:0];
    return base64String;
}

/**
 base64解码
 
 @param base64 输入base64s字符串
 @return 返回解码后的str
 */
+ (NSString *)yy_textFromBase64String:(NSString *)base64 {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString *text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return text;
}



/**
 *  是否包含中文
 *
 *  @return
 */
- (BOOL)yy_isContainChinese {
    for(int i=0; i< [self length];i++){
        int a = [self characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
            return YES;
    }
    return NO;
}

/**
 是否为纯中文
 
 @return
 */
- (BOOL)yy_isChinese {
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

/**
 *  是否只有英文和数字
 *
 *  @return
 */
- (BOOL)yy_isOnlyContainNumberOrLatter {
    if( [NSString yy_isEmpty:self]) return NO;
    
    for (NSInteger i = 0; i < self.length; i++) {
        unichar ch = [self characterAtIndex:i];
        if (!(((ch >= 'a') && (ch <= 'z')) || ((ch >= 'A') && (ch <= 'Z')) || ((ch >= '0') && (ch <= '9')))){ //0=48
            return NO;
        }
    }
    return YES;
}


/**
 *  是否为整型
 *
 *  @return
 */
- (BOOL)yy_isPureInt{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

/**
 *  是否为浮点型
 *
 *  @return
 */
- (BOOL)yy_isPureFloat{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}



- (NSString *)zp_pinyinUppercase{
    if ([NSString yy_isEmpty:self]) {
        return self;
    }
    return [[self zp_pinyin] uppercaseString];
}

- (NSString *)zp_pinyinLowercase{
    if ([NSString yy_isEmpty:self]) {
        return self;
    }
    return [[self zp_pinyin] lowercaseString];
}

- (NSString *)zp_pinyin {
    //先转换为带声调的拼音
    NSMutableString *str = [self mutableCopy];
    
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    return str;
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


/**
 乡食念 给电话 加分割分割线
 
 @param _str -
 @return -
 */
+ (NSString *)yy_FXChangePhone:(NSString *)_str {
    NSMutableString *string = [[NSMutableString alloc] init];
    [string setString:YY_String(_str)];
    if (string.length > 0) {
        [string insertString:@"-" atIndex:6];
        [string insertString:@"-" atIndex:3];
    }
    return string;
}



/**
 脱敏手机号
 
 @param _str 手机号
 @return 脱敏后的
 */
+ (NSString *)yy_SecretPhone:(NSString *)_str {
    return [NSString stringWithFormat:@"%@****%@",[_str substringToIndex:3],[_str substringFromIndex:7]];
}
- (NSString *)yy_SecretPhone {
    return [NSString stringWithFormat:@"%@****%@",[self substringToIndex:3],[self substringFromIndex:7]];
}

/**
 脱敏身份证号
 
 @param _str 身份证号
 @return 脱敏
 */
+ (NSString *)yy_SecretIdCard:(NSString *)_str {
    return  [NSString stringWithFormat:@"%@****************%@",[_str substringToIndex:1],[_str substringFromIndex:17]];
}
- (NSString *)yy_SecretIdCard {
    return  [NSString stringWithFormat:@"%@****************%@",[self substringToIndex:1],[self substringFromIndex:17]];
}




/**
 返回格式化时间

 @param _formate 格式化样式
 @param time 时间戳 秒和毫秒都可以
 @return 格式化后时间
 */
+(NSString *)yy_DateTypeFormate:(NSString *)_formate time:(NSString *)time {
    if ([time isEqual:[NSNull null]]||time.length==0||[time isEqualToString:@"(null)"]) {
        return @"";
    }

    NSString *timeStr;
    if (time.length==10) {
        timeStr = self;
    }
    else if (time.length==13) {
        timeStr = [time substringToIndex:10];
    }
    else {
        return time;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:_formate]; // 设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:timeStr.integerValue];
    NSString *theDay = [formatter stringFromDate:nowDate];//日期的年月日
    return [NSString stringWithFormat:@"%@",theDay];
}

- (NSString *)yy_DateTypeFormate:(NSString *)_formate {
    if ([self isEqual:[NSNull null]]||self.length==0||[self isEqualToString:@"(null)"]) {
        return @"";
    }
    
    NSString *timeStr;
    if (self.length==10) {
        timeStr = self;
    }
    else if (self.length==13) {
        timeStr = [self substringToIndex:10];
    }
    else {
        return self;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:_formate]; // 设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSDate *nowDate = [NSDate dateWithTimeIntervalSince1970:timeStr.integerValue];
    NSString *theDay = [formatter stringFromDate:nowDate];//日期的年月日
    return [NSString stringWithFormat:@"%@",theDay];
}


/**
 时间str -> 时间戳
 */
+ (NSString *)yy_getTimestampFromTime:(NSString *)_dateStr dateFormatter:(NSString *)_formatter {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:_formatter];
    NSDate *datestr = [dateFormatter dateFromString:_dateStr];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datestr timeIntervalSince1970]*1000];
    
    return timeSp;
}



@end
