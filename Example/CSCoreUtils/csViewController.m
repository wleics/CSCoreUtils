//
//  csViewController.m
//  CSCoreUtils
//
//  Created by wleics on 05/01/2017.
//  Copyright (c) 2017 wleics. All rights reserved.
//

#import "csViewController.h"
#import <CSCoreUtils/CSCoreUtils.h>


@interface csViewController ()

@property (nonatomic,strong) CSHUDUtils *hudUtils;

@end

@implementation csViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"网络请求操作演示";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (IBAction)executeHttpOperate:(id)sender {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"3a1c1915168746518f37d03ee2e3c496" forKey:@"create_by"];
    [dict setObject:@"2fd0bc5263044357a3dacd969665032a" forKey:@"id"];
    
    NSString *data = [CSTools objToJsonString:dict];
    CSLog(@"data:%@",data);
    NSDictionary *params = @{@"data":data};
    
    CSHttpUtils *httpUtils = [CSHttpUtils httpUtils];
    [httpUtils doPost:@"http://www.newsfans.cn:8000/web/rest/article/view"
          andPostData:params
          andComplete:^(NSDictionary *dict) {
              
              NSString *json = [CSTools objToJsonString:dict];
              CSLog(@"json:%@",json);
              [self.hudUtils showSuccessWithStatusInHUD:@"网络请求成功！"];
          }
             andError:^(NSError *error) {
                 CSLog(@"error:%@",error);
                 [self.hudUtils showErrorMsgInHUD:[error description]];
             }];

}

-(CSHUDUtils *)hudUtils{
    if (!_hudUtils) {
        _hudUtils = [[CSHUDUtils alloc] init];
    }
    return _hudUtils;
}

@end
