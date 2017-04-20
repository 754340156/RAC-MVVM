//
//  BaseVC.m
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/30.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import "BaseVC.h"
#import "BaseViewModel.h"
@interface BaseVC ()

/**  viewModel */
@property(nonatomic,strong) BaseViewModel * viewModel;

@end

@implementation BaseVC

#pragma mark - life cycle
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BaseVC *viewController = [super allocWithZone:zone];
    
    @weakify(viewController)
    [[viewController
      rac_signalForSelector:@selector(viewDidLoad)]
     subscribeNext:^(id x) {
         @strongify(viewController)
         [viewController bindInitialization];
         [viewController bindNotification];
         [viewController bindViewModel];
     }];
    
    return viewController;
}
- (instancetype)initWithViewModel:(BaseViewModel *)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (void)bindInitialization
{
    
}
- (void)bindNotification
{
    
}
- (void)bindViewModel
{

}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

}
#pragma mark - Setup

#pragma mark - custom

#pragma mark - BarButtonItem

#pragma mark - lazy

@end
