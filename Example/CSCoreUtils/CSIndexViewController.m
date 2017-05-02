//
//  CSIndexViewController.m
//  CSCoreUtils
//
//  Created by wlei on 2017/5/2.
//  Copyright © 2017年 wleics. All rights reserved.
//

#import "CSIndexViewController.h"
#import "csViewController.h"
#import "CSHUDDemoViewController.h"

@interface CSIndexViewController ()

@end

@implementation CSIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"核心framework-Demo";
    
}



- (IBAction)showHttpDemoPage:(id)sender {
    csViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"httpDemo"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)showHUDDemoPage:(id)sender {
    CSHUDDemoViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"hudDemo"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
