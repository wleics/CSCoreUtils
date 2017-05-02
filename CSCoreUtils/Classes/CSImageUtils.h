//
//  CSImageUtils.h
//  Pods
//  图片操作封装
//  Created by wlei on 2017/5/2.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 图片加载完成后的回调
 */
typedef void (^ImageCompletionBlock)(UIImage * _Nullable image,
NSURL * url,
NSError * _Nullable error);

@interface CSImageUtils : NSObject


/**
 加载本地图片

 @param imageview 用于显示图片的imageview
 @param path 图片地址
 */
+(void)loadImageBy:(nullable UIImageView *)imageview
       andImagePath:(nullable NSString *)path;

/**
 加载网络图片

 @param imageview 用于显示网络图片的imageview
 @param imageUrl 网络图片的地址
 */
+(void)loadImageBy:(nullable UIImageView *)imageview
       andImageUrl:(nullable NSString *)imageUrl;


/**
 加载网络图片（包含占位图片）

 @param imageview 用于显示网络图片的imageview
 @param imageUrl 网络图片的地址
 @param placeholderImage 占位图片
 */
+(void)loadImageBy:(nullable UIImageView *)imageview
       andImageUrl:(nullable NSString *)imageUrl
  placeholderImage:(nullable UIImage *)placeholderImage;


/**
 加载网络图片（包含占位图片，能够设置淡入淡出的动画）

 @param imageview 用于显示网络图片的imageview
 @param imageUrl 网络图片的地址
 @param placeholderImage 占位图片
 @param animation 是否播放淡入淡出的动画
 */
+(void)loadImageBy:(nullable UIImageView *)imageview
       andImageUrl:(nullable NSString *)imageUrl
  placeholderImage:(nullable UIImage *)placeholderImage
         animation:(BOOL)animation;


/**
 加载网络图片（包含占位图片，能够设置淡入淡出的动画,支持图片加载完的代码块回调）

 @param imageview 用于显示网络图片的imageview
 @param imageUrl 网络图片的地址
 @param placeholderImage 占位图片
 @param animation 是否播放淡入淡出的动画
 @param complete 图片加载完成后的回调代码块
 */
+(void)loadImageBy:(nullable UIImageView *)imageview
       andImageUrl:(nullable NSString *)imageUrl
  placeholderImage:(nullable UIImage *)placeholderImage
         animation:(BOOL)animation
          complete:(ImageCompletionBlock)complete;

/**
 获取图片在内存中的缓存大小

 @return
 */
+(NSUInteger)cacheCostInMomory;

/**
 获取图片在内存中的缓存文件个数

 @return
 */
+(NSUInteger)cacheCountInMomory;

/**
 获取图片在硬盘中的缓存大小
 
 @return
 */
+(NSUInteger)cacheCostInDisk;

/**
 获取图片在硬盘中的缓存文件个数
 
 @return
 */
+(NSUInteger)cacheCountInDisk;


/**
 获取硬盘，内存中的缓存大小

 @return
 */
+(NSUInteger)cacheCostInMomoryAndDisk;

/**
 获取硬盘，内存中缓存的文件的大小

 @return
 */
+(NSUInteger)cacheCountInMomoryAndDisk;


/**
 按照键值对的型式缓存图片

 @param image 待缓存的图片
 @param key key
 */
+(void)cacheImage:(nullable UIImage *)image forKey:(nullable NSString *)key;


/**
 按照键值对，获取被缓存的图片

 @param key key
 @return
 */
+(nullable UIImage *)getCacheImageForKey:(nullable NSString *)key;


/**
 按照键值对，移除被缓存的图片

 @param key
 */
+(void)removeCacheImageForKey:(nullable NSString *)key;


/**
 清除内存中的图片缓存
 */
+(void)clearCacheInMemory;

/**
 清除硬盘中的图片缓存
 */
+(void)clearCacheInDisk;

/**
 清除图片缓存（内存，硬盘）
 */
+(void)clearCacheInMemoryAndDisk;




@end
