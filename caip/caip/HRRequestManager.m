//
//  HRRequestManager.m
//  caip
//
//  Created by 王华瑞 on 17/3/23.
//  Copyright © 2017年 UT. All rights reserved.
//

#import "HRRequestManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation HRRequestManager

+ (NSURLSessionDataTask *)GET:(NSString *)url parameters:(NSDictionary *)parameters completeHandler:(HRRequestCompleteBlcok)block {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer new];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain", nil];
    NSURLSessionDataTask *dataTask = [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (nil != block) {
            block(task, responseObject, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (nil != block) {
            block(task, nil, error);
        }
    }];
    return dataTask;
}


+ (NSURLSessionDataTask *)POST:(NSString *)url parameters:(NSDictionary *)parameters completeHandler:(HRRequestCompleteBlcok)block {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain", nil];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy = securityPolicy;
    NSURLSessionDataTask *dataTask = [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (nil != block) {
            block(task, responseObject, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (nil != block) {
            block(task, nil, error);
        }
    }];
    return dataTask;
}

@end
