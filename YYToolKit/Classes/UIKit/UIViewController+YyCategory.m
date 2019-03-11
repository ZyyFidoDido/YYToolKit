//
//  UIViewController+YyCategory.m
//  YTSellingCC
//
//  Created by Yitian on 2018/12/12.
//  Copyright © 2018 YiTian. All rights reserved.
//

#import "UIViewController+YyCategory.h"
#import "BlocksKit+UIKit.h"
#import <objc/runtime.h>
#import "constHeader.h"
#import "UIColor+YyCategory.h"

static const void *barRightButtonImageNameKey     = &barRightButtonImageNameKey;
static const void *barRightButtonNameKey          = &barRightButtonNameKey;
static const void *barRightButtonTinkColorKey     = &barRightButtonTinkColorKey;
static const void *barRightButtonHaveTinkColorKey = &barRightButtonHaveTinkColorKey;

static const void *barLeftButtonImageNameKey     = &barLeftButtonImageNameKey;
static const void *barLeftButtonNameKey          = &barLeftButtonNameKey;
static const void *barLeftButtonTinkColorKey     = &barLeftButtonTinkColorKey;
static const void *barLeftButtonHaveTinkColorKey = &barLeftButtonHaveTinkColorKey;


@implementation UIViewController (YyCategory)

- (void)yy_setupEdges {
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

+ (UIViewController *)yy_instanceFromStoryBoard{
    NSString *name = NSStringFromClass([self class]);
    UIStoryboard *sb = [UIStoryboard storyboardWithName:name bundle:nil];
    UIViewController *controller = [sb instantiateViewControllerWithIdentifier:name];
    return controller;
}

- (UIBarButtonItem *)yy_barButtonItemTitle:(NSString *)titleName handler:(void (^)(id))action {
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] bk_initWithTitle:titleName style:UIBarButtonItemStylePlain handler:^(id sender) {
        action(sender);
    }];
    
    return bar;
}


- (UIBarButtonItem *)yy_barButtonItemImage:(UIImage *)image handler:(void (^)(id))action {
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] bk_initWithImage:image style:UIBarButtonItemStylePlain handler:^(id sender) {
        action(sender);
    }];
    return bar;
}


- (UIBarButtonItem *)yy_barButtonItemSystemItem:(UIBarButtonSystemItem)systemItem handler:(void (^)(id))action{
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] bk_initWithBarButtonSystemItem:systemItem handler:^(id sender) {
        action(sender);
    }];
    return bar;
    
}


#pragma mark - 设置tabbar Btn
// 左
- (void)setBarLeftButtonImageName:(NSString *)barLeftButtonImageName {
    objc_setAssociatedObject(self, barLeftButtonImageNameKey, barLeftButtonImageName, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self creatBarLeftBtn];
}

- (void)setBarLeftButtonName:(NSString *)barLeftButtonName {
    objc_setAssociatedObject(self, barLeftButtonNameKey, barLeftButtonName, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self creatBarLeftBtn];
}

- (void)setBarLeftButtonTinkColor:(UIColor *)barLeftButtonTinkColor {
    objc_setAssociatedObject(self, barLeftButtonTinkColorKey, barLeftButtonTinkColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self creatBarLeftBtn];
}

- (void)creatBarLeftBtn {
    self.navigationItem.leftBarButtonItem = nil;
    
    if (self.barLeftButtonName && self.barLeftButtonImageName) {
        UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
        left.frame = CGRectMake(0, 0, 83, 44);
        UIImageView *imageLeft = [[UIImageView alloc]initWithFrame:CGRectMake(0, 12, 20, 20)];
        imageLeft.image = [UIImage imageNamed:self.barLeftButtonImageName];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(23, 0, 60, 44)];
        label.text = self.barLeftButtonName;
        label.textColor = self.barLeftButtonTinkColor ? self.barLeftButtonTinkColor : U_YDBlack;
        label.font = [UIFont systemFontOfSize:14];
        [left addSubview:imageLeft];
        [left addSubview:label];
        [left addTarget:self action:@selector(processNavViewLeftBtn) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *leftBnt = [[UIBarButtonItem alloc] initWithCustomView:left];
        self.navigationItem.leftBarButtonItem = leftBnt;
    }
    else {
        if (self.barLeftButtonName && !self.barLeftButtonImageName) {
            UIBarButtonItem *leftBnt = [[UIBarButtonItem alloc] initWithTitle:self.barLeftButtonName style:UIBarButtonItemStylePlain target:self action:@selector(processNavViewLeftBtn)];
            leftBnt.tintColor = self.barLeftButtonTinkColor ? self.barLeftButtonTinkColor : U_YDBlack;
            if (self.barLeftButtonTinkColor) {
                [leftBnt setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14],
                                                  NSForegroundColorAttributeName : self.barLeftButtonTinkColor,}
                                       forState:UIControlStateNormal];
            }
            else {
                [leftBnt setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14],
                                                  NSForegroundColorAttributeName : U_YDBlack,}
                                       forState:UIControlStateNormal];
            }
            
            self.navigationItem.leftBarButtonItem = leftBnt;
        }
        else {
            UIBarButtonItem *leftBnt = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:self.barLeftButtonImageName] style:UIBarButtonItemStylePlain target:self action:@selector(processNavViewLeftBtn)];
            leftBnt.tintColor = self.barLeftButtonTinkColor ? self.barLeftButtonTinkColor : U_YDBlack;
            self.navigationItem.leftBarButtonItem = leftBnt;
        }
    }
    
}

