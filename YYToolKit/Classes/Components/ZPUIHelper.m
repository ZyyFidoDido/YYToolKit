//
//  ZPUIHelper.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/30.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import "ZPUIHelper.h"
#import "BlocksKit+UIKit.h"
#import "MBProgressHUD.h"


@interface ZPUIHelper ()

@end

@implementation ZPUIHelper




+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
                   buttons:(NSArray *)buttons
                completion:(void (^)(NSInteger buttonIndex))block{
    UIAlertView *alert = [UIAlertView bk_showAlertViewWithTitle:title message:message cancelButtonTitle:nil otherButtonTitles: buttons handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
        block(buttonIndex);
    }];
    [alert show];
}



+ (void)showStatus:(NSString *)status{
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    HUD.mode = MBProgressHUDModeText;
    HUD.detailsLabelText = [status copy];
    [HUD hide:YES afterDelay:hud_toast_time_interval];
}


+ (void)showLoading{
    [self showLoading:nil];
}


+ (void)showLoading:(NSString *)loading{
    if (loading ==nil) {
        loading = @"数据加载中...";
    }
    MBProgressHUD *hud = nil;
    UIView *view = [self currentViewWithViewController:nil];
    hud = [MBProgressHUD HUDForView:view];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    view.userInteractionEnabled = NO;
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.labelText = loading;

}


+ (void)dismiss{
    UIView *view = [self currentViewWithViewController:nil];
    view.userInteractionEnabled = YES;
    [MBProgressHUD hideHUDForView:view animated:YES];
}



+ (UIView *)currentViewWithViewController:(UIViewController *)viewController{

    UIViewController *vc = nil;

    if (viewController == nil) {
        vc = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    }else{
        vc = viewController;
    }


    if ([vc isKindOfClass:[UITabBarController class]]) {

        UITabBarController *tab = (UITabBarController *)vc;
        return  [ZPUIHelper currentViewWithViewController:tab.selectedViewController];

    }else if ([vc isKindOfClass:[UINavigationController class]]){

        UINavigationController *nav = (UINavigationController *)vc;
        return nav.topViewController.view;

    }else{

          return  vc.view;
    }

}


@end
