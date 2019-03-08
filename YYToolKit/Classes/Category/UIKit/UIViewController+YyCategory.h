//
//  UIViewController+YyCategory.h
//  YTSellingCC
//
//  Created by Yitian on 2018/12/12.
//  Copyright © 2018 YiTian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (YyCategory)

/**
 *  取消延展性直接全屏显示  当没有navigationbar时这个可以解决view没有被状态栏盖住的原因
 */
- (void)yy_setupEdges;


/**
 *  Loading file from StoryBoard
 *
 *  @return
 */
+ (UIViewController *)yy_instanceFromStoryBoard;


- (UIBarButtonItem *)yy_barButtonItemTitle:(NSString *)titleName handler:(void (^)(id sender))action;


- (UIBarButtonItem *)yy_barButtonItemImage:(UIImage *)image handler:(void (^)(id sender))action;


- (UIBarButtonItem *)yy_barButtonItemSystemItem:(UIBarButtonSystemItem)systemItem handler:(void (^)(id sender))action;


#pragma mark - 设置tabbar Btn
@property (copy, nonatomic)    NSString  *barRightButtonImageName;
@property (copy, nonatomic)    NSString  *barRightButtonName;
@property (strong, nonatomic)  UIColor   *barRightButtonTinkColor;
//@property (copy, nonatomic)    NSString  *barRightButtonHaveTinkColor;

@property (copy, nonatomic)    NSString  *barLeftButtonImageName;
@property (copy, nonatomic)    NSString  *barLeftButtonName;
@property (strong, nonatomic)  UIColor   *barLeftButtonTinkColor;
//@property (copy, nonatomic)    NSString  *barLeftButtonHaveTinkColor;


- (void)processNavViewLeftBtn;
- (void)processNavViewRightBtn;


@end

NS_ASSUME_NONNULL_END
