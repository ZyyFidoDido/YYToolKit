//
//  UITextField+LimitLength.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/3/24.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import "UITextField+LimitLength.h"
#import "UITextField+BlocksKit.h"



@implementation UITextField (LimitLength)


- (void)zp_limitLenth:(NSInteger)length endBlock:(void(^)())endBlock{

    [self setBk_shouldChangeCharactersInRangeWithReplacementStringBlock:^BOOL(UITextField *textField, NSRange range, NSString *string) {
        NSInteger location = range.location;
        if(location <= length-1){
            return YES;
        }else{
            endBlock();
            return NO;
        }
    }];
}

@end
