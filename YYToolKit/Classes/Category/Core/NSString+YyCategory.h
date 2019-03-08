//
//  NSString+YyCategory.h
//  CloudStore
//
//  Created by Yitian on 2018/5/21.
//  Copyright © 2018年 YiTian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YyCategory)

/**
 title 加集采图
 */
+ (NSAttributedString *)yy_CreatFuTextForJiCaiTitle:(NSString *)_str;

#pragma mark - 四则运算
/**
 加法

 @param _num1 数字Str
 @param _num2 数字Str
 @return 返回Str
 */
+ (NSString *)yy_JiaFa:(NSString *)_num1 and:(NSString *)_num2;

/**
 减法

 @param _num1 减数
 @param _num2 被减数
 @return 返回Str
 */
+ (NSString *)yy_JianFa:(NSString *)_num1 and:(NSString *)_num2;

/**
 乘法

 @param _num1 数字Str
 @param _num2 数字Str
 @return 返回Str
 */
+ (NSString *)yy_ChengFa:(NSString *)_num1 and:(NSString *)_num2;

/**
 除法

 @param _num1 除数
 @param _num2 被除数
 @return 返回Str
 */
+ (NSString *)yy_ChuFa:(NSString *)_num1 and:(NSString *)_num2;


+ (NSString *)yy_DecimalString:(NSString *)_str;


/**
 修复 后台返回 double 类型数据(已非空验证),如 返回99.99 却展示成 99.99999999998 . 和 100 -> 100.00000000001

 @param _numStr 后台返回的 double 数据Str
 @return 保留两位的字符串
 */
+ (NSString *)yy_repairLongFloatString:(NSString *)_numStr;



#pragma mark - 空串纠正
/**
 修正 后台数据 返回为 空/nil/null/@"" 等情况

 @param str 后台返回的数据
 @return 返回字符串对象 为空 -> @"" , 有数据 @"str"
 */
+ (NSString *)yy_isValueNSString:(NSString *)str;


/**
 判断字符串是否为空

 @param inputString 输入字符串
 @return 空:YES 非空:NO
 */
+ (BOOL)yy_isEmpty:(NSString *)inputString;



/**
 str 是否包含某个str

 @param string 被检测用的str
 @return 包含:YES  不包含:NO
 */
- (BOOL)yy_isContainString:(NSString *)string;


#pragma mark - 一般功能

/**
 返回 手机型号

 @return 返回 手机型号
 */
+ (NSString*)yy_iphoneType;

/**
 *  获取程序的版本号   CFBundleShortVersionString
 *
 *  @return return value description
 */
+ (NSString *)yy_getAppVersion;



/**
 判断 是否有 刘海屏

 @return YES or NO
 */
+ (BOOL)yy_judgeBangScreen;

/**
 返回文字的 size

 @param size 想要限制的size大小
 @param _font 字体
 @param _text 文字内容
 @return size
 */
+ (CGSize)yy_StrSizeRectWithSize:(CGSize)size font:(UIFont *)_font str:(NSString *)_text;



/**
 *  返回文字的 size
 *
 *  @param string    content
 *  @param limitSize size
 *  @param attribute Additional parameter
 *
 *  @return
 */
- (CGSize)yy_sizeWithlimitSize:(CGSize)limitSize attribute:(NSDictionary *)attribute;

//3.0 圈子 把 付款人数等 人数类的显示  整型一下
+ (NSString *)yy_changeLongNum:(NSString *)_num;




/**
 判断 首字母是字母

 @param _str 验证的字符串
 @return YES/NO
 */
+(BOOL)MatchLetter:(NSString *)_str;


/**
 判断 首字母是中文

 @param _str 验证的字符串
 @return YES/NO
 */
+(BOOL)isChineseFirst:(NSString *)_str;


/**
 *  是否包含中文
 *
 *  @return
 */
- (BOOL)yy_isContainChinese;


/**
 是否为纯中文

 @return
 */
- (BOOL)yy_isChinese;


/**
 *  是否只有英文和数字
 *
 *  @return
 */
