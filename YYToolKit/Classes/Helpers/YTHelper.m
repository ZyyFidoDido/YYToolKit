//
//  YTHelper.m
//  YitianServicesApp
//
//  Created by Tgs on 16/5/18.
//  Copyright © 2016年 YiTtian. All rights reserved.
//

#import "YTHelper.h"
#import <sys/utsname.h>

@implementation YTHelper
+(UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+(id)isValueNSStringWith:(NSString *)str{
    NSString *resultStr = @"";
    if ([str isEqual:[NSNull null]]
        ||[NSString stringWithFormat:@"%@",str]==nil
        ||[NSString stringWithFormat:@"%@",str].length==0
        ||[[NSString stringWithFormat:@"%@",str] isEqual:@"(null)"]) {
        resultStr = @"";
    }else{
        resultStr = [NSString stringWithFormat:@"%@",str];
    }
    return resultStr;
}

-(void)getStoreLogin{
    
}

+(NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (NSDictionary *)stringChangeObject:(NSString *)jsonString{
    
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

// 对同一个字符串设置不同属性
+ (NSMutableAttributedString *)attrStrFrom:(NSString *)titleStr
                                 numberStr:(NSString *)numberStr
                                  fontSize:(CGFloat)fontSize
                                     color:(UIColor  *)color
{
    NSMutableAttributedString *arrString = [[NSMutableAttributedString alloc]initWithString:titleStr];
    [arrString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],
                               NSForegroundColorAttributeName:color
                               }
                       range:[titleStr rangeOfString:numberStr]];
    return arrString;
}


+ (NSString *)timeIntervalFromLastTime:(NSDate *)lastTime{
    

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM"];
    
    NSString *newString = [formatter stringFromDate:[NSDate date]];
    NSString *lastString = [formatter stringFromDate:lastTime];
    
    
    NSDateFormatter *formatterMM = [[NSDateFormatter alloc] init];
    [formatterMM setDateFormat:@"MM"];
    
    NSString *nowMM = [formatterMM stringFromDate:[NSDate date]];
    NSString *lastMM = [formatterMM stringFromDate:lastTime];
    
    
    NSString *returnString = @"";
    
    if ([newString isEqual:lastString]) {
       
        [formatter setDateFormat:@"HH:mm"];
        NSString *tempString = [formatter stringFromDate:lastTime];
        
        NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
        [formatter1 setDateFormat:@"hh:mm"];
        
        if ([tempString integerValue] > 12) {
            
            NSString *times = [formatter stringFromDate:lastTime];
            
            if (times.length > 2) {
                
                NSString *hours = [times substringToIndex:2];
                NSString *news = [NSString stringWithFormat:@"%2ld",[hours integerValue] - 12];
                
                times = [times stringByReplacingOccurrencesOfString:hours withString:news];
            }
            
            returnString = [NSString stringWithFormat:@"下午 %@",times];
        }else{
            returnString = [NSString stringWithFormat:@"上午 %@",[formatter stringFromDate:lastTime]];
        }
    }else{
        //同月
        if ([nowMM isEqualToString:lastMM]) {
            if ([newString integerValue] - [lastString integerValue] == 1) {
                [formatter setDateFormat:@"HH:mm"];
                returnString = [NSString stringWithFormat:@"昨天 %@",[formatter stringFromDate:lastTime]];
            }
            else {
                [formatter setDateFormat:@"MM月dd日 HH:mm"];
                returnString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:lastTime]];
            }
        }
        else {
            [formatter setDateFormat:@"MM月dd日 HH:mm"];
            returnString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:lastTime]];
        }
        
//        if ([newString integerValue] - [lastString integerValue] == 1) {
//
//            returnString = @"昨天";
//        }else{
//            [formatter setDateFormat:@"MM月dd日"];
//            returnString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:lastTime]];
//        }
    }
    
    return returnString;
}

