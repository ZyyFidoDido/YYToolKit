//
//  RegularHelp.m
//  3DES加密解密
//
//  Created by tgs on 14-10-17.
//  Copyright (c) 2014年 tgs. All rights reserved.
//

#import "RegularHelp.h"

@implementation RegularHelp

#pragma mark - 手机号 校验
+ (BOOL)isValidateTelPhone:(NSString *)telphoneString {
   /* NSString *telRegex = @"(((13[0-9]{1})|(14[579]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+[0-9]{8})";
    
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", telRegex];
    return [regExPredicate evaluateWithObject:telphoneString];*/
    if (telphoneString.length!=11) {
        return NO;
    }
    else{
        return YES;
    }
}

#pragma mark - 电话号码，传真
+(BOOL)isValidatePhoneAndFax:(NSString *)phoneNumber{
    NSString *phoneNumberRegex = @"^[+]{0,1}(\\d){1,3}[ ]?([-]?((\\d)|[ ]){1,12})+$";
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneNumberRegex];
    return [regExPredicate evaluateWithObject:phoneNumber] ;
}
#pragma mark - email 校验
+ (BOOL)isValidateEmail:(NSString *)emailString {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [regExPredicate evaluateWithObject:emailString] ;
}

#pragma mark - 密码大小写英文字母和数字
+ (BOOL)isValidatePassword:(NSString *)string
{
    BOOL isExistDigit = ([string rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound) ? YES : NO;
    BOOL isExistLetter = ([string rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet]].location != NSNotFound) ? YES : NO;
    return isExistDigit && isExistLetter;
}
#pragma mark - 输入金额，只能是数字或小数点

+(BOOL)isValidateAmount:(NSString *)string{
    NSString *regex = @"^(-)?(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){1,2})?$";
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [regExPredicate evaluateWithObject:string] ;
}

+(BOOL)isValidateAmountPositiveNum:(NSString *)string{
    NSString *regex = @"^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){1,2})?$";
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [regExPredicate evaluateWithObject:string];
}

#pragma mark - 必须包含有数字和字母
+ (BOOL) isValidateWithStr: (NSString *)string
{
    BOOL flag;
    if (string.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex = @"^(?![^0-9]+$)(?![^a-zA-Z]+$).+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:string];
}

#pragma mark - 只包含数字或字母:可以全是数字，也可以全是字母，还可以混合搭配。
+ (BOOL)isValidateNumLetter: (NSString *)string
{
    BOOL flag;
    if (string.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex = @"^[A-Za-z0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:string];
}

#pragma mark - 全是数字或全是字母
+ (BOOL)isOnlyNumOrLetter:(NSString *)string
{
    NSString *regex = @"^\\d+|[a-zA-Z]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:string];
}
#pragma mark - 只能数字+字母
+ (BOOL) isNumAndchar:(NSString *) str{
    
    NSString *regex = @"^[A-Za-z0-9]+$";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [test evaluateWithObject:str];
}

#pragma mark - 银行卡 校验 //2银行卡,  16、18、19 位数字
+ (BOOL)isValidateBankCard:(NSString *)string
{
    NSString *regex = @"^\\d{16}|\\d{18}|\\d{19}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:string];
}

#pragma mark - 小于19位的数字
+ (BOOL)isValidateVCCard:(NSString *)string
{
    NSString *regex = @"^\\d{1,19}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:string];
}

#pragma mark - 身份证识别码 百度百科
+(BOOL)checkIdentityCardNo:(NSString*)cardNo
{
    if (cardNo.length != 18) {
        return  NO;
    }
    NSArray* codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
    NSDictionary* checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil]  forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
    
    NSScanner* scan = [NSScanner scannerWithString:[cardNo substringToIndex:17]];
    
    int val;
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    if (!isNum) {
        return NO;
    }
    int sumValue = 0;
    
    for (int i =0; i<17; i++) {
        sumValue+=[[cardNo substringWithRange:NSMakeRange(i , 1) ] intValue]* [[codeArray objectAtIndex:i] intValue];
    }
    
    NSString* strlast = [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d",sumValue%11]];
    
    if ([strlast isEqualToString: [[cardNo substringWithRange:NSMakeRange(17, 1)]uppercaseString]]) {
        return YES;
    }
    return  NO;
}

#pragma mark - 身份证 校验
+ (BOOL) isValidateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

#pragma mark - 军官证 校验
+ (BOOL)isValidateOfficer:(NSString *)emailString
{
    NSString *emailRegex = @"^\\d{8}$";
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [regExPredicate evaluateWithObject:emailString] ;
}

#pragma mark - 护照 校验
+ (BOOL)isValidatePassport:(NSString *)string
{
    NSString *regex = @"^(P\\d{7}|G\\d{8}|S\\d{7,8}|D\\d+|1[4,5]\\d{7})$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:string];
}

#pragma mark -/*车牌号验证 MODIFIED BY HELENSONG*/
+(BOOL) validateCarNo:(NSString* )carNo
{
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}
#pragma mark -/*用户名正则*/
+ (BOOL)validateUserName:(NSString *)name
{
    NSString * nameReges = @"^[a-zA-Z\u4E00-\u9FA5][a-zA-Z0-9_\u4E00-\u9FA5]{5,19}$";
    NSPredicate *check = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nameReges];
    NSLog(@"check is %@",check);
    return [check evaluateWithObject:name];
}
#pragma mark -/*密码正则*/
+ (BOOL)validatePassword:(NSString *)password
{
    NSString * psdReges = @"^[A-Za-z0-9,.;':\"!+-/=?>)(<&%^#]{6,20}$";
    NSPredicate *check = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",psdReges];
    NSLog(@"check is %@",check);
    return [check evaluateWithObject:password];
}
#pragma mark -/*身份证正则*/
+ (BOOL)validateMemberCardNo:(NSString *)cardNo
{
    //^([1-9]\\d{5}[12][089][0-9]\\d{1}((0[0-9])|(1[012]))(([012][0-9])|(3[01]))[0-9]\\d{2}(\\d|X|x))
    //^[1-9]{5}[1-9]{3}((0)|(1[0-2]))(([0|1|2])|3[0-1]){3}(|x|X)$
    NSString * CardReges = @"^(\\d{15}$|^\\d{18}$|^\\d{17}(\\d|X|x))$";
    if(cardNo.length == 15){
        
        CardReges = @"^([1-9]\\d{5}[0-9]\\d{1}((0[1-9])|(1[012]))(([012][0-9])|(3[01]))[0-9]\\d{2})$";
    }
    else if(cardNo.length == 18){
        CardReges = @"^([1-9]\\d{5}[12][089][0-9]\\d{1}((0[1-9])|(1[012]))(([012][0-9])|(3[01]))[0-9]\\d{2}(\\d|X|x))$";
    }
    NSPredicate *check = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CardReges];
    NSLog(@"check is %@",check);
    return [check evaluateWithObject:cardNo];
}

