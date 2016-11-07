//
//  UPMImageHelper.m
//  UPMeilin
//
//  Created by 曾宏亮 on 15/7/26.
//  Copyright (c) 2015年 duanran. All rights reserved.
//

#import "UPMImageHelper.h"

@implementation UPMImageHelper

static const NSUInteger MAX_SIZE=1024*200ul;

// 计算适合的大小。并保留其原始图片大小
+ (CGSize) fitSize: (CGSize)thisSize inSize: (CGSize) aSize
{
    CGFloat scale;
    CGSize newsize = thisSize;
    
    if (newsize.height && (newsize.height > aSize.height))
    {
        scale = aSize.height / newsize.height;
        newsize.width *= scale;
        newsize.height *= scale;
    }
    
    if (newsize.width && (newsize.width >= aSize.width))
    {
        scale = aSize.width / newsize.width;
        newsize.width *= scale;
        newsize.height *= scale;
    }
    
    return newsize;
}

// 返回调整的缩略图
+ (UIImage *)image: (UIImage *)image fitInSize: (CGSize)viewsize
{
    // calculate the fitted size
    CGSize size = [UPMImageHelper fitSize:image.size inSize:viewsize];
    
    UIGraphicsBeginImageContext(viewsize);
    
    float dwidth = (viewsize.width - size.width) / 2.0f;
    float dheight = (viewsize.height - size.height) / 2.0f;
    
    CGRect rect = CGRectMake(dwidth, dheight, size.width, size.height);
    [image drawInRect:rect];
    
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newimg;
}

// 返回居中的缩略图
+ (UIImage *)image: (UIImage *)image centerInSize: (CGSize)viewsize
{
    CGSize size = image.size;
    
    UIGraphicsBeginImageContext(viewsize);
    float dwidth = (viewsize.width - size.width) / 2.0f;
    float dheight = (viewsize.height - size.height) / 2.0f;
    
    CGRect rect = CGRectMake(dwidth, dheight, size.width, size.height);
    [image drawInRect:rect];
    
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newimg;
}

// 返回填充的缩略图
+ (UIImage *)image: (UIImage *)image fillSize: (CGSize)viewsize
{
    CGSize size = image.size;
    
    CGFloat scalex = viewsize.width / size.width;
    CGFloat scaley = viewsize.height / size.height;
    CGFloat scale = MAX(scalex, scaley);
    
    UIGraphicsBeginImageContext(viewsize);
    
    CGFloat width = size.width * scale;
    CGFloat height = size.height * scale;
    
    float dwidth = ((viewsize.width - width) / 2.0f);
    float dheight = ((viewsize.height - height) / 2.0f);
    
    CGRect rect = CGRectMake(dwidth, dheight, size.width * scale, size.height * scale);
    [image drawInRect:rect];
    
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newimg;
}

+ (UIImage *)compressImageWithImage:(UIImage*)image{
    NSData* data= UIImageJPEGRepresentation(image, 1.0);
//    NSLog(@"image size:%lul", (unsigned long)data.length);
    if(data.length>MAX_SIZE){
        CGSize originalSize= image.size;
        if(originalSize.width==originalSize.height){
            return [self image:image fitInSize:CGSizeMake(720.0, 720.0)];
        }else{
            CGSize newSize=[self fitSize:originalSize inSize:CGSizeMake(960.0, 720.0)];
            return [self image:image fitInSize:newSize];
        }
        
        //return [self image:image fitInSize:CGSizeMake(960.0, 720.0)];
    }
    return image;
};

+ (NSString *)saveImageToCacheFile: (UIImage *)image
{
    if (image == nil)
        return @"";
    
    NSData *data = UIImageJPEGRepresentation(image, 1.0);
    
    //NSString *path = [NQEtc assetsCachePath];
    NSString *path=@"";
    NSString *fileName = [[[NSUUID UUID] UUIDString] stringByAppendingString: @".jpg"];
    NSString *filePath = [path stringByAppendingPathComponent: fileName];
    [data writeToFile: filePath atomically: YES];
    return filePath;
}

+ (UIImage *)fixImageOrientation:(UIImage*)image{
    if(image.imageOrientation==UIImageOrientationUp)
        return image;
    
    CGAffineTransform transform=CGAffineTransformIdentity;
    switch (image.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform=CGAffineTransformTranslate(transform, image.size.width, image.size.height);
            transform=CGAffineTransformRotate(transform, M_PI);
            break;
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform=CGAffineTransformTranslate(transform, image.size.width, 0);
            transform=CGAffineTransformRotate(transform, M_PI_2);
            break;
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform=CGAffineTransformTranslate(transform, 0, image.size.height);
            transform=CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (image.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform=CGAffineTransformTranslate(transform, image.size.width,0);
            transform=CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform=CGAffineTransformTranslate(transform, image.size.height, 0);
            transform=CGAffineTransformScale(transform, -1, 1);
        default:
            break;
    }
    
    CGContextRef context=CGBitmapContextCreate(NULL, image.size.width, image.size.height, CGImageGetBitsPerComponent(image.CGImage), 0, CGImageGetColorSpace(image.CGImage), CGImageGetBitmapInfo(image.CGImage));
    CGContextConcatCTM(context, transform);
    switch (image.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            CGContextDrawImage(context, CGRectMake(0, 0, image.size.height, image.size.width), image.CGImage);
            break;
        default:
            CGContextDrawImage(context, CGRectMake(0,0, image.size.width, image.size.height), image.CGImage);
            break;
    }
    
    CGImageRef newImagRef=CGBitmapContextCreateImage(context);
    UIImage* newImage=[UIImage imageWithCGImage:newImagRef];
    CGContextRelease(context);
    CGImageRelease(newImagRef);
    return newImage;
}


@end
