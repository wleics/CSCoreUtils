//
//  CSCoreUtils.h
//  Pods
//
//  Created by wlei on 2017/5/1.
//
//

#import "CSHttpUtils.h"
#import "HttpRequestBase.h"
#import "CSTools.h"
#import "CSHUDUtils.h"
#import "CSImageUtils.h"
#import "UIView+CSViewExtension.h"

#ifdef DEBUG
#   define CSLog(...) NSLog(__VA_ARGS__)
#else
#   define CSLog(...)
#endif

/** 获取颜色 */
#define CSRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

/** 获取颜色(带alpha值) */
#define CSRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
