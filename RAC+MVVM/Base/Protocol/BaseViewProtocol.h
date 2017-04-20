//
//  BaseViewProtocol.h
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/31.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewProtocol <NSObject>
@optional
/**  绑定ViewModel以及赋值 */
- (void)bindWithViewModel:(BaseViewModel *)viewModel;
@end
