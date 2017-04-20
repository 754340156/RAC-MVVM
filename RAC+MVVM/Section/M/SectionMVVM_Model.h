//
//  SectionMVVM_Model.h
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/30.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import "BaseModel.h"

@interface SectionMVVM_Model : BaseModel
/**  image */
@property(nonatomic,copy) NSString * image;
/**  title */
@property(nonatomic,copy) NSString * title;
/**  content */
@property(nonatomic,copy) NSString * content;
@end
