//
//  CSViewExtensionDemoViewController.m
//  CSCoreUtils
//
//  Created by wlei on 2017/5/3.
//  Copyright © 2017年 wleics. All rights reserved.
//

#import "CSViewExtensionDemoViewController.h"
#import <CSCoreUtils/CSCoreUtils.h>

@interface CSViewExtensionDemoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *mImageView;
@property (weak, nonatomic) IBOutlet UILabel *mLabel;

@end

@implementation CSViewExtensionDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UIView扩展操作Demo";
    [self getViewInfo];
}

- (IBAction)buttonOnClick:(id)sender {
    UIView *view = sender;
    switch (view.tag) {
        case 0:
            [self updateViewWidth];
            break;
        case 1:
            [self updateViewHeight];
            break;
        case 2:
            [self updateViewX];
            break;
        case 3:
            [self updateViewY];
            break;
        case 4:
            [self getViewInfo];
            break;
        case 5:
            [self hiddenSelf];
            break;
        case 6:
            [self showSelf];
            break;
            
        default:
            break;
    }
}

-(void)updateViewWidth{
   CGFloat width = _mImageView.width;
    width+= 5;
    _mImageView.width = width;
    
}

-(void)updateViewHeight{
    CGFloat height = _mImageView.height;
    height+= 5;
    _mImageView.height = height;
}

-(void)updateViewX{
    CGFloat x = _mImageView.x;
    x+=5;
    _mImageView.x = x;
}

-(void)updateViewY{
    CGFloat y = _mImageView.y;
    y+=5;
    _mImageView.y = y;
}

-(void)getViewInfo{
    CGFloat width = _mImageView.width;
    CGFloat height = _mImageView.height;
    CGFloat x = _mImageView.x;
    CGFloat y = _mImageView.y;
    NSString *str = [NSString stringWithFormat:@"图片信息:\n宽度:%f,高度:%f\nx:%f,y:%f",width,height,x,y];
    _mLabel.text = str;
}

-(void)hiddenSelf{
    [_mImageView hiddenSelf:YES];
}

-(void)showSelf{
    [_mImageView showSelf:YES];
}

@end
