//
//  BaseTBC.m
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/30.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import "BaseTBC.h"

#import "SectionMVVM_VC.h"


@interface BaseTBC ()<UITabBarControllerDelegate>
@property (nonatomic, assign) NSInteger indexFlag;
@end

@implementation BaseTBC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configTabBar];    
    [self addOwnViews];
    [self updateUserInfo];
}
//配置tabbar
- (void)configTabBar
{
   
    

    self.delegate = self;
}

//添加控制器
- (void)addOwnViews
{
    [self addChildVC:[[SectionMVVM_VC alloc] initWithViewModel:[[NSClassFromString(@"SectionMVVM_ViewModel") alloc] init]] title:@"首页" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
    [self addChildVC:[[BaseVC alloc] initWithViewModel:[[BaseViewModel alloc] init]] title:@"美妆" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];

}

- (void)updateUserInfo
{
    
}

//添加子控制器
- (void)addChildVC:(UIViewController *)vc title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    vc.tabBarItem.title = title;
    
    BaseNC *naviC = [[BaseNC alloc] initWithRootViewController:vc];
    
    //把图片渲染成指定颜色
    UIImage *normalImage = image;
    naviC.tabBarItem.image = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    naviC.tabBarItem.selectedImage = selectedImage;
    naviC.tabBarItem.title = title;
    [naviC.tabBarItem setImageInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    [self addChildViewController:naviC];
}


@end
