//
//  UIButton+Submitting.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/30.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Submitting)


/**
*  按钮点击后，禁用按钮并在按钮上显示ActivityIndicator，以及title
*
*  @param title 按钮上显示的文字
*/
- (void)zp_beginSubmitting:(NSString *)title;


/**
 *  按钮点击后，恢复按钮点击前的状态
 */
- (void)zp_endSubmitting;

/**
 *  按钮是否正在提交中
 */
@property(nonatomic, readonly, getter=isSubmitting) NSNumber *submitting;



@end
