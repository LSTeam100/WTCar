//
//  WTCProfileImageUploadRequest.m
//  WTCar
//
//  Created by apple on 2016/11/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCProfileImageUploadRequest.h"
#import "WTCarBaseRequest.h"
@implementation WTCProfileImageUploadRequest


-(void)WTCUploadFileWith:(NSDictionary *)params fileKey:(NSString *)fileKey filePath:(NSString *)filePath SuccessCallbackBlock:(void (^)(NSData *, NSURLResponse *))successBlock FailCallbackBlock:(void (^)(NSError *, NSURLResponse *))failBlock
{
    NSString* url=[BaseAddress stringByAppendingString:@"/upload.do"];
    [super WTCUploadFileWithURL:url params:params fileKey:fileKey filePath:filePath SuccessCallbackBlock:successBlock FailCallbackBlock:failBlock];
}
@end
