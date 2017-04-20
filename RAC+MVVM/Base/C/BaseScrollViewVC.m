//
//  BaseScrollViewVC.m
//  BeautyMakeup
//
//  Created by 赵哲 on 2017/4/14.
//  Copyright © 2017年 赵哲. All rights reserved.
//

#import "BaseScrollViewVC.h"
#import "BaseScrollViewModel.h"
@interface BaseScrollViewVC ()
/**  viewModel */
@property(nonatomic,strong) BaseScrollViewModel * viewModel;
@end

@implementation BaseScrollViewVC

#pragma mark - life cycle
- (instancetype)initWithViewModel:(BaseViewModel *)viewModel{
    self = [super initWithViewModel:viewModel];
    if (self) {

    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    
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
    self.viewModel.didScroll = RACObserve(self.scrollView,contentOffset);
}
#pragma mark - lazy
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = YES;
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}

@end
