//
//  ZWAFNetWorkHttpUtils.m
//  Pods
//
//  Created by wlei on 2017/5/1.
//
//

#import "ZWAFNetWorkHttpUtils.h"

#import "ZWAFNetWorkHttpUtils.h"
#import <AFNetworking/AFNetworking.h>
#import "HttpRequestBase.h"
#import <MJExtension/MJExtension.h>


@interface ZWAFNetWorkHttpUtils()

@property (nonatomic,strong) AFHTTPSessionManager *manager;
@property (nonatomic,assign) BOOL canceled;
@property (nonatomic,copy) rquestCompleteBlock completeBlock;
@property (nonatomic, copy) requstProblemBlock problemBlock;
@property (nonatomic, copy) requstErrorBlock errorBlock;

@end


@implementation ZWAFNetWorkHttpUtils

-(void)cancelHttpRequest{
    _canceled=YES;
    [self.manager.operationQueue cancelAllOperations];
}

-(void)activationHttpRequest{
    _canceled=NO;
}

-(void)doPost:(NSString *)url
  andPostData:(NSMutableDictionary *)parameters
  andComplete:(rquestCompleteBlock)comlete
   andProblem:(requstProblemBlock)problem
     andError:(requstErrorBlock)error{
    
    
    
    if (!parameters) {
        parameters = @{};
    }
    
    NSString *data = [parameters mj_JSONString];
    NSDictionary *dic = @{@"data":data};
    
    [self executeHttpRequest:url parameters:dic complete:comlete problem:problem error:error];
}


-(void)executeHttpRequest:(NSString *)url
               parameters:(NSDictionary *)parameters
                 complete:(rquestCompleteBlock) complete
                  problem:(requstProblemBlock) problem
                    error:(requstErrorBlock)error{
    NSLog(@"执行请求的url为:%@",url);
    
    //复制block
    _completeBlock = complete;
    _problemBlock = problem;
    _errorBlock = error;
    
    self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
    self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    self.manager.requestSerializer.timeoutInterval = 8;
    
    [self.manager POST:url
            parameters:parameters
              progress:nil
               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                   if (_canceled) {
                       NSLog(@"AFnetWork的网络请求被取消了！");
                       return ;
                   }
                   NSDictionary *dict = responseObject;
                   //只有在problem代码块被设置时，才会检查HttpRequestBase中的赋值
                   if (_problemBlock) {
                       NSString * resultCode= [NSString stringWithFormat:@"%@",[dict objectForKey:@"resultCode"]];
                       NSString * resultErrorMsg= [dict objectForKey:@"resultErrorMsg"];
                       HttpRequestBase* base=[[HttpRequestBase alloc] init];
                       base.resultFlag=resultCode;
                       base.resultErrorMsg=resultErrorMsg;
                       if ([base.resultFlag isEqualToString:@"1"]) {
                           //请求顺利执行完成
                           if (_completeBlock) {
                               _completeBlock(dict);
                           }
                       }else{
                           //请求出现异常
                           if (_problemBlock) {
                               _problemBlock(base);
                           }
                       }
                   }else{
                       //请求顺利执行完成
                       if (_completeBlock) {
                           _completeBlock(dict);
                       }
                   }
                   
               }
               failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                   if (_canceled) {
                       return ;
                   }
                   //请求出现错误
                   if (_errorBlock) {
                       _errorBlock(error);
                   }
                   
               }];
    
    
}

-(AFHTTPSessionManager *)manager{
    if (_manager==nil) {
        _manager=[AFHTTPSessionManager manager];
    }
    return _manager;
}

@end
