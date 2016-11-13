//
//  WTCImageUploadRequest.m
//  WTCar
//
//  Created by apple on 2016/11/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCImageUploadRequest.h"

@implementation WTCImageUploadRequest
-(void)imageUpload:(NSString *)photoName ImageUrl:(NSString *)imageUrl ImageData:(NSData *)imageData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:imageUrl parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:imageData
                                    name:@"files"
                                fileName:photoName mimeType:@"image/jpeg"];
        
//        [formData appendPartWithFormData:[key1 dataUsingEncoding:NSUTF8StringEncoding]
//                                    name:@"key1"];
//        
//        [formData appendPartWithFormData:[key2 dataUsingEncoding:NSUTF8StringEncoding]
//                                    name:@"key2"];
    } progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"Response: %@", responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
@end
