//
//  CSHUDDemoViewController.m
//  CSCoreUtils
//
//  Created by wlei on 2017/5/2.
//  Copyright © 2017年 wleics. All rights reserved.
//

#import "CSHUDDemoViewController.h"
#import <CSCoreUtils/CSCoreUtils.h>

@interface CSHUDDemoViewController ()

@property (nonatomic,strong)CSHUDUtils *hudUtils;

@end

@implementation CSHUDDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HUD操作演示";
    
}
- (IBAction)btnOnClick:(id)sender {
    UIView *view = sender;
    switch (view.tag) {
        case 0:
            [self.hudUtils showHUD];
            break;
        case 1:
            [self.hudUtils dismissHUD];
            break;
        case 2:
            [self.hudUtils showErrorMsgInHUD:@"出错啦！"];
            break;
        case 3:
            [self.hudUtils showSuccessWithStatusInHUD:@"It is good!"];
            break;
        case 4:
            [self.hudUtils showNetWorkErrorMsgInHUD];
            break;
        case 5:
            [self.hudUtils showHUDAndAutoDismissHUD];
            break;
        case 6:
            [self.hudUtils showHUDWithMsg:@"hello brother！"];
            break;
        case 7:
            [self.hudUtils showToast:@"我是toast" inView:self.view];
            break;
        default:
            break;
    }
}

-(CSHUDUtils *)hudUtils{
    if (!_hudUtils) {
        _hudUtils = [[CSHUDUtils alloc] init];
    }
    return _hudUtils;
}


@end
