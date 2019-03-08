//
//  UITextView+MyProperty.m
//  YJinJin
//
//  Created by 桃子leas on 2017/7/11.
//  Copyright © 2017年 YiTian. All rights reserved.
//

#import "UITextView+MyProperty.h"
#import <objc/runtime.h>

static const void *TextViewmaxWordsKey = &TextViewmaxWordsKey;
static const void *yy_placeHolderKey;

@interface UITextView ()
@property (nonatomic, readonly) UILabel *yy_placeHolderLabel;
@end

@implementation UITextView (MyProperty)

+(void)load{
    //    [super load];
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"layoutSubviews")),
                                   class_getInstanceMethod(self.class, @selector(yyPlaceHolder_swizzling_layoutSubviews)));
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),
                                   class_getInstanceMethod(self.class, @selector(yyPlaceHolder_swizzled_dealloc)));
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"setText:")),
                                   class_getInstanceMethod(self.class, @selector(yyPlaceHolder_swizzled_setText:)));
}
#pragma mark - swizzled
- (void)yyPlaceHolder_swizzled_dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self yyPlaceHolder_swizzled_dealloc];
}
- (void)yyPlaceHolder_swizzling_layoutSubviews {
    if (self.yy_placeHolder) {
        UIEdgeInsets textContainerInset = self.textContainerInset;
        CGFloat lineFragmentPadding = self.textContainer.lineFragmentPadding;
        CGFloat x = lineFragmentPadding + textContainerInset.left + self.layer.borderWidth;
        CGFloat y = textContainerInset.top + self.layer.borderWidth;
        CGFloat width = CGRectGetWidth(self.bounds) - x - textContainerInset.right - 2*self.layer.borderWidth;
        CGFloat height = [self.yy_placeHolderLabel sizeThatFits:CGSizeMake(width, 0)].height;
        self.yy_placeHolderLabel.frame = CGRectMake(x, y, width, height);
    }
    [self yyPlaceHolder_swizzling_layoutSubviews];
}
- (void)yyPlaceHolder_swizzled_setText:(NSString *)text{
    [self yyPlaceHolder_swizzled_setText:text];
    if (self.yy_placeHolder) {
        [self updatePlaceHolder];
    }
}
#pragma mark - associated
-(NSString *)yy_placeHolder{
    return objc_getAssociatedObject(self, &yy_placeHolderKey);
}
-(void)setYy_placeHolder:(NSString *)yy_placeHolder{
    objc_setAssociatedObject(self, &yy_placeHolderKey, yy_placeHolder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updatePlaceHolder];
}
-(UIColor *)yy_placeHolderColor{
    return self.yy_placeHolderLabel.textColor;
}
-(void)setYy_placeHolderColor:(UIColor *)yy_placeHolderColor{
    self.yy_placeHolderLabel.textColor = yy_placeHolderColor;
}
-(NSString *)placeholder{
    return self.yy_placeHolder;
}
-(void)setPlaceholder:(NSString *)placeholder{
    self.yy_placeHolder = placeholder;
}
#pragma mark - update
- (void)updatePlaceHolder{
    if (self.text.length) {
        [self.yy_placeHolderLabel removeFromSuperview];
        return;
    }
    self.yy_placeHolderLabel.font = self.font?self.font:self.cacutDefaultFont;
    self.yy_placeHolderLabel.textAlignment = self.textAlignment;
    self.yy_placeHolderLabel.text = self.yy_placeHolder;
    [self insertSubview:self.yy_placeHolderLabel atIndex:0];
}
#pragma mark - lazzing
-(UILabel *)yy_placeHolderLabel{
    UILabel *placeHolderLab = objc_getAssociatedObject(self, @selector(yy_placeHolderLabel));
    if (!placeHolderLab) {
        placeHolderLab = [[UILabel alloc] init];
        placeHolderLab.numberOfLines = 0;
        placeHolderLab.textColor = [UIColor darkGrayColor];
        objc_setAssociatedObject(self, @selector(yy_placeHolderLabel), placeHolderLab, OBJC_ASSOCIATION_RETAIN);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePlaceHolder) name:UITextViewTextDidChangeNotification object:self];
    }
    return placeHolderLab;
}
- (UIFont *)cacutDefaultFont{
    static UIFont *font = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UITextView *textview = [[UITextView alloc] init];
        textview.text = @" ";
        font = textview.font;
    });
    return font;
}

#pragma mark - 添加最大输入字符
- (void) setMaxWords:(NSInteger)maxWords{
    
    NSNumber *max = @(maxWords);
    objc_setAssociatedObject(self, TextViewmaxWordsKey, max, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    __weak __typeof(self)weakSelf = self;
    [self.rac_textSignal subscribeNext:^(NSString *content) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        
        NSInteger TEXTLENGTH  =  1000;
        if (weakSelf.maxWords > 0) {
            TEXTLENGTH = weakSelf.maxWords;
        }
        
        NSString *toBeString = content;
        //获取高亮部分
        UITextRange *selectedRange = [weakSelf markedTextRange];
        UITextPosition *position = [weakSelf positionFromPosition:selectedRange.start offset:0];
        
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position)
        {
            if (toBeString.length > TEXTLENGTH)
            {
                NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:TEXTLENGTH];
                if (rangeIndex.length == 1)
                {
                    weakSelf.text = [toBeString substringToIndex:TEXTLENGTH];
                }
                else
                {
                    NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, TEXTLENGTH)];
                    weakSelf.text = [toBeString substringWithRange:rangeRange];
                }
            }
        }
        
    }];
}

- (NSInteger) maxWords{
    
    NSNumber *max = objc_getAssociatedObject(self, TextViewmaxWordsKey);
    return [max integerValue];
}

@end
