//
//  BaseTableViewCell.m
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/30.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self setupViews];
        [self bindViewModel];
    }
    return self;
}

- (void)setupViews
{
    
}
- (void)bindViewModel
{
    
}



//底线
- (void)addGrayBottomLineWithMargin:(CGFloat)margin color:(UIColor *)color height:(CGFloat)height
{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = color;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(margin);
        make.right.offset(-margin);
        make.bottom.offset(0);
        make.height.offset(height);
    }];
}
//顶线
- (void)addGrayTopLineWithMargin:(CGFloat)margin color:(UIColor *)color height:(CGFloat)height
{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = color;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(margin);
        make.right.offset(-margin);
        make.top.offset(0);
        make.height.offset(height);
    }];
}

/*  修改编辑样式 */
-(void)layoutSubviews
{
    for (UIControl *control in self.subviews){
        if ([control isMemberOfClass:NSClassFromString(@"UITableViewCellEditControl")]){
            for (UIView *v in control.subviews)
            {
                if ([v isKindOfClass: [UIImageView class]]) {
                    UIImageView *img=(UIImageView *)v;
                    if (self.selected) {
//                        img.image= Image(@"icon_slect");
                    }else
                    {
//                        img.image=Image(@"icon_weiuan");
                    }
                }
            }
        }
    }
    
    [super layoutSubviews];
}
- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    for (UIControl *control in self.subviews){
        if ([control isMemberOfClass:NSClassFromString(@"UITableViewCellEditControl")]){
            for (UIView *v in control.subviews)
            {
                if ([v isKindOfClass: [UIImageView class]]) {
                    UIImageView *img = (UIImageView *)v;
                    if (!self.selected) {
//                        img.image = Image(@"icon_weiuan");
                    }else
                    {
//                        img.image = Image(@"icon_slect");
                    }
                }
            }
        }
    }
}
/**
 编辑状态下的cell被选中的时候会有对应的灰色背景，下面代码块就是清除灰色的
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if (!self.editing) {
        return;
    }
    [super setSelected:selected animated:animated];
    if (self.editing) {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.detailTextLabel.backgroundColor = [UIColor clearColor];
    }
}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    return;
}
 */
@end
