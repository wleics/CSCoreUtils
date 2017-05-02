//
//  CSHUDUtils.m
//  Pods
//
//  Created by wlei on 2017/5/2.
//
//

#import "CSHUDUtils.h"
#import "SVProgressHUD.h"

@interface CSHUDUtils () {
    float progress ;
}

@end

@implementation CSHUDUtils

/**
 *  显示HUD
 */
-(void)showHUD{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD show];

}

/**
 *  显示HUD
 *
 *  @param msg 提示信息
 */
-(void)showHUDWithMsg:(NSString *)msg{
    if (msg) {
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        [SVProgressHUD showWithStatus:msg];
    }else{
        [self showHUD];
    }
}

/**
 *  显示HUD(深色背景)
 *
 *  @param msg
 */
-(void)showHUDWithMsgInDark:(NSString *)msg{
    if (msg) {
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        [SVProgressHUD showWithStatus:msg];
    }else{
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        [SVProgressHUD show];
        
    }
}

/**
 *  显示HUD，并在窗口中以模态的型式展现
 *
 *  @param msg 提示信息
 */
-(void)showHUDWithMsgInModalWindow:(NSString *)msg{
    if (msg) {
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
        [SVProgressHUD showWithStatus:msg];
    }else{
        [self showHUD];
    }
}

/**
 *  取消HUD的显示
 */
-(void)dismissHUD{
 [SVProgressHUD dismiss];
}

/**
 *  使用HUD显示错误信息
 *
 *  @param msg
 */
-(void)showErrorMsgInHUD:(NSString *)msg{
    if (msg) {
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        [SVProgressHUD showErrorWithStatus:msg];
    }
}

/**
 *  使用深色背景的HUD显示错误信息
 *
 *  @param msg
 */
-(void)showErrorMsgInDarkBgHUD:(NSString *)msg{
    if (msg) {
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        [SVProgressHUD showErrorWithStatus:msg];
    }
}

/**
 *  在HUD中显示网络连接错误
 */
-(void)showNetWorkErrorMsgInHUD{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showErrorWithStatus:@"网络连接出错，请稍后重试"];
}

/**
 *  显示HUD，并自动关闭HUD
 */
-(void)showHUDAndAutoDismissHUD{
    progress = 0.0f;
    [self showHUD];
    [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:0.1f];
}

/**
 *  在HUD中显示成功信息
 *
 *  @param msg
 */
-(void)showSuccessWithStatusInHUD:(NSString *)msg{
    if (msg) {
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        [SVProgressHUD showSuccessWithStatus:msg];
        
    }
}

/**
 *  在深色背景的HUD中显示成功信息
 *
 *  @param msg
 */
-(void)showSuccessWithStatusInDarkBgHUD:(NSString *)msg{
    if (msg) {
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        [SVProgressHUD showSuccessWithStatus:msg];
        
    }
}

- (void)increaseProgress {
    progress += 0.5f;
    
    if(progress < 1.0f){
        [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:0.3f];
    } else {
        [self performSelector:@selector(dismissHUD) withObject:nil afterDelay:0.4f];
    }
}

/**
 显示Toast
 
 @param msg 内容
 @param view 容器视图
 */
-(void)showToast:(NSString *)msg inView:(UIView *)view{
    // 1.添加标签
    UILabel *label = [[UILabel alloc] init];
    label.text = msg;
    label.font = [UIFont systemFontOfSize:13];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    label.frame = CGRectMake(0, 0, 150, 35);
    label.center = view.center;
    label.alpha = 0.0;
    label.layer.cornerRadius = 5;
    label.clipsToBounds = YES;
    [view addSubview:label];
    
    // 2.动画
    [UIView animateWithDuration:0.5 animations:^{
        label.alpha = 0.8;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
            label.alpha = 0.0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];

}

@end
