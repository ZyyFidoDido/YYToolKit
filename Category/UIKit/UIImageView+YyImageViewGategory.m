//
//  UIImageView+YyImageViewGategory.m
//  CloudStore
//
//  Created by Yitian on 2018/6/27.
//  Copyright © 2018年 YiTian. All rights reserved.
//

#import "UIImageView+YyImageViewGategory.h"

@implementation UIImageView (YyImageViewGategory)

- (void)yy_showImageWithUrls:(NSString *)_urls withSize:(NSString *)_size{

    NSString *imagesString = _urls;
    NSArray *imagesArray = [imagesString componentsSeparatedByString:@","];
    if (imagesArray) {
        NSString *iamgePath = imagesArray.firstObject;

        NSURL *urlStr;
        if (_size.length > 0) {
            urlStr = [NSURL URLWithString:[[YTSharednetManager sharedNetManager] setImageWithUrl:iamgePath andWithSize:_size]];
        }
        else {
            urlStr = [NSURL URLWithString:iamgePath];
        }

        [self sd_setImageWithURL:urlStr placeholderImage:DefaultImage];
    }
    else{
        [self setImage:DefaultImage];
    }
}

- (void)yy_showImageWithUrls:(NSString *)_urls withSize:(NSString *)_size placeHolder:(UIImage *)defaultImage {
    NSString *imagesString = _urls;
    NSArray *imagesArray = [imagesString componentsSeparatedByString:@","];
    if (imagesArray) {
        NSString *iamgePath = imagesArray.firstObject;
        
        NSURL *urlStr;
        if (_size.length > 0) {
            urlStr = [NSURL URLWithString:[[YTSharednetManager sharedNetManager] setImageWithUrl:iamgePath andWithSize:_size]];
        }
        else {
            urlStr = [NSURL URLWithString:iamgePath];
        }
        [self sd_setImageWithURL:urlStr placeholderImage:defaultImage];
    }
    else{
        [self setImage:defaultImage];
    }
}


- (void)yy_showImageWithUrls:(NSString *)_urls{
    
    NSString *imagesString = _urls;
    NSArray *imagesArray = [imagesString componentsSeparatedByString:@","];
    if (imagesArray) {
        NSString *iamgePath = imagesArray.firstObject;

        NSURL *urlStr;
        urlStr = [NSURL URLWithString:iamgePath];
        [self sd_setImageWithURL:urlStr placeholderImage:DefaultImage];
    }
    else{
        [self setImage:DefaultImage];
    }
}


- (void)yy_showHeadImageWithUrls:(NSString *)_urls withSize:(NSString *)_size {
    
    NSString *imagesString = _urls;
    NSArray *imagesArray = [imagesString componentsSeparatedByString:@","];
    if (imagesArray) {
        NSString *iamgePath = imagesArray.firstObject;
        
        NSURL *urlStr;
        if (_size.length > 0) {
            urlStr = [NSURL URLWithString:[[YTSharednetManager sharedNetManager] setImageWithUrl:iamgePath andWithSize:_size]];
        }
        else {
            urlStr = [NSURL URLWithString:iamgePath];
        }
        
        [self sd_setImageWithURL:urlStr placeholderImage:DefaultImageHeader];
    }
    else{
        [self setImage:DefaultImageHeader];
    }
}
@end
