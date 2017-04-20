//
//  BaseTableViewCell.h
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/30.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCellProtocol.h"

@class BaseViewModel;
@interface BaseTableViewCell : UITableViewCell<BaseTableViewCellProtocol>
/**
 *  底线
 *
 *  @param margin  距左右的间距（对称）
 *  @param color 颜色
 *  @param height 线高
 */
- (void)addGrayBottomLineWithMargin:(CGFloat)margin color:(UIColor *)color height:(CGFloat)height;
/**
 *  顶线
 *
 *  @param margin  距左右的间距（对称）
 *  @param color 颜色
 *  @param height 线高
 */
- (void)addGrayTopLineWithMargin:(CGFloat)margin color:(UIColor *)color height:(CGFloat)height;
/**  初始化方法  */
- (void)setupViews;
- (void)bindViewModel;
@end
