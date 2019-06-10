//
//  HttpManager.m
//  BusinessTravel
//
//  Created by ttxc on 2019/2/27.
//  Copyright © 2019 http://www.jianshu.com/u/84d0142cbec9. All rights reserved.
//

#import "HttpManager.h"

@implementation HttpManager

+ (AFHTTPSessionManager *)httpManager{
    //获取请求对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 设置请求格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer.timeoutInterval = RequestTimeOut;
    return manager;
}

+ (void)postUrl:(NSString *)urlStr
     Parameters:(id)parameters
        success:(void (^)(NSDictionary *resDict))success
        failure:(void (^)(NSError *error))failure;
{
    [self networkNotOK];
    AFHTTPSessionManager *manager = [self httpManager];
    
    [manager POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableDictionary *resDict = (NSMutableDictionary *)[responseObject mj_JSONObject];
//        NSDictionary *dict = [HttpManager checkResultVaild:resDict withFunction:parameters[@"function"]];
        SWLog(@"\n接口：%@\n返回数据：%@",parameters[@"function"],[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        success(resDict);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
        SWLog(@"\n当前接口：%@\n错误信息：%@",parameters[@"function"],error);
    }];
    
    
    
//    [manager POST:urlStr
//       parameters:parameters
//         progress:^(NSProgress * _Nonnull uploadProgress) {
//
//         }
//          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//              NSMutableDictionary *resDict = (NSMutableDictionary *)[responseObject mj_JSONObject];
////              NSDictionary *dict = [HttpManager checkResultVaild:resDict withFunction:parameters[@"function"]];
//              SWLog(@"\n接口：%@\n返回数据：%@",parameters[@"function"],[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
//              success(resDict);
//          }
//          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//              failure(error);
//              SWLog(@"\n当前接口：%@\n错误信息：%@",parameters[@"function"],error);
//          }];
}

+ (void)getUrl:(NSString *)urlStr
    Parameters:(id)parameters
       success:(void (^)(id))success
       failure:(void (^)(NSError *error))failure
{
    [self networkNotOK];
    AFHTTPSessionManager *manager = [self httpManager];
    //开始请求
    [manager  GET:urlStr
       parameters:parameters
         progress:^(NSProgress * _Nonnull uploadProgress) {
             
         }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NSString *result = [[NSString alloc] initWithData:responseObject
                                                       encoding:NSUTF8StringEncoding];
//              DDLogInfo(@"返回数据--%@",result);
              NSMutableDictionary *resDict = (NSMutableDictionary *)[responseObject mj_JSONObject];
              success(resDict);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failure(error);
              NSLog(@"%@",error);
          }];
}

/**
 *  检查返回的内容是否有效
 *
 *  @param dict        返回数据
 *  @param functionStr 接口名称
 *
 *  @return 正常的返回数据
 */
//+ (NSDictionary *)checkResultVaild:(NSDictionary *)dict withFunction:(NSString *)functionStr
//{
//    
//}

/**
 * 检查网络是否正常
 *
 **/
+(void)networkNotOK {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        int netWork;
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:{
                NSLog(@"未知");
                netWork = -1;
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:{
                NSLog(@"没有网络");
                netWork = 0;
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                NSLog(@"3G/4G");
                netWork = 1;
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi: {
                NSLog(@"无线网");
                netWork = 2;
            }
                break;
            default:
                NSLog(@"网络?");
                break;
        }
        if (netWork <= 0) {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:((AppDelegate*)([UIApplication sharedApplication].delegate)).window animated:YES];
            hud.label.text = NSLocalizedString(@"网络无连接", @"HUD loading title");
            // hud.label.font = [UIFont italicSystemFontOfSize:16.f];
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                sleep(3.);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [hud hideAnimated:YES];
                });
            });
        }
        return;
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}
-(MBProgressHUD *)hud {
    if (_hud ==nil) {
        _hud = [[MBProgressHUD alloc]initWithView:((AppDelegate*)([UIApplication sharedApplication].delegate)).window];
    }
    return _hud;
}


@end
