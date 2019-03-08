//
//  UIColor+YyCategory.h
//  YTSellingCC
//
//  Created by Yitian on 2018/12/12.
//  Copyright © 2018 YiTian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (YyCategory)


+ (UIColor *) yy_colorWithHexString: (NSString *) stringToConvert;


+ (UIColor *)yycolorWithHexString:(NSString *) stringToConvert;
@end

NS_ASSUME_NONNULL_END
