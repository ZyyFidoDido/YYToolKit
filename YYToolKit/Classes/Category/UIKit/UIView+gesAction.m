//
//  UIView+gesAction.m
//  YJinJin
//
//  Created by 桃子leas on 17/3/13.
//  Copyright © 2017年 YiTian. All rights reserved.
//

#import "UIView+gesAction.h"
#import <objc/runtime.h>

static char TActionHandlerTapBlockKey;
static char TActionHandlerTapGestureKey;
static char TActionHandlerLongPressBlockKey;
static char TActionHandlerLongPressGestureKey;

@implementation UIView (gesAction)

- (void)setTapActionWithBlock:(void (^)(void))block
{
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &TActionHandlerTapGestureKey);
    
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &TActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &TActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)__handleActionForTapGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        void(^action)(void) = objc_getAssociatedObject(self, &TActionHandlerTapBlockKey);
        
        if (action)
        {
            action();
        }
    }
}

- (void)setLongPressActionWithBlock:(void (^)(void))block
{
    self.userInteractionEnabled = YES;
    
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &TActionHandlerLongPressGestureKey);
    
    if (!gesture)
    {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &TActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    
    objc_setAssociatedObject(self, &TActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)__handleActionForLongPressGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        void(^action)(void) = objc_getAssociatedObject(self, &TActionHandlerLongPressBlockKey);
        
        if (action)
        {
            action();
        }
    }
}

@end
