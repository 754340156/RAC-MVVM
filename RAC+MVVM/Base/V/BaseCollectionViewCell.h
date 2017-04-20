//
//  BaseCollectionViewCell.h
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/30.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCollectionViewCellProtocol.h"
@interface BaseCollectionViewCell : UICollectionViewCell<BaseCollectionViewCellProtocol>
/**  初始化方法  */
- (void)setupViews;
- (void)bindViewModel;
@end
