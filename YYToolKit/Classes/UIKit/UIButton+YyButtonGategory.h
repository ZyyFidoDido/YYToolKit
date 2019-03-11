//
//  UIButton+YyButtonGategory.h
//  YJinJin
//
//  Created by Yitian on 2018/8/14.
//  Copyright © 2018年 YiTian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YYButtonType) {
    YYButtonType_titleLeft_imageRight = 0,
    YYButtonType_titleRight_imageLeft,
    YYButtonType_titleDown_imageUp
};

@interface UIButton (YyButtonGategory)

- (void)yy_showImageWithUrls:(NSString *)_urls withSize:(NSString *)_size;

- (void)yy_showImageWithUrls:(NSString *)_urls;

/**
 让button 携带一个 字典
 */
@property (strong, nonatomic) NSDictionary *DictionaryPicker;



#pragma mark - 增加button点击范围
/**
 自定义响应边界 UIEdgeInsetsMake(-3, -4, -5, -6). 表示扩大
 例如： self.btn.hitEdgeInsets = UIEdgeInsetsMake(-3, -4, -5, -6);
 */
@property(nonatomic, assign) UIEdgeInsets hitEdgeInsets;


/**
 自定义响应边界 自定义的边界的范围 范围扩大3.0
 例如：self.btn.hitScale = 3.0;
 */
@property(nonatomic, assign) CGFloat hitScale;

/*
 自定义响应边界 自定义的宽度的范围 范围扩大3.0
 例如：self.btn.hitWidthScale = 3.0;
 */
@property(nonatomic, assign) CGFloat hitWidthScale;

/*
 自定义响应边界 自定义的高度的范围 范围扩大3.0
 例如：self.btn.hitHeightScale = 3.0;
 */
@property(nonatomic, assign) CGFloat hitHeightScale;


#pragma mark - 设置button 文字和图片的展示
/**
 *  系统自带的button 设置文字和图片的显示方式
 *
 *  @param space 图片和文字之间的间距
 *  @param type  显示的方式
 */
- (void)yy_layoutButtonWithSpace:(CGFloat)space type:(YYButtonType)type;


/**
 *   取消高亮
 */
- (void)yy_cancelHighlight;


/**
 *  添加一个设置背景色的状态
 *
 *  @param backgroundColor
 *  @param state
 */
- (void)yy_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;


@end
