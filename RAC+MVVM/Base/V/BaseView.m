//
//  BaseView.m
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/31.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import "BaseView.h"

@interface BaseView ()
/**  viewModel */
@property(nonatomic,strong) BaseViewModel * viewModel;
@end

@implementation BaseView
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BaseView *view = [super allocWithZone:zone];
    
    @weakify(view)
    [[view
      rac_signalForSelector:@selector(initWithFrame:)]
     subscribeNext:^(id x) {
         @strongify(view)
         [view setupViews];
         [view bindViewModel];
     }];
    
    return view;
}
- (void)bindViewModel {}

- (void)setupViews {}

@end
