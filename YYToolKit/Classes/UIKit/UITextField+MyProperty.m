//
//  UITextField+MyProperty.m
//  扩写类
//
//  Created by 桃子leas on 2017/6/16.
//  Copyright © 2017年 桃子leas. All rights reserved.
//

#import "UITextField+MyProperty.h"
#import <objc/runtime.h>

static const void *maxWordsKey = &maxWordsKey;
static const void *currentNumKey = &currentNumKey;


@implementation UITextField (MyProperty)

- (void) setMaxWords:(NSInteger)maxWords{
    
    NSNumber *max = @(maxWords);
    objc_setAssociatedObject(self, maxWordsKey, max, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventEditingChanged];
}

- (NSInteger) maxWords{
    
    NSNumber *max = objc_getAssociatedObject(self, maxWordsKey);
    return [max integerValue];
}


// 限制输入框的输入长度。支持所有格式
//[_text addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventEditingChanged];
- (void) changeValue:(UITextField *) textField{
    
    NSInteger TEXTLENGTH  =  1000;
    
    if (self.maxWords > 0) {
        
        TEXTLENGTH = self.maxWords;
    }
    
    NSString *toBeString = textField.text;
    //获取高亮部分
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position)
    {
        if (toBeString.length > TEXTLENGTH)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:TEXTLENGTH];
            if (rangeIndex.length == 1)
            {
                textField.text = [toBeString substringToIndex:TEXTLENGTH];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, TEXTLENGTH)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
    
    NSNumber *current = @(textField.text.length);
    objc_setAssociatedObject(self, currentNumKey, current, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

//- (void)setNowWordsNum:(int)nowWordsNum {
//    NSNumber *current = @(self.text.length);
//    objc_setAssociatedObject(self, nowNumKey, current, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}

//- (int)nowWordsNum {
//    return objc_getAssociatedObject(self, nowNumKey);
//}




@end
