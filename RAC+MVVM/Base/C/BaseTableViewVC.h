//
//  BaseTableViewVC.h
//  BeautyMakeup
//
//  Created by 赵哲 on 2017/4/14.
//  Copyright © 2017年 赵哲. All rights reserved.
//

#import "BaseVC.h"

@interface BaseTableViewVC : BaseVC<UITableViewDelegate,UITableViewDataSource>
/**  tableView */
@property(nonatomic,strong) UITableView * tableView;
/**  处理成功回调 */
- (void)dataRequestSuccess:(id)params;
/**  处理错误回调 */
- (void)dataRequestError:(NSError *)error;
/**  处理结束回调 */
- (void)dataRequestFinished;
@end
