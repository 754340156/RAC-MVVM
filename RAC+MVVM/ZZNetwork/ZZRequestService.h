//
//  ZZRequestService.h
//  BeautyMakeup
//
//  Created by 赵哲 on 2017/4/14.
//  Copyright © 2017年 赵哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#define ZZ_Request_Timeout_Time 20
@interface ZZRequestService : NSObject

+ (RACSignal *)requestPOSTWithURL:(NSString *)requestURL parameters:(NSDictionary *)parameters;
@end
