//
//  CSHUDUtils.h
//  Pods
//
//  Created by wlei on 2017/5/2.
//
//

#import <Foundation/Foundation.h>

@interface CSHUDUtils : NSObject

/**
 *  显示HUD
 */
-(void)showHUD;

/**
 *  显示HUD
 *
 *  @param msg 提示信息
 */
-(void)showHUDWithMsg:(NSString *)msg;

/**
 *  显示HUD(深色背景)
 *
 *  @param msg
 */
-(void)showHUDWithMsgInDark:(NSString *)msg;

/**
 *  显示HUD，并在窗口中以模态的型式展现
 *
 *  @param msg 提示信息
 */
-(void)showHUDWithMsgInModalWindow:(NSString *)msg;

/**
 *  取消HUD的显示
 */
-(void)dismissHUD;

/**
 *  使用HUD显示错误信息
 *
 *  @param msg
 */
-(void)showErrorMsgInHUD:(NSString *)msg;

/**
 *  使用深色背景的HUD显示错误信息
 *
 *  @param msg
 */
-(void)showErrorMsgInDarkBgHUD:(NSString *)msg;

/**
 *  在HUD中显示网络连接错误
 */
-(void)showNetWorkErrorMsgInHUD;

/**
 *  显示HUD，并自动关闭HUD
 */
-(void)showHUDAndAutoDismissHUD;

/**
 *  在HUD中显示成功信息
 *
 *  @param msg
 */
-(void)showSuccessWithStatusInHUD:(NSString *)msg;

/**
 *  在深色背景的HUD中显示成功信息
 *
 *  @param msg
 */
-(void)showSuccessWithStatusInDarkBgHUD:(NSString *)msg;


/**
 显示Toast

 @param msg 内容
 @param view 容器视图
 */
-(void)showToast:(NSString *)msg inView:(UIView *)view;


@end