- (BOOL)yy_isOnlyContainNumberOrLatter;

/**
 *  是否为整型
 *
 *  @return
 */
- (BOOL)yy_isPureInt;

/**
 *  是否为浮点型
 *
 *  @return
 */
- (BOOL)yy_isPureFloat;


//整合数据显示
+(NSDecimalNumber *)yy_DecimalNumber:(NSString *)_str;



/**
 32位MD5 加密

 @param str 需要加密的Str
 @return 加密后的Str
 */
+(NSString *)yy_md5:(NSString *)inputString;

/*
 * 功能 ： 编码
 * 参数 : inputString : 输入字符串
 * return : 返回编码后的字符串
 */
+ (NSString *)yy_encodeToPercentEscapeString: (NSString *) inputString;

/*
 * 功能 ： 解码
 * 参数 : inputString : 输入字符串
 * return : 返回解码后的字符串
 */
+ (NSString *)yy_decodeFromPercentEscapeString: (NSString *) inputString;

/*
 * 功能 : 获取UUID
 * return : 返回UUID的字符串
 */
+ (NSString*)yy_generateUUID;

/*
 * 功能 : 获取UTC时间
 * return : 返回UTC时间的字符串
 */
+ (NSString *)yy_getDateUTCTime;

/*
 * 功能 : HmacSHA1加密；
 * return : 返回加密后的字符串
 */
+(NSString *)yy_HmacSha1:(NSString *)key input:(NSString *)input;

/**
 密码加密方式：SHA1

 @param password 密码
 @return SHA1加密串
 */
+(NSString *)yy_EncriptPassword_SHA1:(NSString *)password;


/**
 字典转成 jsonStr

 @param dict 字典
 @return 返jsonStr
 */
+ (NSString *)yy_textFromDict:(NSDictionary *)dict;


/**
 base64编码

 @param text 输入str
 @return 返回base64编码后的str
 */
+ (NSString *)yy_base64StringFromText:(NSString *)text;


/**
 base64解码

 @param base64 输入base64s字符串
 @return 返回解码后的str
 */
+ (NSString *)yy_textFromBase64String:(NSString *)base64;



/**
 *  32位md5大写
 *
 *  @return return value description
 */
- (NSString *)zp_md5_32_UppercaseString;

/**
 *  32位md5小写
 *
 *  @return return value description
 */
- (NSString *)zp_md5_32_LowercaseString;

/**
 *  64位md5大写
 *
 *  @return return value description
 */
- (NSString *)zp_md5_64_UppercaseString;

/**
 *  64位md5小写
 *
 *  @return return value description
 */
- (NSString *)zp_md5_64_LowercaseString;


/**
 *  转化成拼音大写
 *
 *  @return return value description
 */
- (NSString *)zp_pinyinUppercase;

/**
 *  转化成拼音小写
 *
 *  @return return value description
 */
- (NSString *)zp_pinyinLowercase;




/**
 乡食念 给电话 加分割分割线

 @param _str -
 @return -
 */
+ (NSString *)yy_FXChangePhone:(NSString *)_str;


/**
 脱敏手机号

 @param _str 手机号
 @return 脱敏后的
 */
+ (NSString *)yy_SecretPhone:(NSString *)_str;
- (NSString *)yy_SecretPhone;


/**
 脱敏身份证号

 @param _str 身份证号
 @return 脱敏
 */
+ (NSString *)yy_SecretIdCard:(NSString *)_str;
- (NSString *)yy_SecretIdCard;


/**
 返回格式化时间
 
 @param _formate 格式化样式
 @param time 时间戳 秒和毫秒都可以
 @return 格式化后时间
 */
+(NSString *)yy_DateTypeFormate:(NSString *)_formate time:(NSString *)time;
- (NSString *)yy_DateTypeFormate:(NSString *)_formate;


/**
 时间str -> 时间戳
 */
+ (NSString *)yy_getTimestampFromTime:(NSString *)_dateStr dateFormatter:(NSString *)_formatter;
@end
