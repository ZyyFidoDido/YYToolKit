//
//  CALayer+CaLayer_xibColorConfiguration.m
//  TrafficSmooth
//
//  Created by 张芸瑜 on 2017/5/27.
//  Copyright © 2017年 张芸瑜. All rights reserved.
//

#import "CALayer+CaLayer_xibColorConfiguration.h"

@implementation CALayer (CaLayer_xibColorConfiguration)

- (void)setBorderUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

- (UIColor *)borderUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