- (NSString *)barLeftButtonImageName {
    return objc_getAssociatedObject(self, barLeftButtonImageNameKey);
}

- (NSString *)barLeftButtonName {
    return objc_getAssociatedObject(self, barLeftButtonNameKey);
}

- (UIColor *)barLeftButtonTinkColor {
    return objc_getAssociatedObject(self, barLeftButtonTinkColorKey);
}


// -=-=-=-=-=-=-  右

- (void)setBarRightButtonImageName:(NSString *)barRightButtonImageName {
    objc_setAssociatedObject(self, barRightButtonImageNameKey, barRightButtonImageName, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self creatBarRightBtn];
}

- (void)setBarRightButtonName:(NSString *)barRightButtonName {
    objc_setAssociatedObject(self, barRightButtonNameKey, barRightButtonName, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self creatBarRightBtn];
}

- (void)setBarRightButtonTinkColor:(UIColor *)barRightButtonTinkColor {
    objc_setAssociatedObject(self, barRightButtonTinkColorKey, barRightButtonTinkColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self creatBarRightBtn];
}


- (void)creatBarRightBtn {
    self.navigationItem.rightBarButtonItem = nil;
    
    if (self.barRightButtonName && self.barRightButtonImageName) {
        //        UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
        //        left.frame = CGRectMake(0, 0, 83, 44);
        //        UIImageView *imageLeft = [[UIImageView alloc]initWithFrame:CGRectMake(0, 12, 20, 20)];
        //        imageLeft.image = [UIImage imageNamed:self.barLeftButtonImageName];
        //        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(23, 0, 60, 44)];
        //        label.text = self.barLeftButtonName;
        //        label.textColor = self.barLeftButtonTinkColor ? self.barLeftButtonTinkColor : U_YDBlack;
        //        label.font = [UIFont systemFontOfSize:14];
        //        [left addSubview:imageLeft];
        //        [left addSubview:label];
        //        [left addTarget:self action:@selector(processNavViewLeftBtn) forControlEvents:UIControlEventTouchUpInside];
        //        UIBarButtonItem *leftBnt = [[UIBarButtonItem alloc] initWithCustomView:left];
        //        self.navigationItem.leftBarButtonItem = leftBnt;
    }
    else {
        if (self.barRightButtonName && !self.barRightButtonImageName) {
            UIBarButtonItem *rightBnt = [[UIBarButtonItem alloc] initWithTitle:self.barRightButtonName style:UIBarButtonItemStylePlain target:self action:@selector(processNavViewRightBtn)];
            rightBnt.tintColor = self.barRightButtonTinkColor ? self.barRightButtonTinkColor : U_YDBlack;
            
            if (self.barRightButtonTinkColor) {
                [rightBnt setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14],
                                                   NSForegroundColorAttributeName : self.barRightButtonTinkColor,}
                                        forState:UIControlStateNormal];
            }
            else {
                [rightBnt setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14],
                                                   NSForegroundColorAttributeName : U_YDBlack,}
                                        forState:UIControlStateNormal];
            }
            
            self.navigationItem.rightBarButtonItem = rightBnt;
        }
        else {
            UIBarButtonItem *rightBnt = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:self.barRightButtonImageName] style:UIBarButtonItemStylePlain target:self action:@selector(processNavViewRightBtn)];
            rightBnt.tintColor = self.barRightButtonTinkColor ? self.barRightButtonTinkColor : U_YDBlack;
            self.navigationItem.rightBarButtonItem = rightBnt;
        }
    }
    
}


- (NSString *)barRightButtonImageName {
    return objc_getAssociatedObject(self, barRightButtonImageNameKey);
}

- (NSString *)barRightButtonName {
    return objc_getAssociatedObject(self, barRightButtonNameKey);
}

- (UIColor *)barRightButtonTinkColor {
    return objc_getAssociatedObject(self, barRightButtonTinkColorKey);
}

//-=-


















- (void)creatNavBarRightBtn:(BOOL)_bool Name:(NSString *)_name ImageName:(NSString *)_imageName {
    UIBarButtonItem *leftBnt = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:_name] style:UIBarButtonItemStylePlain target:self action:@selector(processNavViewLeftBtn)];
    leftBnt.tintColor = U_YDBlack;
    self.navigationItem.leftBarButtonItem = leftBnt;
}

- (void)processNavViewLeftBtn {
    
}

- (void)processNavViewRightBtn {
    
}



@end
