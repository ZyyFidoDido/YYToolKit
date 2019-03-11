//
//  CLNetworkingManager.h
//  Networking
//
//  Created by ClaudeLi on 16/4/28.
//  Copyright © 2016年 ClaudeLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CLNetworking.h"

typedef void (^requestCompletion)(BOOL success , id recived);

@class CLImageModel;
@interface CLNetworkingManager : NSObject

/**
 *  监听网络状态,程序启动执行一次即可
 */
+ (void)checkNetworkLinkStatus;

/**
 *  读取当前网络状态
 *
 *  @return -1:未知, 0:无网络, 1:2G|3G|4G, 2:WIFI
 */
+ (NSInteger)theNetworkStatus;

/**
 *  Get请求 <若开启缓存，先读取本地缓存数据，再进行网络请求>
 *
 *  @param urlString  请求地址
 *  @param parameters 拼接的参数
 *  @param isCache    是否开启缓存
 */
+ (void)getNetworkRequestWithUrlString:(NSString *)urlString parameters:(id)parameters isCache:(BOOL)isCache completion:(requestCompletion)completion;

/**
 *  Get请求 <在缓存时间之内只读取缓存数据，不会再次网络请求，减少服务器请求压力。缺点：在缓存时间内服务器数据改变，缓存数据不会及时刷新>
 *
 *  @param urlString  请求地址
 *  @param parameters 拼接的参数
 *  @param time       缓存时间（单位：分钟）
 */
+ (void)getCacheRequestWithUrlString:(NSString *)urlString parameters:(id)parameters cacheTime:(float)time completion:(requestCompletion)completion;

/**
 *  Post请求 <若开启缓存，先读取本地缓存数据，再进行网络请求，>
 *
 *  @param urlString  请求地址
 *  @param parameters 拼接的参数
 *  @param isCache    是否开启缓存机制
 */
+ (void)postNetworkRequestWithUrlString:(NSString *)urlString parameters:(id)parameters isCache:(BOOL)isCache completion:(requestCompletion)completion;

/**
 *  Post请求 <在缓存时间之内只读取缓存数据，不会再次网络请求，减少服务器请求压力。缺点：在缓存时间内服务器数据改变，缓存数据不会及时刷新>
 *
 *  @param urlString  请求地址
 *  @param parameters 拼接的参数
 *  @param time       缓存时间（单位：分钟）
 */
+ (void)postCacheRequestWithUrlString:(NSString *)urlString parameters:(id)parameters cacheTime:(float)time completion:(requestCompletion)completion;


/**
 Post请求 <需要设置 [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];的类型>

 * @param urlString 请求地址
 * @param parameters 拼接的参数
 * @param isCache    是否开启缓存机制
 */
+ (void)postJsonRequestWithUrlString:(NSString *)urlString parameters:(id)parameters isCache:(BOOL)isCache completion:(requestCompletion)completion;

/**
 Post请求 <需要设置 [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];的类型>
          <在缓存时间之内只读取缓存数据，不会再次网络请求，减少服务器请求压力>
 * @param urlString 请求地址
 * @param parameters 拼接的参数
 * @param time       缓存时间（单位：分钟）
 */
+ (void)postJsonRequestWithUrlString:(NSString *)urlString parameters:(id)parameters cacheTime:(float)time completion:(requestCompletion)completion;



/**
 *  上传图片
 *
 *  @param URLString  请求地址
 *  @param parameters 拼接的参数
 *  @param model      要上传的图片model
 *  @param progress   上传进度(writeKB：已上传多少KB, totalKB：总共多少KB)
 *  @param succeed    上传成功
 *  @param fail       上传失败
 */
+ (void)uploadWithURLString:(NSString *)URLString
                 parameters:(id)parameters
                      model:(CLImageModel *)model
                   progress:(void (^)(float writeKB, float totalKB)) progress
                    succeed:(void (^)())succeed
                       fail:(void (^)(NSError *error))fail;

/**
 *  清理缓存
 */
+ (void)clearCaches;

/**
 *  获取网络缓存文件大小
 *
 *  @return 多少KB
 */
+ (float)getCacheFileSize;

@end
