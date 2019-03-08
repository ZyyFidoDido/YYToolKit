//
//  UIView+FrameAccess.h
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FrameAccess)

- (CGPoint)origin;
- (void)setOrigin:(CGPoint)newOrigin;

- (CGSize)size;
- (void)setSize:(CGSize)newSize;

- (CGFloat)x;
- (void)setX:(CGFloat)newX;

- (CGFloat)y;
- (void)setY:(CGFloat)newY;

- (CGFloat)height;
- (void)setHeight:(CGFloat)newHeight;

- (CGFloat)width;
- (void)setWidth:(CGFloat)newWidth;


- (CGFloat)maxX;
- (void)setMaxX:(CGFloat)newMaxX;

- (CGFloat)midX;
- (void)setMidX:(CGFloat)newMidX;

- (CGFloat)maxY;
- (void)setMaxY:(CGFloat)newMaxY;

- (CGFloat)midY;
- (void)setMidY:(CGFloat)newMidY;



@property (nonatomic,assign) CGFloat right;

@property (nonatomic,assign) CGFloat bottom;

@end
