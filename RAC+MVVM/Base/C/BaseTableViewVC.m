//
//  BaseTableViewVC.m
//  BeautyMakeup
//
//  Created by 赵哲 on 2017/4/14.
//  Copyright © 2017年 赵哲. All rights reserved.
//

#import "BaseTableViewVC.h"
#import "BaseTableViewModel.h"
@interface BaseTableViewVC ()
/**  viewModel */
@property(nonatomic,strong) BaseTableViewModel * viewModel;
@end

@implementation BaseTableViewVC
#pragma mark - life cycle
- (instancetype)initWithViewModel:(BaseViewModel *)viewModel{
    self = [super initWithViewModel:viewModel];
    if (self) {
            @weakify(self);
            [[self rac_signalForSelector:@selector(bindViewModel)]
             subscribeNext:^(id x) {
                 @strongify(self);
                 //一开始就刷新
                 if (self.viewModel.isAllowLoadData &&self.viewModel.isLoadDataInitially) {
                     [self.tableView.mj_header beginRefreshing];
                 }
             }];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    if (self.viewModel.isAllowLoadData) {
        self.tableView.mj_header = [self setupHeader];
        self.tableView.mj_footer = [self setupFooter];
    }
    
}
- (void)bindInitialization
{
    [super bindInitialization];
}
- (void)bindNotification
{
    [super bindNotification];
}
- (void)bindViewModel
{
    [super bindViewModel];
    @weakify(self);
    //监听数据源，刷新列表
    [RACObserve(self.viewModel,dataSource).distinctUntilChanged.deliverOnMainThread
     subscribeNext:^(id x) {
         @strongify(self);
         [self.tableView reloadData];
     }];
}
#pragma mark - custom
- (void)dataRequestSuccess:(id)params
{
    
}
- (void)dataRequestError:(NSError *)error
{
    
}

- (void)dataRequestFinished
{
    
}
- (MJRefreshNormalHeader *)setupHeader
{
    @weakify(self);
    MJRefreshNormalHeader * setupHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        self.viewModel.pageIndex = 0;
        [self requestRemote];
    }];
    return setupHeader;
}
- (MJRefreshBackNormalFooter *)setupFooter
{
    @weakify(self);
    MJRefreshBackNormalFooter * setupFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        @strongify(self);
        [self requestRemote];
    }];
    return setupFooter;
}
- (void)requestRemote
{
    @weakify(self);
    [[self.viewModel.requestRemoteDataCommand execute:@(self.viewModel.pageIndex + 1)] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        if ([self respondsToSelector:@selector(dataRequestSuccess:)]) {
            [self dataRequestSuccess:x];
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    } error:^(NSError * _Nullable error) {
        @strongify(self);
        if ([self respondsToSelector:@selector(dataRequestError:)]) {
            [self dataRequestError:error];
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    } completed:^{
        @strongify(self);
        if ([self respondsToSelector:@selector(dataRequestFinished)]) {
            [self dataRequestFinished];
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];
}
#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld-----%ld",indexPath.section,indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.viewModel.cellDidSelect execute:indexPath];
}
#pragma mark - lazy
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (BaseViewModel *)viewModel
{
    return [[BaseTableViewModel alloc] init];
}
@end
