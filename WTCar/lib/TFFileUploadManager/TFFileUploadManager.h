//
//  TFFileUploadManager.h
//  UploadFileTest
//
//  Created by shiwei on 16/2/21.
//  Copyright © 2016年 shiwei. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TFFileUploadManager : NSObject<NSURLConnectionDataDelegate>
{
    void (^SuccessCallbackBlock)(NSData *,NSURLResponse *);
    void (^FailCallbackBlock)(NSError *,NSURLResponse *);
    NSMutableData *resultData;
    NSMutableURLRequest *request;
    NSOperationQueue *queue;
    NSURLConnection *_connection;
    NSMutableData *_reveivedData;

}

+(instancetype)shareInstance;

@property(nonatomic,strong) void (^SuccessCallbackBlock)(NSData *,NSURLResponse *);
@property(nonatomic,strong) void (^FailCallbackBlock)(NSError *,NSURLResponse *);


@property(nonatomic,strong)NSURLResponse *response;

-(void)uploadFileWithURL:(NSString*)urlString params:(NSDictionary*)params fileKey:(NSString*)fileKey filePath:(NSString*)filePath completeHander:(void(^)(NSURLResponse *response, NSData *data, NSError *connectionError))completeHander;

-(void)WTCUploadFileWithURL:(NSString *)urlString params:(NSDictionary *)params fileKey:(NSString *)fileKey filePath:(NSString *)filePath SuccessCallbackBlock:(void (^)(NSData *,NSURLResponse *))successBlock FailCallbackBlock:(void(^)(NSError *,NSURLResponse *))failBlock;

@end
