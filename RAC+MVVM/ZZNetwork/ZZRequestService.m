//
//  ZZRequestService.m
//  BeautyMakeup
//
//  Created by 赵哲 on 2017/4/14.
//  Copyright © 2017年 赵哲. All rights reserved.
//

#import "ZZRequestService.h"

@implementation ZZRequestService
+ (RACSignal *)requestPOSTWithURL:(NSString *)requestURL parameters:(NSDictionary *)parameters
{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [ZZRequestService POST:requestURL parameters:parameters success:^(id dic) {
            [ZZRequestService requestResultWithResponseObject:dic error:nil subscribe:subscriber];
        } netError:^(NSError *error) {
            [ZZRequestService requestResultWithResponseObject:nil error:error subscribe:subscriber];
        }];
        return nil;
    } ];
}
#pragma mark - custom
/**
 *  网络请求
 *
 *  @param success  成功的请求
 *  @param netError 没网
 */
+ (AFHTTPSessionManager *)POST:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(id dic))success netError:(void(^)(NSError *error))netError
{


    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = ZZ_Request_Timeout_Time;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain", nil];
    
    NSMutableDictionary *parametersDic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    
    [manager POST:url parameters:parametersDic progress:nil success:^(NSURLSessionDataTask * task, id responseObject){
         
         NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
         
         //打印出请求到的字符串
         NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil];
         NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
         NSLog(@"%@",jsonString);
         
         success(dictionary);
         
     } failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         netError(error);
     }];
    return manager;
}
+ (void)requestResultWithResponseObject:(id)responseObject error:(NSError *)error subscribe:(id<RACSubscriber>)subscriber
{
    if (error) {
        [subscriber sendError:error];
    }
    if (responseObject) {
        [subscriber sendNext:responseObject];
    }
    [subscriber sendCompleted];
}
@end