//7. 姓名：由2~20个字符组成，允许中文（算1个字符）、字母
+(BOOL)checkRealName:(NSString *)name
{
    NSString * nameReges = @"^[a-zA-Z\u4E00-\u9FA5]{2,20}$";
    NSPredicate *check = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nameReges];
    NSLog(@"check is %@",check);
    return [check evaluateWithObject:name];
}

+(BOOL)checkTextFormat:(NSString *)text
{
    NSString * nameReges = @"^[a-zA-Z0-9\\p{Punct}_\u4e00-\u9fa5 \\n]+$";
    NSPredicate *check = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nameReges];
    NSLog(@"check is %@",check);
    return [check evaluateWithObject:text];
    
}

/*
 方法名:formattedString
 参数:原来的银行卡号
 功能:银行卡 格式化
 日期: by wei 2014-04-25
 */

+ (NSString *)formattedStringWithBankCard:(NSString *)_number
{
    NSRegularExpression *regex;
    
    regex = [NSRegularExpression regularExpressionWithPattern:@"(\\d{1,4})" options:0 error:NULL];
    
    NSArray *matches = [regex matchesInString:_number options:0 range:NSMakeRange(0, _number.length)];
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:matches.count];
    
    for (NSTextCheckingResult *match in matches) {
        for (int i = 1; i < [match numberOfRanges]; i++) {
            NSRange range = [match rangeAtIndex:i];
            
            if (range.length > 0) {
                NSString *matchText = [_number substringWithRange:range];
                [result addObject:matchText];
            }
        }
    }
    return [result componentsJoinedByString:@" "];
}

+ (BOOL)checkPasswordFormat:(NSString *)text
{
    NSString *passRegex = @"^(?!^[0-9]+$)(?!^[A-Za-z]+$)(?!^[!@#$%^&*?<_>:;{}.,”]+$)[a-zA-Z0-9!@#$%^&*?<_>:;{}.,”]*$";
    NSPredicate *check = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passRegex];
    NSLog(@"check is %@",check);
    return [check evaluateWithObject:text];
}

+(BOOL)isValidNumber:(NSString *)text{
    if (text.length!=6) {
        return NO;
    }
    NSInteger len = text.length;
    for (int i=0; i<len; i++) {
        char a = [text characterAtIndex:i];
        if (a>='0'&&a<='9') {
        }else{
            return NO;
        }
    }
    return YES;
}

/*验证纯数字*/
+(BOOL)isAllNumber:(NSString *)text{
    NSInteger len = text.length;
    for (int i=0; i<len; i++) {
        char a = [text characterAtIndex:i];
        if (a>='0'&&a<='9') {
        }else{
            return NO;
        }
    }
    return YES;
}

@end










