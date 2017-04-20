//
//  BaseCollectionViewCell.m
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/30.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
        [self bindViewModel];
    }
    return self;
}
- (void)setupViews{}
- (void)bindViewModel{}
@end
