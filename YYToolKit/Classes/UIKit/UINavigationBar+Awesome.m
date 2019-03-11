//
//  UINavigationBar+Awesome.m
//  LTNavigationBar
//
//  Created by ltebean on 15-2-15.
//  Copyright (c) 2015 ltebean. All rights reserved.
//

#import "UINavigationBar+Awesome.h"
#import <objc/runtime.h>



#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@implementation UINavigationBar (Awesome)
static char overlayKey;

- (UIView *)overlay
{
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay
{
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)lt_setBackgroundColor:(UIColor *)backgroundColor
{
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        NSInteger subHeight = 0;
        subHeight = [self judgeBangScreen] ? 24 : 0;
//        subHeight = Sc_Height >= 812 ? 24 : 0;

        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20 + subHeight)];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        // Should not set `UIViewAutoresizingFlexibleHeight`
        // self.overlay.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);//不对
        [[self.subviews firstObject] insertSubview:self.overlay atIndex:0];
    }
    
//    self.overlay.backgroundColor = backgroundColor;
    
    @_weakSelf(self)
    [UIView animateWithDuration:0.3 animations:^{
        @_strongSelf(self)
        self.overlay.backgroundColor = backgroundColor;
    }];
    
}

- (void)lt_setImage:(UIImage *)backgroundImage
{
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        NSInteger subHeight = 0;
//        subHeight = Sc_Height >= 812 ? 24 : 0;
        subHeight = [self judgeBangScreen] ? 24 : 0;
        
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20 + subHeight)];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [[self.subviews firstObject] insertSubview:self.overlay atIndex:0];
    }
    
    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:self.overlay.bounds];
    bgImage.image = backgroundImage;
    
    @_weakSelf(self)
    [UIView animateWithDuration:0.3 animations:^{
        @_strongSelf(self)
        [self.overlay addSubview:bgImage];
    }];
    
}

- (void)lt_setImage:(UIImage *)backgroundImage withTitleImage:(UIImage *)titleImage
{
    
    NSInteger subHeight = 0;
//    subHeight = Sc_Height >= 812 ? 24 : 0;
    subHeight = [self judgeBangScreen] ? 24 : 0;
    
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20 + subHeight)];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [[self.subviews firstObject] insertSubview:self.overlay atIndex:0];
    }
    
    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:self.overlay.bounds];
    bgImage.image = backgroundImage;
    
    UIImageView *titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake((Sc_Width - titleImage.size.width) / 2, 32 + subHeight, titleImage.size.width, titleImage.size.height)];
    titleImageView.image = titleImage;
    

    
    @_weakSelf(self)
    [UIView animateWithDuration:0.3 animations:^{
        @_strongSelf(self)
        [self.overlay addSubview:bgImage];
        [self.overlay addSubview:titleImageView];
    }];
    
}

- (void)lt_setTranslationY:(CGFloat)translationY
{
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}




- (void)lt_setElementsAlpha:(CGFloat)alpha
{
    
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];

    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    UIView *titleView = [self valueForKey:@"_titleView"];
    titleView.alpha = alpha;
    
    
    
//    when viewController first load, the titleView maybe nil
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
            obj.alpha = alpha;
        }
        if ([obj isKindOfClass:NSClassFromString(@"_UINavigationBarBackIndicatorView")]) {
            obj.alpha = alpha;
        }
        

    }];
    
    
}

- (void)lt_reset
{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.overlay removeFromSuperview];
    self.overlay = nil;
}


@end