+ (NSString *)dynamicTimeFromLastTime:(NSDate *)lastTime{
    NSString *returnString = @"";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    
    NSString *newString = [formatter stringFromDate:[NSDate date]];
    NSString *lastString = [formatter stringFromDate:lastTime];
    if ([newString isEqual:lastString]) {
        double timeValue = [[NSDate date] timeIntervalSinceDate:lastTime];
        if (timeValue < 60 ) {
            returnString = @"刚刚";
        }else if (timeValue >= 60 && timeValue < 60*60){
            returnString = [NSString stringWithFormat:@"%.0f分钟前",timeValue/60];
        }else{
            NSDateFormatter *tempformater = [[NSDateFormatter alloc] init];
            [tempformater setDateFormat:@"dd-MM"];
            [formatter setDateFormat:@"HH:mm"];
            NSString *tempNow = [tempformater stringFromDate:[NSDate date]];
            NSString *tempLast = [tempformater stringFromDate:lastTime];
            if ((tempNow.length > 2) && (tempLast.length > 2)) {
                int dayDistance = [[tempNow substringToIndex:2] intValue] - [[tempLast substringToIndex:2] intValue];
                if (dayDistance == 0) {
                    returnString = [NSString stringWithFormat:@"今天%@",[formatter stringFromDate:lastTime]];
                }else if (dayDistance == 1){
                    returnString = [NSString stringWithFormat:@"昨天%@",[formatter stringFromDate:lastTime]];
                }else{
                    [formatter setDateFormat:@"MM-dd"];
                    returnString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:lastTime]];
                }
            }
      }
    }else{
        [formatter setDateFormat:@"yyyy-MM-dd"];
        returnString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:lastTime]];
    }
    
    return returnString;
}

/**
 排序方法
 
 @param array 对象
 @param key 排序字段
 @return 排序结果 // 数据按字母排序，同时返回所有字母
 */
+ (NSDictionary *) alphabeticalWithArray:(NSArray *) array withKey:(NSString *) key{
    
    NSMutableDictionary  *resultsDic = [NSMutableDictionary dictionary];
    NSMutableArray       *allKeys = @[].mutableCopy;
    if (array.count == 0 || ![array isKindOfClass:[NSArray class]]) {
        return nil;
    }
    for (id obj in array) {
        
        NSMutableString *str = nil;
        if ([obj isKindOfClass:[NSDictionary class]] && key != nil) {
            
            str = [NSMutableString stringWithString:obj[key]];
            
        }else if ([obj isKindOfClass:[NSString class]]){
            
            str = [NSMutableString stringWithString:obj];
        }else{
            return nil;
        }
        //先转换为带声调的拼音
        CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
        //再转换为不带声调的拼音
        CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
        //转化为大写拼音
        NSString *pinYin = [str capitalizedString];
        //获取并返回首字母
        NSString *firstLetter = @"#";
        if (pinYin.length > 0) {
            
            firstLetter = [[pinYin substringToIndex:1] uppercaseString];
        }
        if (![[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[A-Za-z]+$"] evaluateWithObject:firstLetter]) {
            
            firstLetter = @"#";
        }
        NSMutableArray *values = [[NSMutableArray alloc] initWithArray:resultsDic[firstLetter]];
        [values addObject:obj];
        for (id obj in values) {
            
            if ([obj isKindOfClass:[NSDictionary class]] && key != nil) {
                
                NSSortDescriptor *des = [[NSSortDescriptor alloc]initWithKey:key ascending:YES];
                values = [values sortedArrayUsingDescriptors:@[des]].mutableCopy;
                
            }else if ([obj isKindOfClass:[NSString class]]){
                
                [values sortUsingSelector:@selector(caseInsensitiveCompare:)];
                
            }else{
                return nil;
            }
        }
        [resultsDic setObject:values forKey:firstLetter];
        
    }
    allKeys = [resultsDic allKeys].mutableCopy;
    [allKeys sortUsingSelector:@selector(caseInsensitiveCompare:)];
    [resultsDic  setObject:allKeys forKey:@"allkeys"];
    
    return resultsDic;
}

//获取当前控制器 在Header.h已定义宏
+ (UIViewController *)keyPresentingViewController {
    
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到UIWindowLevelNormal的
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    id  nextResponder = nil;
    UIViewController *appRootVC=window.rootViewController;
    //    如果是present上来的appRootVC.presentedViewController 不为nil
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        //        UINavigationController * nav = tabbar.selectedViewController ; 上下两种写法都行
        result=nav.childViewControllers.lastObject;
        
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }else{
        result = nextResponder;
    }
    return result;
}

+ (UIViewController *)viewController:(UIView *) view {
    
    if (![view isKindOfClass:[UIView class]]) {
        
        return nil;
    }
    
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

//过滤表情
+ (NSString *)filterEmoji:(NSString *)text {
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]"options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:text
                                                               options:0
                                                                 range:NSMakeRange(0, [text length])
                                                          withTemplate:@""];
    return modifiedString;
}


