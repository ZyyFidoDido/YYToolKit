//
//  UIButton+YyButtonGategory.m
//  YJinJin
//
//  Created by Yitian on 2018/8/14.
//  Copyright © 2018年 YiTian. All rights reserved.
//

#import "UIButton+YyButtonGategory.h"
#import <objc/runtime.h>
#import "NSString+YyCategory.h"
#import "UIImage+YyImageCategory.h"

static const void *DictionaryPickerKey = &DictionaryPickerKey;

static const char * kHitEdgeInsets   = "hitEdgeInsets";
static const char * kHitScale        = "hitScale";
static const char * kHitWidthScale   = "hitWidthScale";
static const char * kHitHeightScale  = "hitHeightScale";

@implementation UIButton (YyButtonGategory)

- (void)setDictionaryPicker:(NSDictionary *)DictionaryPicker {
    objc_setAssociatedObject(self, DictionaryPickerKey, DictionaryPicker, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary *)DictionaryPicker {
    return objc_getAssociatedObject(self, DictionaryPickerKey);
}



- (void)yy_showImageWithUrls:(NSString *)_urls withSize:(NSString *)_size{
    
//    NSString *imagesString = _urls;
//    NSArray *imagesArray = [imagesString componentsSeparatedByString:@","];
//    if (imagesArray) {
//        NSString *iamgePath = imagesArray.firstObject;
//
//        NSURL *urlStr;
//        if (_size.length > 0) {
//            urlStr = [NSURL URLWithString:[[YTSharednetManager sharedNetManager] setImageWithUrl:iamgePath andWithSize:_size]];
//        }
//        else {
//            urlStr = [NSURL URLWithString:iamgePath];
//        }
//
//        [self sd_setImageWithURL:urlStr forState:UIControlStateNormal placeholderImage:DefaultImage];
//
//    }
//    else{
//        [self setImage:DefaultImage forState:UIControlStateNormal];
//    }
}


- (void)yy_showImageWithUrls:(NSString *)_urls{
    
//    NSString *imagesString = _urls;
//    NSArray *imagesArray = [imagesString componentsSeparatedByString:@","];
//    if (imagesArray) {
//        NSString *iamgePath = imagesArray.firstObject;
//        
//        NSURL *urlStr;
//        urlStr = [NSURL URLWithString:iamgePath];
//        [self sd_setImageWithURL:urlStr forState:UIControlStateNormal placeholderImage:DefaultImage];
//    }
//    else{
//        [self setImage:DefaultImage forState:UIControlStateNormal];
//    }
}


#pragma mark - 增加button点击范围
#pragma mark -- set Method
-(void)setHitEdgeInsets:(UIEdgeInsets)hitEdgeInsets{
    NSValue *value = [NSValue value:&hitEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self,kHitEdgeInsets, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)setHitScale:(CGFloat)hitScale{
    CGFloat width = self.bounds.size.width * hitScale;
    CGFloat height = self.bounds.size.height * hitScale;
    self.hitEdgeInsets = UIEdgeInsetsMake(-height, -width,-height, -width);
    objc_setAssociatedObject(self, kHitScale, @(hitScale), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(void)setHitWidthScale:(CGFloat)hitWidthScale{
    CGFloat width = self.bounds.size.width * hitWidthScale;
    CGFloat height = self.bounds.size.height ;
    self.hitEdgeInsets = UIEdgeInsetsMake(-height, -width,-height, -width);
    objc_setAssociatedObject(self, kHitWidthScale, @(hitWidthScale), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



-(void)setHitHeightScale:(CGFloat)hitHeightScale{
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height * hitHeightScale ;
    self.hitEdgeInsets = UIEdgeInsetsMake(-height, -width,-height, -width);
    objc_setAssociatedObject(self, kHitHeightScale, @(hitHeightScale), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark -- get Method
-(UIEdgeInsets)hitEdgeInsets{
    NSValue *value = objc_getAssociatedObject(self, kHitEdgeInsets);
    UIEdgeInsets edgeInsets;
    [value getValue:&edgeInsets];
    return value ? edgeInsets:UIEdgeInsetsZero;
}

-(CGFloat)hitScale{
    return [objc_getAssociatedObject(self, kHitScale) floatValue];
}

-(CGFloat)hitWidthScale{
    return [objc_getAssociatedObject(self, kHitWidthScale) floatValue];
}

-(CGFloat)hitHeightScale{
    return [objc_getAssociatedObject(self, kHitHeightScale) floatValue];
}



#pragma mark -- override super method
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    //如果 button 边界值无变化  失效 隐藏 或者透明 直接返回
    if(UIEdgeInsetsEqualToEdgeInsets(self.hitEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden || self.alpha == 0 ) {
        return [super pointInside:point withEvent:event];
    }else{
        CGRect relativeFrame = self.bounds;
        CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitEdgeInsets);
        return CGRectContainsPoint(hitFrame, point);
    }
}








#pragma mark - 设置button 文字和图片的展示
- (void)yy_layoutButtonWithSpace:(CGFloat)space type:(YYButtonType)type{
    
    CGFloat image_width = self.imageView.image.size.width;
    CGFloat image_height = self.imageView.image.size.height;
    UIFont *labelFont = self.titleLabel.font;
    NSString *text = self.titleLabel.text;
    
    
    switch (type) {
        case YYButtonType_titleLeft_imageRight:{
            
            [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
            
            NSDictionary *attribute = @{NSFontAttributeName:labelFont};
            
            CGSize titleSize = [text yy_sizeWithlimitSize:CGSizeMake(self.frame.size.width,MAXFLOAT) attribute:attribute];
            
            CGFloat title_origin_x = (self.frame.size.width-image_width-space-titleSize.width)/2 - image_width;
            CGFloat image_origin_x = title_origin_x + space + titleSize.width+image_width;
            
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0,title_origin_x,0,0)];
            [self setImageEdgeInsets:UIEdgeInsetsMake(0,image_origin_x,0,0)];
            
        }
            break;
        case YYButtonType_titleRight_imageLeft:{
            
            [self setImageEdgeInsets:UIEdgeInsetsMake(0,-space/2,0,0)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0,space/2,0,0)];
            
        }
            break;
        case YYButtonType_titleDown_imageUp:{
            
            NSDictionary *attribute = @{NSFontAttributeName:labelFont};
            CGSize titleSize = [text yy_sizeWithlimitSize:CGSizeMake(self.frame.size.width,MAXFLOAT) attribute:attribute];
            CGFloat title_origin_x = -image_width/2;
            CGFloat image_origin_x = titleSize.width/2;
            CGFloat image_origin_y = - (titleSize.height+space)/2;
            CGFloat title_origin_y = (image_height+space)/2;
            [self setImageEdgeInsets:UIEdgeInsetsMake(image_origin_y,image_origin_x,-image_origin_y,-image_origin_x)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(title_origin_y,title_origin_x,-title_origin_y,-title_origin_x)];
            
        }
            break;
        default:
            break;
    }
    
    
}

- (void)yy_cancelHighlight{
    self.adjustsImageWhenHighlighted = NO;
}

- (void)yy_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state{
    [self setBackgroundImage:[UIImage yy_imageWithColor:backgroundColor size:CGSizeMake(1, 1)] forState:state];
}
@end
