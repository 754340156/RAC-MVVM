//
//  SectionMVVM_ViewModel.m
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/30.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import "SectionMVVM_ViewModel.h"
#import "SectionMVVM_Model.h"

@implementation SectionMVVM_ViewModel
#pragma mark - life cycle
- (void)viewModelDidLoad
{
    [super viewModelDidLoad];
    self.isAllowLoadData = YES;
}

- (void)viewModelLoadNotifications
{
    [super viewModelLoadNotifications];
}
#pragma mark - network
- (NSArray *)networkHandle
{
    NSDictionary * dic = @{@"image":@"http://pic6.huitu.com/res/20130116/84481_20130116142820494200_1.jpg",
                           @"title":@"百度图片",
                           @"content":@"百度图片使用世界前沿的人工智能技术,为用户甄选海量的高清美图,用更流畅、更快捷、更精准的搜索体验,带你去发现多彩的世界。"};
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < 20; i++) {
        [array addObject:dic];
    }
    return array;
}
/**  获取数据方法(重写) */
- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page
{
    @weakify(self)
    return [[[[[ZZRequestManager sectionMVVMRequestWithPage:page] map:^id _Nullable(NSArray *  _Nullable listArray) {
        return [NSArray yy_modelArrayWithClass:[SectionMVVM_Model class] json:listArray];
    }] doNext:^(id  _Nullable x) {
        @strongify(self)
        [self dataSourceHandler:x];
    }] doError:^(NSError * _Nonnull error) {
        @strongify(self)
        NSArray * array = [NSArray yy_modelArrayWithClass:[SectionMVVM_Model class] json:[self networkHandle]];
        
        [self dataSourceHandler:array];
    }] doCompleted:^{

    }];
}
#pragma mark - custom

#pragma mark - lazy
@end
