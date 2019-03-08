//
//  UILabel+FormattedText.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import "UILabel+FormattedText.h"

@implementation UILabel (FormattedText)

- (void)zp_setTextColor:(UIColor *)textColor range:(NSRange)range{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString: self.attributedText];
    [text addAttribute: NSForegroundColorAttributeName
                 value: textColor
                 range: range];

    [self setAttributedText: text];
}

- (void)zp_setFont:(UIFont *)font range:(NSRange)range{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString: self.attributedText];
    [text addAttribute: NSFontAttributeName
                 value: font
                 range: range];

    [self setAttributedText: text];
}


- (void)zp_setTextColor:(UIColor *)textColor afterOccurenceOfString:(NSString*)separator{

    NSRange range = [self.text rangeOfString:separator];
    if (range.location != NSNotFound){
        range.location ++;
        range.length = self.text.length - range.location;
        [self zp_setTextColor:textColor range:range];
    }
}

- (void)zp_setFont:(UIFont *)font afterOccurenceOfString:(NSString*)separator{
    NSRange range = [self.text rangeOfString:separator];
    if (range.location != NSNotFound){
        range.location ++;
        range.length = self.text.length - range.location;
        [self zp_setFont:font range:range];
    }
}

@end