//是否含有表情
+ (BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}

+ (CGSize)getImageSizeWithURL:(id)URL{
    NSURL * url = nil;
    if ([URL isKindOfClass:[NSURL class]]) {
        url = URL;
    }
    if ([URL isKindOfClass:[NSString class]]) {
        url = [NSURL URLWithString:URL];
    }
    if (!URL) {
        return CGSizeZero;
    }
    CGImageSourceRef imageSourceRef =     CGImageSourceCreateWithURL((CFURLRef)url, NULL);
    CGFloat width = 0, height = 0;
    if (imageSourceRef) {
        CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSourceRef, 0, NULL);
        if (imageProperties != NULL) {
            CFNumberRef widthNumberRef = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelWidth);
            if (widthNumberRef != NULL) {
                CFNumberGetValue(widthNumberRef, kCFNumberFloat64Type, &width);
            }
            CFNumberRef heightNumberRef = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
            if (heightNumberRef != NULL) {
                CFNumberGetValue(heightNumberRef, kCFNumberFloat64Type, &height);
            }
            CFRelease(imageProperties);
        }
        CFRelease(imageSourceRef);
    }
    return CGSizeMake(width, height);
}

+ (NSString*)iphoneType {
    
    //需要导入头文件：#import <sys/utsname.h>
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString*platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if([platform isEqualToString:@"iPhone1,1"]) return @"iPhone2G";
    
    if([platform isEqualToString:@"iPhone1,2"]) return @"iPhone3G";
    
    if([platform isEqualToString:@"iPhone2,1"]) return @"iPhone3GS";
    
    if([platform isEqualToString:@"iPhone3,1"]) return @"iPhone4";
    
    if([platform isEqualToString:@"iPhone3,2"]) return @"iPhone4";
    
    if([platform isEqualToString:@"iPhone3,3"]) return @"iPhone4";
    
    if([platform isEqualToString:@"iPhone4,1"]) return @"iPhone4S";
    
    if([platform isEqualToString:@"iPhone5,1"]) return @"iPhone5";
    
    if([platform isEqualToString:@"iPhone5,2"]) return @"iPhone5";
    
    if([platform isEqualToString:@"iPhone5,3"]) return @"iPhone5c";
    
    if([platform isEqualToString:@"iPhone5,4"]) return @"iPhone5c";
    
    if([platform isEqualToString:@"iPhone6,1"]) return @"iPhone5s";
    
    if([platform isEqualToString:@"iPhone6,2"]) return @"iPhone5s";
    
    if([platform isEqualToString:@"iPhone7,1"]) return @"iPhone6Plus";
    
    if([platform isEqualToString:@"iPhone7,2"]) return @"iPhone6";
    
    if([platform isEqualToString:@"iPhone8,1"]) return @"iPhone6s";
    
    if([platform isEqualToString:@"iPhone8,2"]) return @"iPhone6sPlus";
    
    if([platform isEqualToString:@"iPhone8,4"]) return @"iPhoneSE";
    
    if([platform isEqualToString:@"iPhone9,1"]) return @"iPhone7";
    
    if([platform isEqualToString:@"iPhone9,2"]) return @"iPhone7Plus";
    
    if([platform isEqualToString:@"iPhone10,1"]) return @"iPhone8";
    
    if([platform isEqualToString:@"iPhone10,4"]) return @"iPhone8";
    
    if([platform isEqualToString:@"iPhone10,2"]) return @"iPhone8Plus";
    
    if([platform isEqualToString:@"iPhone10,5"]) return @"iPhone8Plus";
    
    if([platform isEqualToString:@"iPhone10,3"]) return @"iPhoneX";
    
    if([platform isEqualToString:@"iPhone10,6"]) return @"iPhoneX";
    
    return platform;
    
}

