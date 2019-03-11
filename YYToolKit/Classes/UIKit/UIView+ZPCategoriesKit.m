//
//  UIView+ZPCategoriesKit.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import "UIView+ZPCategoriesKit.h"
 
@implementation UIView (ZPCategoriesKit)

- (NSArray *)zp_descentViews{
    NSMutableArray *subviews = [[self subviews] mutableCopy];
    for (UIView *subview in [self subviews])
        [subviews addObjectsFromArray:[subview zp_descentViews]]; //recursive
    return subviews;
}



+ (instancetype)zp_instanceFromXib {
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil];
    UIView *result = [nib objectAtIndex:0];
    return result;
}


- (UIViewController *)zp_viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}


- (void)removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

- (void)dd{

    CGSize size =  self.frame.size;
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    CGFloat radius = size.height/2;
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(ctx,path.CGPath);
    CGContextClip(ctx);
    CGContextDrawPath(ctx, kCGPathFillStroke);
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newImage;
}

@end
