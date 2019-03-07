//
//  UITextField+MyProperty.h
//  扩写类
//
//  Created by 桃子leas on 2017/6/16.
//  Copyright © 2017年 桃子leas. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CurrentNum)(NSInteger num);
@interface UITextField (MyProperty)

@property (nonatomic, assign)  NSInteger maxWords;
@property (assign, readonly,nonatomic)  CurrentNum  currentNum;

@end
