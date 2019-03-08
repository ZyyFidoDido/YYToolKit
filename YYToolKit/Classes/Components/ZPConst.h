
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 *  ----------宏------------
 */

// 使用 UIColorFromRGB(0xcccccc)
#define ZP_UIColorFromRGB(rgbValue) \
[UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:1]


#define ZP_UIColorFromRGBA(rgbValue, alphaValue) \
[UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]


#define ZP_WEAKSELF __weak typeof(self) weakSelf = self;

#define ZP_Width  [[UIScreen mainScreen] bounds].size.width
#define ZP_Height [[UIScreen mainScreen] bounds].size.height
#define ZP_Bounds [[UIScreen mainScreen] bounds]
#define ZP_Size   [[UIScreen mainScreen] bounds].size

#define zp_Iphone4 ([UIScreen mainScreen].bounds.size.height==480.0f)
#define zp_Iphone5 ([UIScreen mainScreen].bounds.size.height==568.0f)
#define zp_Iphone6_4_7 ([UIScreen mainScreen].bounds.size.height==667.0f)
#define zp_Iphone6Plus_5_5 ([UIScreen mainScreen].bounds.size.height==736.0f)
