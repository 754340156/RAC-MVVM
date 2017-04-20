//
//  BaseScrollViewVC.h
//  BeautyMakeup
//
//  Created by 赵哲 on 2017/4/14.
//  Copyright © 2017年 赵哲. All rights reserved.
//

#import "BaseVC.h"

@interface BaseScrollViewVC : BaseVC<UIScrollViewDelegate>
/**  scrollView */
@property(nonatomic,strong) UIScrollView * scrollView;
@end
