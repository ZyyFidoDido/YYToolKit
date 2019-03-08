//
//  UIView+YYFitXScreen.m
//  YJinJin
//
//  Created by Yitian on 2018/7/17.
//  Copyright © 2018年 YiTian. All rights reserved.
//

#import "UIView+YYFitXScreen.h"
#import <sys/utsname.h>
//#import "Masonry.h"
#import <objc/runtime.h>

#define Height   [[UIScreen mainScreen] bounds].size.height

//  X Xs Xr 812 || Xs Max 896

@implementation UIView (YYFitXScreen)

+ (void)load {
    
    //    Method basic1 = class_getInstanceMethod([self class], @selector(layoutSubviews));
    //    Method exchange1 = class_getInstanceMethod([self class], @selector(yyLayoutSubviews));
    //    method_exchangeImplementations(basic1, exchange1);
    
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"layoutSubviews")),
                                   class_getInstanceMethod(self.class, @selector(yy_swizzling_layoutSubviews)));
    
    
}

- (void)yy_swizzling_layoutSubviews {
    
    if (self.tag == 99766) { //navView 高度变88
        
        if ([self judgeBangScreen]) {
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(88);
            }];
        }
        
    }
    
    if (self.tag == 26662) {
        
        if ([self judgeBangScreen]) {  //贴在底边的view 上移34
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.superview.mas_bottom).with.offset(-34);
            }];
        }
        
    }
    
    if (self.tag == 9766524) {
        
        if ([self judgeBangScreen]) { //贴上边的view 下移88
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.superview.mas_top).with.offset(88);
            }];
        }
        
    }
    
    if (self.tag == 92675) {
        
        if ([self judgeBangScreen]) { //贴上边的view 下移到 20 + 24 的位置
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.superview.mas_top).with.offset(44);
            }];
        }
        
    }
    
    if (self.tag == 9794439) {
        
        if ([self judgeBangScreen]) { // 主要是给 详情页的 webview
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.superview.mas_top).with.offset(88);
                make.bottom.equalTo(self.superview.mas_bottom).with.offset(-84);
            }];
        }
        
    }
    
    if (self.tag == 473775) {
        
        if ([self judgeBangScreen]) { // 让贴底的view 高度变为34
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(34);
            }];
        }
    }
    
    if (self.tag == 4737752) {
        
        if ([self judgeBangScreen]) { // 让贴底的table 高度变为83
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(83);
            }];
        }
    }
    
    [self yy_swizzling_layoutSubviews];
}




//判断 是否有 刘海屏
- (BOOL)judgeBangScreen {
    struct utsname systemInfo;
    uname(&systemInfo);
    BOOL style = NO;
    NSString*platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform rangeOfString:@"iPhone"].location != NSNotFound) {
        NSArray *array = [[platform substringFromIndex:6] componentsSeparatedByString:@","];
        NSInteger mark1 = [array.firstObject integerValue];
        NSInteger mark2 = [array.lastObject integerValue];
        if (mark1 > 10) {
            style = YES;
        }
        else {
            if (mark1 == 10) {
                if (mark2==3 || mark2 == 6) {
                    style = YES;
                }
            }
            else {
                style = NO;
            }
        }
    }
    else if ([platform rangeOfString:@"x86_64"].location != NSNotFound) {
        style = Height >= 812 ? YES : NO;
    }
    else {
        style = NO;
    }
    return style;
}
@end
