//
//  ZZRequestManager.h
//  BeautyMakeup
//
//  Created by 赵哲 on 2017/4/14.
//  Copyright © 2017年 赵哲. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZRequestManager : NSObject
//MVVM网络请求
+ (RACSignal *)sectionMVVMRequestWithPage:(NSInteger)page;

#pragma mark - HomePage
//首页
+ (RACSignal *)HomePageCollectionRequest;
@end
