//
//  BaseScrollViewModel.h
//  BeautyMakeup
//
//  Created by 赵哲 on 2017/4/14.
//  Copyright © 2017年 赵哲. All rights reserved.
//

#import "BaseViewModel.h"

@interface BaseScrollViewModel : BaseViewModel
/**  滚动信号 */
@property(nonatomic,strong) RACSignal * didScroll;
@end
