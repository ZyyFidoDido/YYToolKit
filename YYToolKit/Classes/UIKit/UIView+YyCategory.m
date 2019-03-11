//
//  UIView+YyCategory.m
//  MoDiDriver
//
//  Created by 灏澜科技 on 2017/9/21.
//  Copyright © 2017年 fidoyy. All rights reserved.
//

#import "UIView+YyCategory.h"
#import "UIColor+YyCategory.h"

@implementation UIView (YyCategory)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}
- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}
-(void)setRight:(CGFloat)right{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}



-(void)setCenterX:(CGFloat)centerX{
    
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(CGFloat)centerX{
    
    return self.center.x;
}

-(void)setCenterY:(CGFloat)centerY{
    
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

-(CGFloat)centerY{
    
    return self.center.y;
}


-(void)removeAllSubViews{
    for (UIView *view in [self subviews]) {
        [view removeFromSuperview];
    }
}

- (void)detectScrollsToTopViews {
    for (UIView* view in self.subviews) {
        if ([view isKindOfClass:UIScrollView.class]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            if (scrollView.scrollsToTop) {
                
            }
        }
        
        [view detectScrollsToTopViews];
    }
}


+ (instancetype)yy_instanceFromXib {
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil];
    UIView *result = [nib objectAtIndex:0];
    return result;
}


- (UIViewController *)yy_viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}


- (void)ViewWithBorderWidth:(CGFloat)width color:(UIColor *)color cordi:(CGFloat)cordi {
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
    self.layer.cornerRadius = cordi;
    self.clipsToBounds = YES;
}



- (void)yy_addBorder:(ZYYBBorderDirectionType)direction color:(UIColor *)color width:(CGFloat)width
{
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    switch (direction) {
        case ZYYBBorderDirectionTop:
        {
            border.frame = CGRectMake(0.0f, 0.0f, self.bounds.size.width, width);
        }
            break;
        case ZYYBBorderDirectionLeft:
        {
            border.frame = CGRectMake(0.0f, 0.0f, width, self.bounds.size.height);
        }
            break;
        case ZYYBBorderDirectionBottom:
        {
            border.frame = CGRectMake(0.0f, self.bounds.size.height - width, self.bounds.size.width, width);
        }
            break;
        case ZYYBBorderDirectionRight:
        {
            border.frame = CGRectMake(self.bounds.size.width - width, 0, width, self.bounds.size.height);
        }
            break;
        default:
            break;
    }
    [self.layer addSublayer:border];
}


/**
 打电话
 
 @param phone 电话
 */
+ (void)yy_makeCall:(NSString *)phone {
    
    if (phone.length > 0) {
        NSString *callPhone = [NSString stringWithFormat:@"telprompt://%@", phone];
        // 解决iOS10及其以上系统弹出拨号框延迟的问题
        // 方案一
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
            /// 10及其以上系统
            if (@available(iOS 10.0, *)) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone] options:@{} completionHandler:nil];
            } else {
                
            }
        } else {
            /// 10以下系统
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone]];
        }
    }
   
}




/**
 分销系统的主颜色(绿色)渐变
 */
- (void)yy_GradientLayerForMainColor{
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor yy_colorWithHexString:@"6CBA3F"].CGColor, (__bridge id)[UIColor yy_colorWithHexString:@"7DD73B"].CGColor];
    gradientLayer.locations = @[@0.0,@1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = self.bounds;
    [self.layer insertSublayer:gradientLayer atIndex:0];
    
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.colors = @[(__bridge id)RGBACOLOR(255, 90, 39, 1).CGColor, (__bridge id)RGBACOLOR(230, 35, 27, 1).CGColor];
//    gradientLayer.locations = @[@0.0,@1.0];
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(1.0, 0);
//    gradientLayer.frame = CGRectMake(0, 0, SYS_WIDTH, 100);
//    [self.layer insertSublayer:gradientLayer atIndex:0];
}

/**
 分销系统的附颜色(橘色)渐变
 */
- (void)yy_GradientLayerForSubColor {

    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor yy_colorWithHexString:@"FF6C20"].CGColor, (__bridge id)[UIColor yy_colorWithHexString:@"FBAC30"].CGColor];//FE8140
    gradientLayer.locations = @[@0.0,@1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = self.bounds;
    [self.layer insertSublayer:gradientLayer atIndex:0];
    
    
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.colors = @[(__bridge id)RGBACOLOR(255, 90, 39, 1).CGColor, (__bridge id)RGBACOLOR(230, 35, 27, 1).CGColor];
//    gradientLayer.locations = @[@0.0,@1.0];
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(1.0, 0);
//    gradientLayer.frame = CGRectMake(0, 0, SYS_WIDTH, 100);
//    [self.layer insertSublayer:gradientLayer atIndex:0];
}


- (void)yy_GradientLayerForCusFromColor:(UIColor *)_fColor toColor:(UIColor *)_tColor sPoint:(CGPoint)startPoint ePoint:(CGPoint)endPoint{

    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)_fColor.CGColor, (__bridge id)_tColor.CGColor];
    gradientLayer.locations = @[@0.0,@1.0];
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    gradientLayer.frame = self.bounds;
    [self.layer insertSublayer:gradientLayer atIndex:0];
}


@end