+ (NSString *)flattenHTML:(NSString *)html {
    
    //  过滤html标签
    NSScanner *theScanner;
    NSString *text = nil;
    theScanner = [NSScanner scannerWithString:html];
    while ([theScanner isAtEnd] == NO) {
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:
                [NSString stringWithFormat:@"%@>", text] withString:@""];
    }
    //  过滤html中的\n\r\t换行空格等特殊符号
    NSMutableString *str1 = [NSMutableString stringWithString:html];
    for (int i = 0; i < str1.length; i++) {
        unichar c = [str1 characterAtIndex:i];
        NSRange range = NSMakeRange(i, 1);
        
        //  在这里添加要过滤的特殊符号
        if ( c == '\r' || c == '\n' || c == '\t' ) {
            [str1 deleteCharactersInRange:range];
            --i;
        }
    }
    html  = [NSString stringWithString:str1];
    return html;
}

+ (NSString *)myVersion{
    //获取版本号
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:bundlePath];
    NSString *version = [dict objectForKey:@"CFBundleVersion"];
    return version;
}


//3.0
+ (NSArray *)yy_JsonToArray:(NSString *)jsonStr {
    if (jsonStr) {
        id tmp = [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments | NSJSONReadingMutableLeaves | NSJSONReadingMutableContainers error:nil];
        
        if (tmp) {
            if ([tmp isKindOfClass:[NSArray class]]) {
                
                return tmp;
                
            } else if([tmp isKindOfClass:[NSString class]]
                      || [tmp isKindOfClass:[NSDictionary class]]) {
                
                return [NSArray arrayWithObject:tmp];
                
            } else {
                return nil;
            }
        } else {
            return nil;
        }
        
    } else {
        return nil;
    }
}



+ (void)yy_dataS:(NSString *)accessType aid:(NSString *)accessId pid:(NSString *)productId {
    [self dataStatisticsWithType:accessType accessId:accessId productId:productId searchName:@""];
}

+ (void)yy_dataS:(NSString *)accessType searchName:(NSString *)searchName {
    [self dataStatisticsWithType:accessType accessId:@"" productId:@"" searchName:searchName];
}

+ (void)dataStatisticsWithType:(NSString *)accessType accessId:(NSString *)accessId productId:(NSString *)productId searchName:(NSString *)searchName{
    NSMutableDictionary *paramsDic = [[NSMutableDictionary alloc] init];
    NSString *Location = MyFormatting([[NSUserDefaults standardUserDefaults] valueForKey:@"formattedAddress"]);
    if (Location.length > 0) {
        [paramsDic setValue:Location forKey:@"Location"];
    }
    else {
        [paramsDic setValue:@"未知地址" forKey:@"Location"];
    }
    [paramsDic setValue:@"1"       forKey:@"portType"]; //终端
    [paramsDic setValue:accessType forKey:@"accessType"];//访问类型
    [paramsDic setValue:accessId   forKey:@"accessId"];   //访问类型为“圈子”、“直播”必填：圈子id、直播id
    [paramsDic setValue:productId  forKey:@"productId"];  //访问类型为“每日推选”必填；
    [paramsDic setValue:searchName  forKey:@"searchName"];  //搜索关键字
    if (!YTUserId) {
        [paramsDic setValue:[NSString stringWithFormat:@"Y%@",[[NSUUID UUID] UUIDString]]  forKey:@"deviceId"];//游客必填（Y+手机唯一识别码）用于游客身份识别
    }
    [[YTSharednetManager sharedNetManager] postNetInfoWithUrl:@"dataCount/saveDataCount" andType:All andWith:paramsDic andReturn:^(NSDictionary *dicResult) {
        
    }];
}
@end
