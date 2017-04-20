//
//  BaseNC.h
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/30.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNC : UINavigationController
/**
 *  一般情况下用于登录注册模块，模态出可以导航的控制器。并附带返回按钮
 */
- (instancetype)initWithBackBtnStyleRootViewController:(UIViewController *)rootViewController;
@end
