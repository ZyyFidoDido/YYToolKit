//
//  CALayer+CaLayer_xibColorConfiguration.h
//  TrafficSmooth
//
//  Created by 张芸瑜 on 2017/5/27.
//  Copyright © 2017年 张芸瑜. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>


@interface CALayer (CaLayer_xibColorConfiguration)

//ps : 引用后可以直接在.xib中设置 边框 边颜色 切角
@property (nonatomic,weak) UIColor *borderUIColor;

@end
