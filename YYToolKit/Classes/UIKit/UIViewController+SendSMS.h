//
//  UIViewController+SendSMS.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/3/23.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface UIViewController (SendSMS)


/**
 *  调用系统的短信
 *
 *  @param text    text description
 *  @param peoples peoples description
 *  @param comple  comple description
 */
- (void)SendSMSWithText:(NSString *)text peoples:(NSArray *)peoples complete:(void(^)(MFMessageComposeViewController *vc, MessageComposeResult result))complete;

@end
