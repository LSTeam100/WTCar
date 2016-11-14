//
//  WTCProfileImageUploadRequest.h
//  WTCar
//
//  Created by apple on 2016/11/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TFFileUploadManager.h"

@interface WTCProfileImageUploadRequest : TFFileUploadManager
-(void)WTCUploadFileWith:(NSDictionary *)params fileKey:(NSString *)fileKey filePath:(NSString *)filePath SuccessCallbackBlock:(void (^)(NSData *, NSURLResponse *))successBlock FailCallbackBlock:(void (^)(NSError *, NSURLResponse *))failBlock;
@property(nonatomic,strong)NSString *requestImgPath;
@end
