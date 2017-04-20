//
//  BaseTableViewCellProtocol.h
//  BeautyMakeup
//
//  Created by 赵哲 on 2017/4/14.
//  Copyright © 2017年 赵哲. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseTableViewCellProtocol <NSObject>
@optional
/**  绑定ViewModel以及赋值 */
- (void)bindWithViewModel:(BaseViewModel *)viewModel fetchDataSource:(NSObject *)dataSource forIndexPath:(NSIndexPath *)indexPath;
/**  计算高度 */
+ (CGFloat)cellHeightWithModel:(NSObject *)model;
@end
