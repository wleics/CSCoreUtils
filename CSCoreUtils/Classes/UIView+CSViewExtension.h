//
//  UIView+CSViewExtension.h
//  Pods
//  UIView的扩展
//  Created by wlei on 2017/5/3.
//
//

#import <UIKit/UIKit.h>

@interface UIView (CSViewExtension)

@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

/**
 *  隐藏自己
 *
 *  @param animated
 */
-(void)hiddenSelf:(BOOL)animated;

/**
 *  显示自己
 *
 *  @param animated
 */
-(void)showSelf:(BOOL)animated;

@end
