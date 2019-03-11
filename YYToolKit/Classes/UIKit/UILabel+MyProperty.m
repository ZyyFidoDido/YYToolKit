//
//  UILabel+MyProperty.m
//  YJinJin
//
//  Created by 桃子leas on 2017/10/12.
//  Copyright © 2017年 YiTian. All rights reserved.
//

#import "UILabel+MyProperty.h"
#import "POP.h"

@implementation UILabel (MyProperty)

- (CGSize)yy_sizeRectWithSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    
    CGSize retSize = [self.text boundingRectWithSize:size
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize;
}




+ (void)yy_changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)yy_changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)yy_changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}



- (void)yy_XieTiLabelWithAngle:(CGFloat)_angle {
    CGAffineTransform matrix = CGAffineTransformMake(1, 0, tanf(-_angle * (CGFloat)M_PI / 180), 1, 0, 0);
    self.transform = matrix;
}


- (void)yy_textWithImage:(UIImage *)_image imageBounds:(CGRect)_bounds str:(NSString *)_str{
    //创建富文本
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:_str];
    //NSTextAttachment可以将要插入的图片作为特殊字符处理
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    //定义图片内容及位置和大小
    attch.image = _image;
    attch.bounds = _bounds;
    //创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    
    //将图片放在最后一位
    //[attri appendAttributedString:string];
    //将图片放在第一位
    [attri insertAttributedString:string atIndex:0];
    
    self.attributedText = attri;
}




#pragma mark number增加
- (void)yy_animationForNumFormValue:(CGFloat)fromVlue toValue:(CGFloat)toValue{
    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"countdown" initializer:^(POPMutableAnimatableProperty *prop) {
        
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
            UILabel *lable = (UILabel*)obj;
            //            倒数 1W 到 999 成功
            lable.text = [NSString stringWithFormat:@"%.2f",values[0]];
        };
    }];
    
    POPBasicAnimation *anBasic = [POPBasicAnimation linearAnimation];   //秒表当然必须是线性的时间函数
    anBasic.property = prop;    //自定义属性
    //    倒数 1W 到 999 成功
    anBasic.fromValue = @(fromVlue);   //从多少开始
    anBasic.toValue = @(toValue);  //到.多少.
    anBasic.duration = 1;    //持续0.3秒
    anBasic.beginTime = CACurrentMediaTime() + 0.2f;    //延迟1秒开始
    [self pop_addAnimation:anBasic forKey:@"countdown"];
}

- (void)yy_animationForNumFormIntValue:(int)fromVlue toIntValue:(int)toValue{
    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"countdown" initializer:^(POPMutableAnimatableProperty *prop) {
        
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
            UILabel *lable = (UILabel*)obj;
            //            倒数 1W 到 999 成功
            lable.text = [NSString stringWithFormat:@"%d",(int)values[0]];
        };
    }];
    
    POPBasicAnimation *anBasic = [POPBasicAnimation linearAnimation];   //秒表当然必须是线性的时间函数
    anBasic.property = prop;    //自定义属性
    //    倒数 1W 到 999 成功
    anBasic.fromValue = @(fromVlue);   //从多少开始
    anBasic.toValue = @(toValue);  //到.多少.
    anBasic.duration = 1;    //持续0.3秒
    anBasic.beginTime = CACurrentMediaTime() + 0.2f;    //延迟1秒开始
    [self pop_addAnimation:anBasic forKey:@"countdown"];
}

@end
