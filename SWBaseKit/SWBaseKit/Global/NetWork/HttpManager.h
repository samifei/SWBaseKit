//
//  HttpManager.h
//  BusinessTravel
//
//  Created by ttxc on 2019/2/27.
//  Copyright © 2019 http://www.jianshu.com/u/84d0142cbec9. All rights reserved.
//  网络请求

#import <Foundation/Foundation.h>
//连接超时时间
#define RequestTimeOut 30

@interface HttpManager : NSObject

@property (strong, nonatomic) MBProgressHUD *hud;

/**
 *  POST网络请求
 *  @param urlStr      url
 *  @param parameters  请求封装的参数
 *  @param success     请求成功后回调block
 *  @param failure     请求失败后回调block
 *
 *  @ return void
 */
+ (void)postUrl:(NSString *)urlStr
     Parameters:(id)parameters
        success:(void (^)(NSDictionary *resDict))success
        failure:(void (^)(NSError *error))failure;
/**
 *  GET网络请求
 *
 *  @param urlStr     url
 *  @param parameters 参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
+ (void)getUrl:(NSString *)urlStr
    Parameters:(id)parameters
       success:(void (^)(id))success
       failure:(void (^)(NSError *error))failure;

@end
