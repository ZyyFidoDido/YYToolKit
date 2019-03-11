//
//  UITabBar+LittleRedDotBadge.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import "UITabBar+LittleRedDotBadge.h"
#define zp_little_red_dot_tag 10086


@implementation UITabBar (LittleRedDotBadge)



- (void)zp_showLittleRedDotOnItemIndex:(NSInteger)index{


    //移除之前的小红点
    [self removeLittleRedDotOnItemIndex:index];

    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = zp_little_red_dot_tag + index;
    badgeView.backgroundColor = [UIColor redColor];
    CGRect tabFrame = self.frame;

    //确定小红点的位置
    float percentX = (index +0.6) / [self.items count];
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);


    badgeView.frame = CGRectMake(x, y, 8, 8);
    badgeView.layer.cornerRadius = badgeView.frame.size.width/2;
    [self addSubview:badgeView];

}

- (void)zp_hideLittleRedDotOnItemIndex:(NSInteger)index{

    //移除小红点
    [self removeLittleRedDotOnItemIndex:index];

}

- (void)removeLittleRedDotOnItemIndex:(NSInteger)index{
    //按照tag值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == zp_little_red_dot_tag+index) {
            [subView removeFromSuperview];
        }
    }
}

@end
