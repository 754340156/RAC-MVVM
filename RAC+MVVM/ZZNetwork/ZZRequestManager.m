//
//  ZZRequestManager.m
//  BeautyMakeup
//
//  Created by 赵哲 on 2017/4/14.
//  Copyright © 2017年 赵哲. All rights reserved.
//

#import "ZZRequestManager.h"

@implementation ZZRequestManager
+ (RACSignal *)sectionMVVMRequestWithPage:(NSInteger)page
{
    return [ZZRequestService requestPOSTWithURL:@"MVVM/MVVM" parameters:@{@"pageIndex":@(page)}];
}

#pragma mark - HomePage
//首页
+ (RACSignal *)HomePageCollectionRequest
{
    return [ZZRequestService requestPOSTWithURL:@"" parameters:@{}];
}
@end
