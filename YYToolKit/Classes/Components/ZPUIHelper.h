//
//  ZPUIHelper.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/30.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static const CGFloat hud_toast_time_interval = 1.0;

@interface ZPUIHelper : NSObject



+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
                   buttons:(NSArray *)buttons
                completion:(void (^)(NSInteger buttonIndex))block;

+ (void)showLoading;

+ (void)showLoading:(NSString *)loading;

+ (void)showStatus:(NSString *)status;

+ (void)dismiss;


@end
