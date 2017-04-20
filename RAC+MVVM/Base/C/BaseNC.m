//
//  BaseNC.m
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/30.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import "BaseNC.h"

@interface BaseNC ()

@end

@implementation BaseNC
/**
 *  一般情况下用于登录注册模块，模态出可以导航的控制器。并附带返回按钮
 */
- (instancetype)initWithBackBtnStyleRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self)
    {
        rootViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_hfanhui"] style:UIBarButtonItemStylePlain target:rootViewController action:@selector(handleDismiss)];
    }
    return self;
}
- (void)handleDismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
