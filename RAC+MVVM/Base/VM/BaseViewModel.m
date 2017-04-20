//
//  BaseViewModel.m
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/30.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import "BaseViewModel.h"

@interface BaseViewModel ()

@end

@implementation BaseViewModel
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BaseViewModel *viewModel = [super allocWithZone:zone];
    
    @weakify(viewModel)
    [[viewModel
      rac_signalForSelector:@selector(init)]
     subscribeNext:^(id x) {
         @strongify(viewModel)
         [viewModel viewModelDidLoad];
         [viewModel viewModelLoadNotifications];
     }];
    
    return viewModel;
}

- (void)viewModelDidLoad
{
    
}
- (void)viewModelLoadNotifications
{
    
}
#pragma mark - custom
- (RACSignal *)requestRemoteDataSignal
{
    return [RACSignal empty];
}
#pragma mark - lazy
@end
