
//
//  RequestNet.m
//  VRAutoCyclingController
//
//  Created by 上海攸途科技智能有限公司 on 16/6/6.
//  Copyright © 2016年 UT. All rights reserved.
//

#import "RequestNet.h"
#import "AFNetworking.h"
@implementation RequestNet
#pragma 监测网络的可链接性
+ (void)netWorkReachabilityWithViaWWAN:(ReachableViaWWAN)WWANBlock ViaWiFi:(ReachableViaWiFi)WiFiBlock notReachable:(NotReachable)failureBlock {
    //1.创建网络监测者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    /*枚举里面四个状态  分别对应 未知 无网络 数据 WiFi
     typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {
     AFNetworkReachabilityStatusUnknown          = -1,      未知
     AFNetworkReachabilityStatusNotReachable     = 0,       无网络
     AFNetworkReachabilityStatusReachableViaWWAN = 1,       蜂窝数据网络
     AFNetworkReachabilityStatusReachableViaWiFi = 2,       WiFi
     };
     */
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //这里是监测到网络改变的block  可以写成switch方便
        //在里面可以随便写事件
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络状态");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"无网络");
                if (failureBlock) {
                    failureBlock();
                }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝数据网");
                if (WWANBlock) {
                    WWANBlock();
                }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi网络");
                if (WiFiBlock) {
                    WiFiBlock();
                }
                break;
                
            default:
                break;
        }
        
    }] ;
    //开始监测

//    [manager startMonitoring];

    [manager startMonitoring];

}
/***************************************
 在这做判断如果有dic里有errorCode
 调用errorBlock(dic)
 没有errorCode则调用block(dic
 ******************************/

#pragma --mark GET请求方式
+ (void)NetRequestGETWithRequestURL:(NSString *)requestURLString
                      WithParameter:(NSDictionary *)parameter
               WithReturnValeuBlock:(ReturnValueBlock)block
                 WithErrorCodeBlock:(ErrorCodeBlock)errorBlock
                   WithFailureBlock:(FailureBlock)failureBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:requestURLString parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if (block) {
            block(dic);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

#pragma --mark POST请求方式

+ (void)NetRequestPOSTWithRequestURL:(NSString *)requestURLString
                       WithParameter:(NSDictionary *)parameter
                WithReturnValeuBlock:(ReturnValueBlock)block
                  WithErrorCodeBlock:(ErrorCodeBlock)errorBlock
                    WithFailureBlock:(FailureBlock)failureBlock
{
    NSString *urlString = requestURLString;
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"UTF-8" forHTTPHeaderField:@"charset"];
//    [request setValue:[[NSUserDefaults standardUserDefaults] objectForKey:UTUserToken] forHTTPHeaderField:@"userToken"];
    [request setValue:@"436e9fc1-277d-414c-b7b5-f09e80774545" forHTTPHeaderField:@"userToken"];
    request.HTTPMethod = @"POST";
    request.timeoutInterval = 120;
    if (parameter) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameter options:kNilOptions error:nil];
        request.HTTPBody = jsonData;
    }
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//            UTLog(@"---dic = %@",dic);
            if (block) {
                block(dic);
            }
        }
        if (error) {
            failureBlock(error);
        }
    }];
    
    [task resume];
}

+ (NSURLSessionDownloadTask *)downloadFileWithURL:(NSString *)urlString
                   filePath:(NSString *)filePath
                   progress:(void (^)(CGFloat downloadProgress))progress
          completionHandler:(void (^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionHandler {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDownloadTask *task =
    [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        CGFloat pro = ((CGFloat)downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        progress(pro);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return [NSURL fileURLWithPath:filePath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        completionHandler(response,filePath,error);
    }];
    [task resume];
    return task;
}

+ (void)NetRequestPOSTWithRequestURLS:(NSString *)requestURLString
                       WithParameters:(NSDictionary *)parameter
                WithReturnValeuBlocks:(ReturnValueBlock)block
                  WithErrorCodeBlocks:(ErrorCodeBlock)errorBlock
                    WithFailureBlocks:(FailureBlock)failureBlocks {
    
}

@end
