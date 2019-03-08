//
//  YYUIHelper.h
//  YTSellingCC
//
//  Created by Yitian on 2018/12/12.
//  Copyright © 2018 YiTian. All rights reserved.
//

#import <Foundation/Foundation.h>

static const CGFloat hud_toast_time_interval = 1.0;

NS_ASSUME_NONNULL_BEGIN

@interface YYUIHelper : NSObject

+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
                   buttons:(NSArray *)buttons
                completion:(void (^)(NSInteger buttonIndex))block;

+ (void)showLoading;

+ (void)showLoading:(NSString *)loading;

+ (void)showStatus:(NSString *)status;

+ (void)dismiss;




@end

NS_ASSUME_NONNULL_END
