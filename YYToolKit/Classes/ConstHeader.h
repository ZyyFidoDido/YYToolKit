//
//  ConstHeader.h
//  Pods
//
//  Created by Yitian on 2019/3/7.
//

#ifndef ConstHeader_h
#define ConstHeader_h

//重写NSLog,Debug模式下打印日志和当前行数
#ifdef DEBUG
#define XBDebugLog(s, ... ) NSLog(@"<%@:(%d)> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define XBDebugLog(s, ... )
#endif



#define _weakSelf(...) \
rac_keywordify \
metamacro_foreach_cxt(rac_weakify_,, __weak, __VA_ARGS__)

#define _strongSelf(...) \
rac_keywordify \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
metamacro_foreach(rac_strongify_,, __VA_ARGS__) \
_Pragma("clang diagnostic pop")


#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


//警示框
#define Alert(_A,_B,_del,_C,_D) [[[UIAlertView alloc]initWithTitle:_A message:_B delegate:_del cancelButtonTitle:_C otherButtonTitles:_D, nil] show]

#define Alert_Dismiss(_A,_B) UIAlertView *alert = [[UIAlertView alloc] initWithTitle:_A message:_B delegate:nil cancelButtonTitle:nil otherButtonTitles:nil,nil];[alert show];[alert dismissWithClickedButtonIndex:0 animated:YES]

#define Alert_AfterDismiss(_A,_B) UIAlertView *alert = [[UIAlertView alloc] initWithTitle:_A message:_B delegate:nil cancelButtonTitle:nil otherButtonTitles:nil,nil];[alert show];[self performSelector:@selector(dimissAlert:) withObject:alert afterDelay:2.0]


//屏幕宽度
#define Sc_Width    [[UIScreen mainScreen] bounds].size.width
//屏幕高度
#define Sc_Height   [[UIScreen mainScreen] bounds].size.height


#define SYS_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SYS_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SYS_BOUNDS CGRectMake(0, 0, SYS_WIDTH, SYS_HEIGHT)
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
// 16进制颜色  XXX.backgroundColor = mHexColor(0xc0c0c0, .5);
#define mHexColor(hex, alphaValue) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:alphaValue]


//缩放比例
#define W_SCALE ([[UIScreen mainScreen] bounds].size.width / 375)
#define H_SCALE ([[UIScreen mainScreen] bounds].size.height / 667)
#define YY_SCALE(_a)   (([[UIScreen mainScreen] bounds].size.width / 375) * _a)
#define ZHb_SCALE(_a)  (([[UIScreen mainScreen] bounds].size.width / 375) * _a)
#define height_SCALE(x) (x * ([[UIScreen mainScreen] bounds].size.height / 667))

#define SCALE(_a)    (_a * _scale)
#define SCALE_Size(_w,_h) CGSizeMake(_w * _scale, _h * _scale)


//获取本地图片
//#define GET_IMAGE(NAME) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:NAME]]
#define IMAGE_WITH_NAME(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:[NSString stringWithFormat:@"%@.png",name]]]
#define IMAGE_WITH_NAMEJPG(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:[NSString stringWithFormat:@"%@.jpg",name]]]


//脱敏号码
#define YY_Secret_Phone(phoneNum) [NSString stringWithFormat:@"%@****%@",[phoneNum substringToIndex:3],[phoneNum substringFromIndex:7]]
#define YY_Secret_idCard(idCard) [NSString stringWithFormat:@"%@****************%@",[idCard substringToIndex:1],[idCard substringFromIndex:17]]


//设置本地缓存
#define YY_Set_UserDefaults(_ob,_key)   [[NSUserDefaults standardUserDefaults] setObject:_ob forKey:_key];[[NSUserDefaults standardUserDefaults] synchronize]
//取值本地缓存
#define YY_Get_UserDefaults(_key)       [[NSUserDefaults standardUserDefaults] objectForKey:_key]


//toast
#define PostAlert(aMessage) [[TKAlertCenter defaultCenter] postAlertWithMessage:aMessage]

//格式化 str
#define YY_String(value)    [NSString yy_isValueNSString:value]


//颜色
#define RGB(_R,_G,_B,_A) [UIColor colorWithRed:_R/255.0f green:_G/255.0f blue:_B/255.0f alpha:_A]
#define Orange      [UIColor orangeColor]
#define White       [UIColor whiteColor]
#define Black       [UIColor blackColor]
#define Blue        [UIColor blueColor]
#define Magenta     [UIColor magentaColor]
#define Yellow      [UIColor yellowColor]
#define Clean       [UIColor clearColor]

#define yy_randomColor  [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

//五粮液颜色
#define Tabbar_selected [UIColor yy_colorWithHexString:@"#dc000d"]
#define Tabbar_normal [UIColor yy_colorWithHexString:@"#929292"]

// 摩滴颜色
#define M_Yellow    [UIColor yy_colorWithHexString:@"#fdcd4a"]   //按钮背景黄
#define M_LogoutYellow [UIColor yy_colorWithHexString:@"#a4734f"]   //退出黄

