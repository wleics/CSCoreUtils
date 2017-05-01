//
//  HttpRequestBase.h
//  Pods
//
//  Created by wlei on 2017/5/1.
//
//

#import <Foundation/Foundation.h>

@interface HttpRequestBase : NSObject

/// 结果类型，在使用本框架时，resultFlag字段必须返回，且当返回成功时resultFlag的值为1
@property (strong, nonatomic)  NSString *resultFlag;
/// 错误信息
@property (copy, nonatomic)  NSString *resultErrorMsg;

@end
