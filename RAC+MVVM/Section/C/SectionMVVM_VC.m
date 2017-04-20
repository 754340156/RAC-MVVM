//
//  SectionMVVM_VC.m
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/30.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import "SectionMVVM_VC.h"
#import "SectionMVVM_Cell.h"
#import "SectionMVVM_ViewModel.h"

@interface SectionMVVM_VC ()
/**  viewModel */
@property(nonatomic,strong) SectionMVVM_ViewModel * viewModel;
@end

@implementation SectionMVVM_VC
#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[SectionMVVM_Cell class] forCellReuseIdentifier:NSStringFromClass([SectionMVVM_Cell class])];
}

- (void)bindViewModel
{
    [super bindViewModel];
    [self.viewModel.requestRemoteDataCommand execute:@(1)];
    
    [self.viewModel.cellDidSelect.executionSignals.switchToLatest subscribeNext:^(NSIndexPath *  _Nullable indexPath) {
        NSLog(@"%ld--%ld",indexPath.section,indexPath.row);
    }];
}


#pragma mark - customMethod


#pragma mark - reset
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SectionMVVM_Cell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SectionMVVM_Cell class])];
    [cell bindWithViewModel:self.viewModel fetchDataSource:self.viewModel.dataSource[indexPath.row] forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([SectionMVVM_Cell class]) cacheByIndexPath:indexPath configuration:^(SectionMVVM_Cell * cell) {
            [cell bindWithViewModel:self.viewModel fetchDataSource:self.viewModel.dataSource[indexPath.row] forIndexPath:indexPath];
    }];
}
#pragma mark - lazy or setter or getter




@end
