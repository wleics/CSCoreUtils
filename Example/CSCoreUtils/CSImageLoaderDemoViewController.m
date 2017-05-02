//
//  CSImageLoaderDemoViewController.m
//  CSCoreUtils
//
//  Created by wlei on 2017/5/2.
//  Copyright © 2017年 wleics. All rights reserved.
//

#import "CSImageLoaderDemoViewController.h"
#import <CSCoreUtils/CSCoreUtils.h>

@interface CSImageLoaderDemoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *mImageView;
@property (weak, nonatomic) IBOutlet UILabel *mCoastLabel;
@property (weak, nonatomic) IBOutlet UILabel *mCountLabel;

@end

@implementation CSImageLoaderDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"网络图片加载Demo";
    [self refreshCoastLabel];
    [self refreshCountLabel];
}

- (IBAction)btnOnClick:(id)sender {
    UIView *view = sender;
    switch (view.tag) {
        case 0:
            [self loadWebImage];
            break;
        case 1:
            [self clearCacheInMemoryAndDisk];
            break;
        case 2:
            [self cacheKVImage];
            break;
        case 3:
            [self clearCacheKVImage];
            break;
            
        default:
            break;
    }
}

-(void)clearCacheKVImage{
    [CSImageUtils removeCacheImageForKey:@"mImage"];
    
}

-(void)cacheKVImage{
    UIImage *image = [UIImage imageNamed:@"def_webimage.jpg"];
    if (image) {
        [CSImageUtils cacheImage:image forKey:@"mImage"];
    }
    }

-(void)clearCacheInMemoryAndDisk{
    [CSImageUtils clearCacheInMemoryAndDisk];
    [self refreshCoastLabel];
    [self refreshCountLabel];
}

-(void)loadWebImage{
    UIImage *placeholderImage = [UIImage imageNamed:@"def_webimage.jpg"];
    [CSImageUtils loadImageBy:_mImageView
                  andImageUrl:@"http://img2.3lian.com/2014/f5/61/d/7.jpg"
             placeholderImage:placeholderImage
                    animation:YES complete:^(UIImage * _Nullable image, NSURL * _Nullable url, NSError * _Nullable error) {
                        [self refreshCoastLabel];
                        [self refreshCountLabel];
                    }];
    
}

-(void)refreshCoastLabel{
    NSUInteger cost = [CSImageUtils cacheCostInMomoryAndDisk];
    _mCoastLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)cost];
}
-(void)refreshCountLabel{
    NSUInteger count = [CSImageUtils cacheCountInMomoryAndDisk];
    _mCountLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)count];
}
@end
