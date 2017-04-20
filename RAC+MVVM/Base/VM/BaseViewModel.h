//
//  BaseViewModel.h
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/30.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseViewModelProtocol.h"

@interface BaseViewModel : NSObject<BaseViewModelProtocol>

/**  初始化后调用的方法 */
- (void)viewModelDidLoad;
- (void)viewModelLoadNotifications;
/**  获取数据方法 */
- (RACSignal *)requestRemoteDataSignal;

@end
