//
//  CSImageUtils.m
//  Pods
//
//  Created by wlei on 2017/5/2.
//
//

#import "CSImageUtils.h"
#import <YYWebImage/YYWebImage.h>
#import <pop/POP.h>


@implementation CSImageUtils

/**
 加载本地图片
 
 @param imageview 用于显示图片的imageview
 @param path 图片地址
 */
+(void)loadImageBy:(nullable UIImageView *)imageview
      andImagePath:(nullable NSString *)path{
    if (imageview && path) {
        imageview.yy_imageURL = [NSURL fileURLWithPath:path];
    }
}

/**
 加载网络图片
 
 @param imageview 用于显示网络图片的imageview
 @param imageUrl 网络图片的地址
 */
+(void)loadImageBy:(nullable UIImageView *)imageview
       andImageUrl:(nullable NSString *)imageUrl{
    [CSImageUtils loadImageBy:imageview andImageUrl:imageUrl placeholderImage:nil];
}


/**
 加载网络图片（包含占位图片）
 
 @param imageview 用于显示网络图片的imageview
 @param imageUrl 网络图片的地址
 @param placeholderImage 占位图片
 */
+(void)loadImageBy:(nullable UIImageView *)imageview
       andImageUrl:(nullable NSString *)imageUrl
  placeholderImage:(nullable UIImage *)placeholderImage{
    [CSImageUtils loadImageBy:imageview andImageUrl:imageUrl placeholderImage:placeholderImage animation:NO];
}


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
         animation:(BOOL)animation{
    [self loadImageBy:imageview andImageUrl:imageUrl placeholderImage:placeholderImage animation:animation complete:nil];
}

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
          complete:(imageCompletionBlock _Nullable )complete{
    if (imageview && imageUrl) {
        [imageview yy_setImageWithURL:[NSURL URLWithString:[imageUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]
                          placeholder:placeholderImage
                              options:YYWebImageOptionAllowBackgroundTask
                             progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                 if (!animation) {
                                     return ;
                                 }
                                 CGFloat progress = 1.0*receivedSize/expectedSize;
                                 //当图片记载完成后，播放一段渐变动画
                                 if (progress==1.0) {
                                     POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
                                     anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                                     anim.duration=0.45;
                                     anim.fromValue = @(0.0);
                                     anim.toValue = @(1.0);
                                     [imageview pop_addAnimation:anim forKey:@"fade"];
                                 }
                             }
                            transform:nil
                           completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
                               if (error) {
                                   dispatch_async(dispatch_get_global_queue(0, 0), ^{
                                       NSData *data = [NSData dataWithContentsOfURL:url];
                                       if (data) {
                                           dispatch_sync(dispatch_get_main_queue(), ^{
                                               imageview.image = [UIImage imageWithData:data];
                                           });
                                       }
                                   });
                               }
                               if (complete) {
                                   complete(image,url,error);
                               }
                           }];
    }
}


/**
 获取图片在内存中的缓存大小
 
 @return
 */
+(NSUInteger)cacheCostInMomory{
    YYImageCache *cache = [YYWebImageManager sharedManager].cache;
    return cache.memoryCache.totalCost;
}

/**
 获取图片在内存中的缓存文件个数
 
 @return
 */
+(NSUInteger)cacheCountInMomory{
    YYImageCache *cache = [YYWebImageManager sharedManager].cache;
    return cache.memoryCache.totalCount;
}

/**
 获取图片在硬盘中的缓存大小
 
 @return
 */
+(NSUInteger)cacheCostInDisk{
    YYImageCache *cache = [YYWebImageManager sharedManager].cache;
    return cache.diskCache.totalCost;
}

/**
 获取图片在硬盘中的缓存文件个数
 
 @return
 */
+(NSUInteger)cacheCountInDisk{
    YYImageCache *cache = [YYWebImageManager sharedManager].cache;
    return cache.diskCache.totalCount;
}


/**
 获取硬盘，内存中的缓存大小
 
 @return
 */
+(NSUInteger)cacheCostInMomoryAndDisk{
    YYImageCache *cache = [YYWebImageManager sharedManager].cache;
    NSUInteger totalCost = cache.memoryCache.totalCost + cache.diskCache.totalCost;
    return totalCost;
}

/**
 获取硬盘，内存中缓存的文件的大小
 
 @return
 */
+(NSUInteger)cacheCountInMomoryAndDisk{
    YYImageCache *cache = [YYWebImageManager sharedManager].cache;
    NSUInteger totalCount = cache.memoryCache.totalCount + cache.diskCache.totalCount;
    return totalCount;
}


/**
 按照键值对的型式缓存图片
 
 @param image 待缓存的图片
 @param key key
 */
+(void)cacheImage:(nullable UIImage *)image forKey:(nullable NSString *)key{
    if (image && key) {
        YYImageCache *cache = [YYWebImageManager sharedManager].cache;
        [cache setImage:image forKey:key];
    }

}


/**
 按照键值对，获取被缓存的图片
 
 @param key key
 @return
 */
+(nullable UIImage *)getCacheImageForKey:(nullable NSString *)key{
    if (key) {
        YYImageCache *cache = [YYWebImageManager sharedManager].cache;
        return [cache getImageForKey:key];
    }
    return nil;
}


/**
 按照键值对，移除被缓存的图片
 
 @param key
 */
+(void)removeCacheImageForKey:(nullable NSString *)key{
    if (key) {
        YYImageCache *cache = [YYWebImageManager sharedManager].cache;
        [cache removeImageForKey:key];
    }
}


/**
 清除内存中的图片缓存
 */
+(void)clearCacheInMemory{
    YYImageCache *cache = [YYWebImageManager sharedManager].cache;
    [cache.memoryCache removeAllObjects];
}

/**
 清除硬盘中的图片缓存
 */
+(void)clearCacheInDisk{
    YYImageCache *cache = [YYWebImageManager sharedManager].cache;
    [cache.diskCache removeAllObjects];
}

/**
 清除图片缓存（内存，硬盘）
 */
+(void)clearCacheInMemoryAndDisk{
    YYImageCache *cache = [YYWebImageManager sharedManager].cache;
    [cache.memoryCache removeAllObjects];
    [cache.diskCache removeAllObjects];
}

@end
