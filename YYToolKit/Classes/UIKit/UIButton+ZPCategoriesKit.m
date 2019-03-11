//
//  UIButton+ZPCategoriesKit.m
//  ZPCategoriesKitDemo
//
//  Created by 陈中培 on 16/1/29.
//  Copyright © 2016年 陈中培. All rights reserved.
//

#import "UIButton+ZPCategoriesKit.h"
#import "NSString+ZPCategoriesKit.h"
#import "UIImage+ZPCategoriesKit.h"

@implementation UIButton (ZPCategoriesKit)

- (void)zp_layoutButtonWithSpace:(CGFloat)space type:(ZPButtonType)type{

    CGFloat image_width = self.imageView.image.size.width;
    CGFloat image_height = self.imageView.image.size.height;
    UIFont *labelFont = self.titleLabel.font;
    NSString *text = self.titleLabel.text;


    switch (type) {
        case ZPButtonType_titleLeft_imageRight:{

            [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];

            NSDictionary *attribute = @{NSFontAttributeName:labelFont};

            CGSize titleSize = [text zp_sizeWithlimitSize:CGSizeMake(self.frame.size.width,MAXFLOAT) attribute:attribute];

            CGFloat title_origin_x = (self.frame.size.width-image_width-space-titleSize.width)/2 - image_width;
            CGFloat image_origin_x = title_origin_x + space + titleSize.width+image_width;

            [self setTitleEdgeInsets:UIEdgeInsetsMake(0,title_origin_x,0,0)];
            [self setImageEdgeInsets:UIEdgeInsetsMake(0,image_origin_x,0,0)];
            
        }
            break;
        case ZPButtonType_titleRight_imageLeft:{

            [self setImageEdgeInsets:UIEdgeInsetsMake(0,-space/2,0,0)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0,space/2,0,0)];

        }
            break;
        case ZPButtonType_titleDown_imageUp:{

            NSDictionary *attribute = @{NSFontAttributeName:labelFont};
            CGSize titleSize = [text zp_sizeWithlimitSize:CGSizeMake(self.frame.size.width,MAXFLOAT) attribute:attribute];
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

- (void)zp_cancelHighlight{
    self.adjustsImageWhenHighlighted = NO;
}


- (void)zp_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state{
    [self setBackgroundImage:[UIImage zp_imageWithColor:backgroundColor size:CGSizeMake(1, 1)] forState:state];
}

@end
