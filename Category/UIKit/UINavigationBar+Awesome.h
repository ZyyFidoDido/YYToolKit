//
//  UINavigationBar+Awesome.h
//  LTNavigationBar
//
//  Created by ltebean on 15-2-15.
//  Copyright (c) 2015 ltebean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Awesome)

@property (strong, nonatomic) UIView *overlay;

- (void)lt_setBackgroundColor:(UIColor *)backgroundColor;
- (void)lt_setImage:(UIImage *)backgroundImage;
- (void)lt_setImage:(UIImage *)backgroundImage withTitleImage:(UIImage *)titleImage;


- (void)lt_setElementsAlpha:(CGFloat)alpha;
- (void)lt_setTranslationY:(CGFloat)translationY;
- (void)lt_reset;
@end
