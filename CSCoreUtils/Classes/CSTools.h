//
//  CSTools.h
//  Pods
//  常用操作封装
//  Created by wlei on 2017/5/1.
//
//

#import <Foundation/Foundation.h>

@interface CSTools : NSObject

/// 将id类型装换成json字符串
+ (NSString *)objToJsonString:(id)obj;

@end