#define M_White     [UIColor yy_colorWithHexString:@"#ffffff"]  //白色
#define M_Black     [UIColor yy_colorWithHexString:@"#333333"]  //黑色
#define M_DarkBlack [UIColor yy_colorWithHexString:@"#666666"]  //深黑 副标题
#define M_LightBlack [UIColor yy_colorWithHexString:@"#999999"] //浅黑 提示性语句
#define M_BtnBlack  [UIColor yy_colorWithHexString:@"#151515"]  //黑色按钮

#define M_LightGray [UIColor yy_colorWithHexString:@"#e5e5e5"]  //浅灰 分割横线浅色
#define M_DarkGray  [UIColor yy_colorWithHexString:@"#9d9d9d"]  //深灰 输入下方的线条深色
#define M_NavLineGray  [UIColor yy_colorWithHexString:@"#dfdfdf"]  //导航下方的线条色
#define M_VLineGray  [UIColor yy_colorWithHexString:@"#6c6367"]   //锤子分割线 灰
#define M_BGray     [UIColor yy_colorWithHexString:@"#f5f5f5"]    //灰色背景

#define M_Greed     [UIColor yy_colorWithHexString:@"#25b025"]    //绿点
#define M_Red       [UIColor yy_colorWithHexString:@"#fc5a69"]    //红点




#define U_BGray     [UIColor yy_colorWithHexString:@"EEEEEE"]   //背景灰
#define U_LightGray [UIColor yy_colorWithHexString:@"dddddd"]   //浅灰  描边
#define U_LGrayChar [UIColor yy_colorWithHexString:@"aaaaaa"]   //浅灰  文字
#define U_DarkGray  [UIColor yy_colorWithHexString:@"888888"]   //深灰  文字
#define U_Blue      [UIColor yy_colorWithHexString:@"00bbff"]   //蓝色
#define U_Black     [UIColor yy_colorWithHexString:@"444444"]   //黑色
#define U_Red       [UIColor yy_colorWithHexString:@"ee4433"]   //红色
#define U_LRed      [UIColor yy_colorWithHexString:@"ff4433"]   //浅红 货色小圆点
#define U_PRed      [UIColor yy_colorWithHexString:@"f78683"]   //宠物中心 按钮红
#define U_Yellow    [UIColor yy_colorWithHexString:@"ffbb00"]   //黄色
#define U_TYellow   [UIColor yy_colorWithHexString:@"e0cc77"]   //土黄 社交 打赏文字
#define U_LightY    [UIColor yy_colorWithHexString:@"fffad9"]   //黄色 流量钱包详情页
#define U_Green     [UIColor yy_colorWithHexString:@"00eeaa"]   //绿色
#define U_Orange    [UIColor yy_colorWithHexString:@"ff8200"]   //橘色
#define U_NavGray   [UIColor yy_colorWithHexString:@"f1f1f1"]   //导航栏灰
#define U_SignLab   [UIColor yy_colorWithHexString:@"8F7402"]   //签到上字体
#define U_ClanYellow    [UIColor yy_colorWithHexString:@"ffee99"]   //部落黄色
#define U_ClanBlack     [UIColor yy_colorWithHexString:@"222222"]   //部落黑色

#define U_LightBlue [UIColor yy_colorWithHexString:@"7cdcff"]   //浅蓝色
#define U_LightRed  [UIColor yy_colorWithHexString:@"fb9a91"]   //浅红色


//云店
#define U_SysKBColor    [UIColor yy_colorWithHexString:@"D1D6DB"] //系统键盘底色
#define U_YDBlack       [UIColor yy_colorWithHexString:@"292929"]   //标题黑
#define U_YDRed         [UIColor yy_colorWithHexString:@"E62129"]   //文字红
#define U_YDYellow      [UIColor yy_colorWithHexString:@"FF9601"] //文字黄色
#define U_YDOrange      [UIColor yy_colorWithHexString:@"FE5D32"] //文字橘色
#define U_YDBorderLine  [UIColor yy_colorWithHexString:@"999999"]   //描边灰
#define U_YDBGrat       [UIColor yy_colorWithHexString:@"F2F2F2"] //云店背景灰
#define U_YDBlue        [UIColor yy_colorWithHexString:@"2A89FF"] //云店蓝

//圈子
#define U_QZGreen        [UIColor yy_colorWithHexString:@"00D162"] //圈子绿
#define U_QZRed          [UIColor yy_colorWithHexString:@"E6231B"] //圈子红
#define U_QZOrenge       [UIColor yy_colorWithHexString:@"FF7200"] //圈子橘

//分销
#define U_FXMainBlack      [UIColor yy_colorWithHexString:@"292929"] //29黑
#define U_FXMidBlack       [UIColor yy_colorWithHexString:@"333333"] //33黑
#define U_FXSubBlack       [UIColor yy_colorWithHexString:@"888888"] //88黑
#define U_FXBGray          [UIColor yy_colorWithHexString:@"F2F2F2"] //f2灰
#define U_FXLineGray       [UIColor yy_colorWithHexString:@"EEEEEE"] //EE灰 边线
#define U_FXMainColor      [UIColor yy_colorWithHexString:@"6CBA3F"] //绿
#define U_FXSubColor       [UIColor yy_colorWithHexString:@"FF6C20"] //橘
#define U_FXCancelBtn       [UIColor yy_colorWithHexString:@"292929"] //取消按钮 29黑

#endif /* ConstHeader_h */
