//
//  CSHttpUtils.h
//  CloverStudioNetWorkLibs
//
//  Created by wlei on 2017/4/30.
//  Copyright © 2017年 cloverstudio.app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequestBase.h"

/// 请求访问结束的block
typedef  void (^rquestCompleteBlock)(NSDictionary *dict);
/// 请求出现异常时进行的操作
typedef void (^requstProblemBlock)(HttpRequestBase* problemInfo);
/// 请求出现错误
typedef void (^requstErrorBlock)(NSError *error);

@interface CSHttpUtils : NSObject


/**
 获取网络工具
 */
+(instancetype)httpUtils;


/**
 httpPost请求
 
 @param url 访问地址
 @param parameters 封装请求参数的字典对象
 @param complete 请求完成的代码块
 @param error 请求出错的代码块
 */
-(void)doPost:(NSString *)url
  andPostData:(NSDictionary *)parameters
  andComplete:(rquestCompleteBlock) complete
     andError:(requstErrorBlock)error;

/**
 *  httpPost请求
 *
 *  @param url     访问地址
 *  @param parameters    封装请求参数的字典对象
 *  @param complete 请求顺利完成
 *  @param problem 请求异常
 *  @param error   错误请求
 */
-(void)doPost:(NSString *)url
  andPostData:(NSDictionary *)parameters
  andComplete:(rquestCompleteBlock) complete
   andProblem:(requstProblemBlock) problem
     andError:(requstErrorBlock)error;


/**
 *  取消http的访问
 */
-(void)cancelHttpRequest;

/**
 *  激活http请求，因为有时http请求会被cancel
 */
-(void)activationHttpRequest;

@end
