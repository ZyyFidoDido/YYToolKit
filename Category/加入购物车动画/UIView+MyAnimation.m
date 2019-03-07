//
//  UIView+MyAnimation.m
//  YJinJin
//
//  Created by 桃子leas on 2017/8/15.
//  Copyright © 2017年 YiTian. All rights reserved.
//

#import "UIView+MyAnimation.h"
#import "AppDelegate.h"
#import <objc/runtime.h>
#import "CAAnimation+MyProperty.h"

static const void *animationFinisnBlockKey = &animationFinisnBlockKey;
static const void *myLayerKey = &myLayerKey;
static const void *layerArrayKey = &layerArrayKey;
@implementation UIView (MyAnimation)

- (void)startAnimationWithParabola:(CGPoint)finishPoint finish:(animationFinisnBlock)finish{
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    CGRect rect = self.frame;
    rect = [self convertRect:rect toView:window];//获取绝对坐标
    // 改变做动画图片的大小
    rect.size.width = 45;
    rect.size.height = 45;   //重置图层尺寸
    
    if (!self.layerArray) {
        self.layerArray = [[NSMutableArray alloc] init];
    }
    //图层
    UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
    tempImageView.image = [self snapshotSingleView:self];
    
    self.myLayer = tempImageView.layer;
    [self.layerArray addObject:self.myLayer];
    self.myLayer.contentsGravity = kCAGravityResizeAspect;
    self.myLayer.bounds = rect;
//    myLayer.cornerRadius = rect.size.width/2;
//    myLayer.masksToBounds = YES;
    [window.layer addSublayer:self.myLayer];

    self.myLayer.position = CGPointMake(rect.origin.x+self.frame.size.width/2, CGRectGetMidY(rect)); //a 点
    // 路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:self.myLayer.position];
    
    //确定抛物线的最高点位置  controlPoint
   // [path addQuadCurveToPoint:finishPoint controlPoint:CGPointMake(100/2 , rect.origin.y-80)];
     [path addLineToPoint:finishPoint];
    //关键帧动画
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.path = path.CGPath;
    
    //往下抛时旋转小动画
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnimation.removedOnCompletion = YES;
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:12];
    rotateAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.removedOnCompletion = YES;
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1];
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.5];
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[pathAnimation,rotateAnimation,scaleAnimation];
    groups.duration = 1.2;
    
    //设置之后做动画的layer不会回到一开始的位置
    groups.removedOnCompletion=NO;
    groups.fillMode=kCAFillModeForwards;
    
    //让工具类成为组动画的代理
    groups.delegate = self;
    [self.myLayer addAnimation:groups forKey:@"group"];
    if (finish) {
        self.animationFinisnBlock = finish;
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //MyAnimationGroup *groupAnim = (MyAnimationGroup *)anim;
    //    [anim def];
    //if (anim == [anim.animationLayer animationForKey:@"group"]) {
        //[groupAnim.animalView removeFromSuperview];
        //groupAnim.animalView = nil;

        if (self.animationFinisnBlock) {
            self.animationFinisnBlock();
        }

    CALayer *layer = self.layerArray.firstObject;
    if (layer) {
        [layer removeFromSuperlayer];
        [self.layerArray removeObjectAtIndex:0];
    }
    //}
}

#pragma mark -- property

- (void)setAnimationFinisnBlock:(animationFinisnBlock)animationFinisnBlock{
    
    objc_setAssociatedObject(self, animationFinisnBlockKey, animationFinisnBlock, OBJC_ASSOCIATION_RETAIN);
}

- (animationFinisnBlock) animationFinisnBlock{
    
    return objc_getAssociatedObject(self, animationFinisnBlockKey);
}

- (void) setMyLayer:(CALayer *)myLayer{
    
    objc_setAssociatedObject(self, myLayerKey, myLayer, OBJC_ASSOCIATION_RETAIN);
}

- (CALayer *) myLayer{
    
    return objc_getAssociatedObject(self, myLayerKey);
}

- (void) setLayerArray:(NSMutableArray *)layerArray{
    
    objc_setAssociatedObject(self, layerArrayKey, layerArray, OBJC_ASSOCIATION_RETAIN);
}

- (NSMutableArray *) layerArray{
    
    return objc_getAssociatedObject(self, layerArrayKey);
}

#pragma mark -- private

- (UIImage *)snapshotSingleView:(UIView *)view
{
    CGRect rect =  view.frame;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
