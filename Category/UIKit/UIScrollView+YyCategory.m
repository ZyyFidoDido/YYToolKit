//
//  UIScrollView+YyCategory.m
//  YTSellingCC
//
//  Created by Yitian on 2018/12/26.
//  Copyright © 2018 YiTian. All rights reserved.
//

#import "UIScrollView+YyCategory.h"

@implementation UIScrollView (YyCategory)


/**
 滚到底部
 */
- (void)yy_rollToBottom {
    CGPoint bottomOffset = CGPointMake(0, self.contentSize.height - self.bounds.size.height);
    [self setContentOffset:bottomOffset animated:YES];
}


/**
 滚到顶部
 */
- (void)yy_rollToTop {
    [self setContentOffset:CGPointMake(0, 0) animated:YES];
    self.bouncesZoom = NO;
}

/**
 滚动到中间
 */
- (void)yy_rollToMid {
    CGFloat pianyi = self.contentSize.height - self.bounds.size.height;
    CGPoint bottomOffset;
    if (pianyi > 0) {
        bottomOffset = CGPointMake(0, pianyi / 2);
    }
    [self setContentOffset:bottomOffset animated:YES];
}


//处理UIScrollView上的手势和侧滑返回手势的冲突
//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
//    // 首先判断otherGestureRecognizer是不是系统pop手势
//    if ([otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"UILayoutContainerView")]) {
//        // 再判断系统手势的state是began还是fail，同时判断scrollView的位置是不是正好在最左边
//        if (otherGestureRecognizer.state == UIGestureRecognizerStateBegan && self.contentOffset.x == 0) {
//            return YES;
//        }
//    }
//    return NO;
//}

////左边侧滑：
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
//{
//    CGPoint velocity = [(UIPanGestureRecognizer *)gestureRecognizer velocityInView:self];
//    CGPoint location = [gestureRecognizer locationInView:self];
//
//    NSLog(@"velocity.x:%f----location.x:%d",velocity.x,(int)location.x%(int)[UIScreen mainScreen].bounds.size.width);
//    if (velocity.x > 0.0f&&(int)location.x%(int)[UIScreen mainScreen].bounds.size.width<60) {
//        return NO;
//    }
//    return YES;
//}


//处理UIScrollView上的手势和侧滑返回手势的冲突
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
    // 首先判断otherGestureRecognizer是不是系统pop手势
    if ([otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"UILayoutContainerView")]) {
        // 再判断系统手势的state是began还是fail，同时判断scrollView的位置是不是正好在最左边
        if (otherGestureRecognizer.state == UIGestureRecognizerStateBegan && self.contentOffset.x == 0) {
            return YES;
        }
    }
    return NO;
}

@end
