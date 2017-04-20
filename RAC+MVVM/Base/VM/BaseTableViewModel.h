//
//  BaseTableViewModel.h
//  BeautyMakeup
//
//  Created by 赵哲 on 2017/4/12.
//  Copyright © 2017年 赵哲. All rights reserved.
//

#import "BaseViewModel.h"

//默认每次请求显示10条数据
static const NSInteger pageSize = 10;

@interface BaseTableViewModel : BaseViewModel
/**  是否一开始就需要刷新 */
@property (nonatomic,assign) BOOL isLoadDataInitially;
/**  是否允许刷新 */
@property (nonatomic,assign) BOOL isAllowLoadData;
/**  是否允许加载更多 */
@property (nonatomic,assign) BOOL isAllowLoadAdditionalData;
/**  点击cell指令 */
@property (nonatomic,strong) RACCommand * cellDidSelect;
/**  获取更多数据的指令 */
@property (nonatomic,strong) RACCommand *requestRemoteDataCommand;
/**  数据源 */
@property(nonatomic,strong) NSArray * dataSource;
/**  pageIndex */
@property(nonatomic,assign) NSInteger pageIndex;
/**  获取数据方法(重写) */
- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page;
/**  默认处理数据回调的方法（上拉下拉处理数据） */
- (void)dataSourceHandler:(NSArray *)arr;
@end
