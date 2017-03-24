//
//  RequestNet.h
//  VRAutoCyclingController
//
//  Created by 上海攸途科技智能有限公司 on 16/6/6.
//  Copyright © 2016年 UT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
//定义返回请求数据的block类型
typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^FailureBlock)(NSError *error);
typedef void (^NetWorkBlock)(BOOL netConnetState);
//蜂窝移动网络
typedef void (^ReachableViaWWAN) ();
//wifi
typedef void (^ReachableViaWiFi) ();
//无网络
typedef void (^NotReachable) ();

@interface RequestNet : NSObject
#pragma 监测网络的可链接性
+ (void)netWorkReachabilityWithViaWWAN:(ReachableViaWWAN)WWANBlock ViaWiFi:(ReachableViaWiFi)WiFiBlock notReachable:(NotReachable)failureBlock;

#pragma POST请求
+ (void)NetRequestPOSTWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                WithReturnValeuBlock: (ReturnValueBlock) block
                  WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
                    WithFailureBlock: (FailureBlock) failureBlock;

#pragma GET请求
+ (void)NetRequestGETWithRequestURL: (NSString *) requestURLString
                      WithParameter: (NSDictionary *) parameter
               WithReturnValeuBlock: (ReturnValueBlock) block
                 WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
                   WithFailureBlock: (FailureBlock) failureBlock;

+ (NSURLSessionDownloadTask *)downloadFileWithURL:(NSString *)urlString
                   filePath:(NSString *)filePath
                   progress:(void (^)(CGFloat downloadProgress))progress
          completionHandler:(void (^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionHandler;
//临时用
+ (void)NetRequestPOSTWithRequestURLS:(NSString *)requestURLString
                       WithParameters:(NSDictionary *)parameter
                WithReturnValeuBlocks:(ReturnValueBlock)block
                  WithErrorCodeBlocks:(ErrorCodeBlock)errorBlock
                    WithFailureBlocks:(FailureBlock)failureBlocks;

@end
