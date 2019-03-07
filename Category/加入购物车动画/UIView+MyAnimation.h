//
//  UIView+MyAnimation.h
//  YJinJin
//
//  Created by 桃子leas on 2017/8/15.
//  Copyright © 2017年 YiTian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^animationFinisnBlock)();
@interface UIView (MyAnimation)<CAAnimationDelegate>

@property (copy, nonatomic) animationFinisnBlock animationFinisnBlock;
@property (strong, nonatomic)  CALayer *myLayer;
@property (strong, nonatomic)  NSMutableArray *layerArray;
- (void) startAnimationWithParabola:(CGPoint)finishPoint finish:(animationFinisnBlock)finish;

@end
