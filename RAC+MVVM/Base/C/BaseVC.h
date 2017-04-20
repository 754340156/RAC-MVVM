//
//  BaseVC.h
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/30.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseVCProtocol.h"
@class BaseViewModel;
@interface BaseVC : UIViewController<BaseVCProtocol>
/**  初始化视图 */
- (instancetype)initWithViewModel:(BaseViewModel *)viewModel;

/**  初始化后调用的方法 */
- (void)bindInitialization;
- (void)bindNotification;
- (void)bindViewModel;

@end
