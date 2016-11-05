//
//  UPMImageHelper.h
//  UPMeilin
//
//  Created by 曾宏亮 on 15/7/26.
//  Copyright (c) 2015年 duanran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UPMImageHelper : NSObject



+(UIImage *)image:(UIImage *)image fitInSize:(CGSize)viewsize;
+(UIImage *)image:(UIImage *)image centerInSize:(CGSize)viewSize;
+(UIImage *)image:(UIImage *)image fillSize:(CGSize)viewsize;
+(NSString *)saveImageToCacheFile:(UIImage *)image;
+(UIImage *)compressImageWithImage:(UIImage*)image;
+(UIImage *)fixImageOrientation:(UIImage*)image;

@end
