//
//  UIView+YyCategory.h
//  MoDiDriver
//
//  Created by 灏澜科技 on 2017/9/21.
//  Copyright © 2017年 fidoyy. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 边框方向
 
 - ZYYBBorderDirectionTop: 顶部
 - ZYYBBorderDirectionLeft: 左边
 - ZYYBBorderDirectionBottom: 底部
 - ZYYBBorderDirectionRight: 右边
 */
typedef NS_ENUM(NSInteger, ZYYBBorderDirectionType) {
    ZYYBBorderDirectionTop = 0,
    ZYYBBorderDirectionLeft,
    ZYYBBorderDirectionBottom,
    ZYYBBorderDirectionRight
};

@interface UIView (YyCategory)
@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat bottom;
@property (assign, nonatomic) CGFloat right;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGPoint origin;

@property(nonatomic,assign)CGFloat centerX;
@property(nonatomic,assign)CGFloat centerY;

-(void)removeAllSubViews;


/**
 *  Load Xib file
 *
 *  @return
 */
+ (instancetype)yy_instanceFromXib;


/**
 检测view 的所在VC

 @return 返回view的父类VC
 */
- (UIViewController *)yy_viewController;

- (void)ViewWithBorderWidth:(CGFloat)width color:(UIColor *)color cordi:(CGFloat)cordi;


/**
 为UIView的某个方向添加边框
 
 @param direction 边框方向
 @param color 边框颜色
 @param width 边框宽度
 */
- (void)yy_addBorder:(ZYYBBorderDirectionType)direction color:(UIColor *)color width:(CGFloat)width;


/**
 打电话

 @param phone 电话
 */
+ (void)yy_makeCall:(NSString *)phone;

/**
  分销系统的主颜色(绿色)渐变
 */
- (void)yy_GradientLayerForMainColor;

/**
 分销系统的附颜色(橘色)渐变
 */
- (void)yy_GradientLayerForSubColor;



/**
 view的渐变色

 @param _fColor 从这个颜色开始
 @param _tColor 这个颜色结束
 @param startPoint 起点 (0, 0) -> (1, 0)横向     (0, 0) -> (0, 1) 纵向
 @param endPoint 终点
 */
- (void)yy_GradientLayerForCusFromColor:(UIColor *)_fColor
                                toColor:(UIColor *)_tColor
                                 sPoint:(CGPoint)startPoint
                                 ePoint:(CGPoint)endPoint;
@end
