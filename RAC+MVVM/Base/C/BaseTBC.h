//
//  BaseTBC.h
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/30.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTBC : UITabBarController
//添加子控制器
- (void)addChildVC:(UIViewController *)vc title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;
@end
