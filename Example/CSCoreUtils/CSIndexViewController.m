//
//  CSIndexViewController.m
//  CSCoreUtils
//
//  Created by wlei on 2017/5/2.
//  Copyright © 2017年 wleics. All rights reserved.
//

#import "CSIndexViewController.h"
#import <CSCoreUtils/CSCoreUtils.h>

@interface CSIndexViewController ()

/// 通过键值对缓存的图片
@property (weak, nonatomic) IBOutlet UIImageView *mKVcacheImage;

@end

@implementation CSIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"核心framework-Demo";
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIImage *image =  [CSImageUtils getCacheImageForKey:@"mImage"];
    if (image) {
        _mKVcacheImage.image = image;
    }else{
        _mKVcacheImage.image = nil;
    }
}

- (IBAction)showHttpDemoPage:(id)sender {
    
    [self sendToPageByIdentifier:@"httpDemo"];
}

- (IBAction)showHUDDemoPage:(id)sender {
    
    [self sendToPageByIdentifier:@"hudDemo"];
}

- (IBAction)showImageLoaderDemoPage:(id)sender {
    
    [self sendToPageByIdentifier:@"imageLoaderDemo"];
}

- (IBAction)showUIViewExtensionDemoPage:(id)sender {
    
    [self sendToPageByIdentifier:@"viewExtensionDemo"];
}

-(void)sendToPageByIdentifier:(NSString *)identifier{
    if (identifier) {
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
        if (vc) {
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

@end
