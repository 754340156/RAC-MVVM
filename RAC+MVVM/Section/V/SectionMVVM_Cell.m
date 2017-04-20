//
//  SectionMVVM_Cell.m
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/31.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import "SectionMVVM_Cell.h"
#import "SectionMVVM_Model.h"

@interface SectionMVVM_Cell ()
/**  image */
@property(nonatomic,strong) UIImageView * imageV;
/**  title */
@property(nonatomic,strong) UILabel * titleLabel;
/**  content */
@property(nonatomic,strong) UILabel * contentLabel;
@end

@implementation SectionMVVM_Cell

#pragma mark - setup
- (void)setupViews
{
    @weakify(self)
    self.imageV = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageV];
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(10);
        make.size.mas_offset(CGSizeMake(50, 50));
    }];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.numberOfLines = 1;
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.offset(10);
        make.left.equalTo(self.imageV.mas_right).offset(10);
    }];
    
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.left.equalTo(self.titleLabel.mas_left);
        make.right.offset(-10);
        make.bottom.offset(-10);
    }];
}
#pragma mark - lazy
- (void)bindWithViewModel:(BaseViewModel *)viewModel fetchDataSource:(SectionMVVM_Model *)dataSource forIndexPath:(NSIndexPath *)indexPath
{
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:dataSource.image] placeholderImage:[UIImage imageNamed:@""]];
    self.titleLabel.text = dataSource.title;
    self.contentLabel.text = dataSource.content;
}
@end
