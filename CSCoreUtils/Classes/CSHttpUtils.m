//
//  CSHttpUtils.m
//  CloverStudioNetWorkLibs
//  网络操作工具类
//  Created by wlei on 2017/4/30.
//  Copyright © 2017年 cloverstudio.app. All rights reserved.
//

#import "CSHttpUtils.h"
#import "ZWAFNetWorkHttpUtils.h"

@interface CSHttpUtils()


@property (nonatomic,strong) ZWAFNetWorkHttpUtils *zwAFNetWorkHttpUtils;

@property (nonatomic,assign) BOOL canceled;


@end

@implementation CSHttpUtils

+(instancetype)httpUtils{
    CSHttpUtils *utils=[CSHttpUtils new];
    return utils;
}

-(void)dealloc{
    NSLog(@"ZWHttpUtils 被销毁了！");
}

-(void)doPost:(NSString *)url
  andPostData:(NSDictionary *)parameters
  andComplete:(rquestCompleteBlock) complete
     andError:(requstErrorBlock)error{
    
    [self.zwAFNetWorkHttpUtils doPost:url
                          andPostData:parameters
                          andComplete:complete
                           andProblem:nil
                             andError:error];
}

-(void)doPost:(NSString *)url andPostData:(NSDictionary *)parameters andComplete:(rquestCompleteBlock)complete andProblem:(requstProblemBlock)problem andError:(requstErrorBlock)requestError{
    
    [self.zwAFNetWorkHttpUtils doPost:url
                          andPostData:parameters
                          andComplete:complete
                           andProblem:problem
                             andError:requestError];
}


-(void)cancelHttpRequest{
    _canceled=YES;
    
    if (_zwAFNetWorkHttpUtils) {
        [_zwAFNetWorkHttpUtils cancelHttpRequest];
    }
}

-(void)activationHttpRequest{
    _canceled=NO;
    if (_zwAFNetWorkHttpUtils) {
        [_zwAFNetWorkHttpUtils activationHttpRequest];
    }
    
}


-(ZWAFNetWorkHttpUtils *)zwAFNetWorkHttpUtils{
    if (_canceled) {
        return nil;
    }
    if (_zwAFNetWorkHttpUtils==nil) {
        _zwAFNetWorkHttpUtils=[ZWAFNetWorkHttpUtils new];
    }
    return _zwAFNetWorkHttpUtils;
}

@end
