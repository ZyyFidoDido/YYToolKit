//
//  UIViewController+SendSMS.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/3/23.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import "UIViewController+SendSMS.h"
#import "BlocksKit+MessageUI.h"

@interface UIViewController ()

@end

@implementation UIViewController (SendSMS)


- (void)SendSMSWithText:(NSString *)text peoples:(NSArray *)peoples complete:(void(^)(MFMessageComposeViewController *vc, MessageComposeResult result))complete{
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.body = text;
    messageController.recipients = peoples;
    [messageController bk_setCompletionBlock:^(MFMessageComposeViewController *vc, MessageComposeResult result) {
        complete(vc,result);
    }];
    [self presentViewController:messageController animated:YES completion:nil];
}

@end
