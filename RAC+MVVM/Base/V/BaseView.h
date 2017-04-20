//
//  BaseView.h
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/31.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"

@interface BaseView : UIView <BaseViewProtocol>
/**  初始化方法  */
- (void)setupViews;
- (void)bindViewModel;
@end
