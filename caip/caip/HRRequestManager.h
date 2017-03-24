//
//  HRRequestManager.h
//  caip
//
//  Created by 王华瑞 on 17/3/23.
//  Copyright © 2017年 UT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HRRequestCompleteBlcok)(NSURLSessionDataTask * __nullable task, id __nullable responseObject, NSError * __nullable error);

@interface HRRequestManager : NSObject

/// 发送GET请求
+ (NSURLSessionDataTask * __nullable)GET:(NSString * __nonnull)url
                              parameters:(NSDictionary * __nullable)parameters
                         completeHandler:(HRRequestCompleteBlcok __nullable)block;

/// 发送POST请求
+ (NSURLSessionDataTask * __nullable)POST:(NSString * __nonnull)url
                               parameters:(NSDictionary * __nullable)parameters
                          completeHandler:(HRRequestCompleteBlcok __nullable)block;

@end
