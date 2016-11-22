//
//  WTCPortratUploadRequest.m
//  WTCar
//
//  Created by apple on 2016/11/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCPortratUploadRequest.h"
#import "WTCarBaseRequest.h"
@implementation WTCPortratUploadRequest
-(void)WTCPortraitUploadFileWithToken:(NSString *)token params:(NSDictionary *)params fileKey:(NSString *)fileKey filePath:(NSString *)filePath SuccessCallbackBlock:(void (^)(NSData *, NSURLResponse *))successBlock FailCallbackBlock:(void (^)(NSError *, NSURLResponse *))failBlock
{
    NSString* url=[BaseAddress stringByAppendingString:@"/uploadPortrait.do"];
    [super WTCPortraitUploadFileWithToken:token Url:url params:params fileKey:fileKey filePath:filePath SuccessCallbackBlock:successBlock FailCallbackBlock:failBlock];

}
-(void)WTCUploadFileWith:(NSDictionary *)params fileKey:(NSString *)fileKey filePath:(NSString *)filePath SuccessCallbackBlock:(void (^)(NSData *, NSURLResponse *))successBlock FailCallbackBlock:(void (^)(NSError *, NSURLResponse *))failBlock
{
    NSString* url=[BaseAddress stringByAppendingString:@"/uploadPortrait.do"];
    [super WTCUploadFileWithURL:url params:params fileKey:fileKey filePath:filePath SuccessCallbackBlock:successBlock FailCallbackBlock:failBlock];
}

@end
