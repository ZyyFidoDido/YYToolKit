//
//  CAAnimation+MyProperty.m
//  YJinJin
//
//  Created by 桃子leas on 2017/8/15.
//  Copyright © 2017年 YiTian. All rights reserved.
//

#import "CAAnimation+MyProperty.h"
#import <objc/runtime.h>

static const void *animationLayerKey = &animationLayerKey;
@implementation CAAnimation (MyProperty)

- (void) setAnimationLayer:(CALayer *)animationLayer{
    
    objc_setAssociatedObject(self, animationLayerKey, animationLayer, OBJC_ASSOCIATION_RETAIN);
}

- (CALayer *) animationLayer{
    
    return objc_getAssociatedObject(self, animationLayerKey);

}

@end
