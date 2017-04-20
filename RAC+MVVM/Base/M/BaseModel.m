//
//  BaseModel.m
//  ZZProductDemo
//
//  Created by zhaozhe on 17/3/30.
//  Copyright © 2017年 zhaozhe. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
//MJLogAllIvars

MJCodingImplementation

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}

//null的字段处理
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    //把null属性处理成空
    if ([oldValue isKindOfClass:[NSNull class]])
    {
        if (property.type.typeClass)
        {
            return [property.type.typeClass new];
        }
        else
        {
            return 0;
        }
    }
    
    if (!oldValue)
    {
        if (property.type.typeClass)
        {
            if ([property.type.typeClass isSubclassOfClass:[NSString class]])
            {
                return @"";
            }
        }
        
    }
    return oldValue;
}
@end
