//
//  ZWAFNetWorkHttpUtils.h
//  Pods
//
//  Created by wlei on 2017/5/1.
//
//

#import <Foundation/Foundation.h>
@class HttpRequestBase;

//请求访问结束的block
typedef  void (^rquestCompleteBlock)(NSDictionary *dict);
//请求出现异常时进行的操作
typedef void (^requstProblemBlock)(HttpRequestBase* problemInfo);
//请求出现错误
typedef void (^requstErrorBlock)(NSError *error);

@interface ZWAFNetWorkHttpUtils : NSObject


/**
 *  httpPost请求
 *
 *  @param url     访问地址
 *  @param parameters    封装请求参数的字典对象
 *  @param comlete 请求顺利完成
 *  @param problem 请求异常
 *  @param error   错误请求
 */
-(void)doPost:(NSString *)url
  andPostData:(NSDictionary *)parameters
  andComplete:(rquestCompleteBlock) comlete
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
