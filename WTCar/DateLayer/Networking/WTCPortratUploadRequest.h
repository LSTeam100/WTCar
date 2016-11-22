//
//  WTCPortratUploadRequest.h
//  WTCar
//
//  Created by apple on 2016/11/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TFFileUploadManager.h"

@interface WTCPortratUploadRequest : TFFileUploadManager
//-(void)WTCUploadFileWith:(NSDictionary *)params fileKey:(NSString *)fileKey filePath:(NSString *)filePath SuccessCallbackBlock:(void (^)(NSData *, NSURLResponse *))successBlock FailCallbackBlock:(void (^)(NSError *, NSURLResponse *))failBlock;
-(void)WTCPortraitUploadFileWithToken:(NSString *)token params:(NSDictionary *)params fileKey:(NSString *)fileKey filePath:(NSString *)filePath SuccessCallbackBlock:(void (^)(NSData *, NSURLResponse *))successBlock FailCallbackBlock:(void (^)(NSError *, NSURLResponse *))failBlock;

@end
