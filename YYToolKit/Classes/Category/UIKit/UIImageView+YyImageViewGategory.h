//
//  UIImageView+YyImageViewGategory.h
//  CloudStore
//
//  Created by Yitian on 2018/6/27.
//  Copyright © 2018年 YiTian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (YyImageViewGategory)

/**
 这边后台图片会 用 string的方式返回多张 需要拆分
 
 @param _urls 图片string,string,string
 */
- (void)yy_showImageWithUrls:(NSString *)_urls withSize:(NSString *)_size;

- (void)yy_showImageWithUrls:(NSString *)_urls withSize:(NSString *)_size placeHolder:(UIImage *)defaultImage;



- (void)yy_showImageWithUrls:(NSString *)_urls;


//头像
- (void)yy_showHeadImageWithUrls:(NSString *)_urls withSize:(NSString *)_size;

@end
