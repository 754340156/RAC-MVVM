//
//  BaseTableViewModel.m
//  BeautyMakeup
//
//  Created by 赵哲 on 2017/4/12.
//  Copyright © 2017年 赵哲. All rights reserved.
//

#import "BaseTableViewModel.h"


@implementation BaseTableViewModel
#pragma mark - life cycle
- (void)viewModelDidLoad {
    [super viewModelDidLoad];
    
    self.pageIndex = 0;
    self.dataSource = [NSMutableArray array];
    
    @weakify(self);
    self.requestRemoteDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSNumber *page) {
        @strongify(self);
        return [self requestRemoteDataSignalWithPage:page.unsignedIntegerValue];
    }];
    self.cellDidSelect = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSIndexPath *  _Nullable indexPath) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [subscriber sendNext:indexPath];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
}
- (void)viewModelLoadNotifications
{
    [super viewModelLoadNotifications];
}
#pragma mark - network
- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page
{
    return [RACSignal empty];
}
#pragma mark - custom
- (void)dataSourceHandler:(NSArray *)arr {
    if (arr && arr.count > 0) {
        if (self.pageIndex == 0) {
            self.dataSource = arr;
        } else {
            self.dataSource = [self.dataSource arrayByAddingObjectsFromArray:arr];
        }
        self.pageIndex ++;
    } else {
        if (self.pageIndex == 0) {
            self.dataSource = @[];
        }
    }
}
#pragma mark - lazy

@end
