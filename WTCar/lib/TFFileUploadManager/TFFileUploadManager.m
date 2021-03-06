//
//  TFFileUploadManager.m
//  UploadFileTest
//
//  Created by shiwei on 16/2/21.
//  Copyright © 2016年 shiwei. All rights reserved.
//

#import "TFFileUploadManager.h"
#import <MobileCoreServices/UTType.h>

@implementation TFFileUploadManager
@synthesize FailCallbackBlock,SuccessCallbackBlock;



+(instancetype)shareInstance{
    static TFFileUploadManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[TFFileUploadManager alloc]init];
    });
    
    return manager;
}

-(void)WTCPortraitUploadFileWithToken:(NSString *)token Url:(NSString *)urlString params:(NSDictionary *)params fileKey:(NSString *)fileKey filePath:(NSString *)filePath SuccessCallbackBlock:(void (^)(NSData *,NSURLResponse *))successBlock FailCallbackBlock:(void(^)(NSError *,NSURLResponse *))failBlock{
    
    
    self.SuccessCallbackBlock = successBlock;
    self.FailCallbackBlock = failBlock;
    NSURL *URL = [[NSURL alloc]initWithString:urlString];
    request = [[NSMutableURLRequest alloc]initWithURL:URL cachePolicy:(NSURLRequestUseProtocolCachePolicy) timeoutInterval:30];
    NSString *boundary = @"wfWiEWrgEFA9A78512weF7106A";
    
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    request.HTTPMethod = @"POST";
    request.allHTTPHeaderFields = @{
                                    @"Content-Type":[NSString stringWithFormat:@"multipart/form-data; boundary=%@ ; charset=UTF-8",boundary],
                                    
                                    };
    
    //multipart/form-data格式按照构建上传数据
    NSMutableData *postData = [[NSMutableData alloc]init];
    for (NSString *key in params) {
        NSString *pair = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\"\r\n\r\n",boundary,key];
        [postData appendData:[pair dataUsingEncoding:NSUTF8StringEncoding]];
        
        id value = [params objectForKey:key];
        if ([value isKindOfClass:[NSString class]]) {
            [postData appendData:[value dataUsingEncoding:NSUTF8StringEncoding]];
        }else if ([value isKindOfClass:[NSData class]]){
            [postData appendData:value];
        }
        [postData appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    //文件部分
    NSString *filename = [filePath lastPathComponent];
    
    NSString *filePair = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",boundary,fileKey,filename];
    
    [postData appendData:[filePair dataUsingEncoding:NSUTF8StringEncoding]];
    
    [postData appendData:[@"Content-Type=multipart/form-data\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [postData appendData:[@"Content-Transfer-Encoding=binary\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    //[postData appendData:[@"测试文件数据" dataUsingEncoding:NSUTF8StringEncoding]];
    [postData appendData:fileData]; //加入文件的数据
    
    [postData appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    request.HTTPBody = postData;
    //    NSString *lastPair = [NSString stringWithFormat:@"--%@",boundary];
    
    //    [postData appendData:[lastPair dataUsingEncoding:NSUTF8StringEncoding]]; //加入文件的数据
    
    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)postData.length] forHTTPHeaderField:@"Content-Length"];
//  NSDictionary * headers=@{@"token":token};
//    [request setAllHTTPHeaderFields:headers];
    [request setValue:token forHTTPHeaderField:@"token"];
    
    _connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    [_connection start];
}


-(void)WTCUploadFileWithURL:(NSString *)urlString params:(NSDictionary *)params fileKey:(NSString *)fileKey filePath:(NSString *)filePath SuccessCallbackBlock:(void (^)(NSData *,NSURLResponse *))successBlock FailCallbackBlock:(void(^)(NSError *,NSURLResponse *))failBlock{
    
    
    self.SuccessCallbackBlock = successBlock;
    self.FailCallbackBlock = failBlock;
    NSURL *URL = [[NSURL alloc]initWithString:urlString];
    request = [[NSMutableURLRequest alloc]initWithURL:URL cachePolicy:(NSURLRequestUseProtocolCachePolicy) timeoutInterval:30];
    NSString *boundary = @"wfWiEWrgEFA9A78512weF7106A";
    
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    request.HTTPMethod = @"POST";
    request.allHTTPHeaderFields = @{
                                    @"Content-Type":[NSString stringWithFormat:@"multipart/form-data; boundary=%@ ; charset=UTF-8",boundary],
                                    
                                    };
    
    //multipart/form-data格式按照构建上传数据
    NSMutableData *postData = [[NSMutableData alloc]init];
    for (NSString *key in params) {
        NSString *pair = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\"\r\n\r\n",boundary,key];
        [postData appendData:[pair dataUsingEncoding:NSUTF8StringEncoding]];
        
        id value = [params objectForKey:key];
        if ([value isKindOfClass:[NSString class]]) {
            [postData appendData:[value dataUsingEncoding:NSUTF8StringEncoding]];
        }else if ([value isKindOfClass:[NSData class]]){
            [postData appendData:value];
        }
        [postData appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    //文件部分
    NSString *filename = [filePath lastPathComponent];
    
    NSString *filePair = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",boundary,fileKey,filename];
    
    [postData appendData:[filePair dataUsingEncoding:NSUTF8StringEncoding]];
    
    [postData appendData:[@"Content-Type=multipart/form-data\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [postData appendData:[@"Content-Transfer-Encoding=binary\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    //[postData appendData:[@"测试文件数据" dataUsingEncoding:NSUTF8StringEncoding]];
    [postData appendData:fileData]; //加入文件的数据
    
    [postData appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    request.HTTPBody = postData;
    //    NSString *lastPair = [NSString stringWithFormat:@"--%@",boundary];
    
    //    [postData appendData:[lastPair dataUsingEncoding:NSUTF8StringEncoding]]; //加入文件的数据
    
    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)postData.length] forHTTPHeaderField:@"Content-Length"];
    
    _connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    [_connection start];
}


-(void)uploadFileWithURL:(NSString *)urlString params:(NSDictionary *)params fileKey:(NSString *)fileKey filePath:(NSString *)filePath completeHander:(void (^)(NSURLResponse *, NSData *, NSError *))completeHander{
    

    
    NSURL *URL = [[NSURL alloc]initWithString:urlString];
    request = [[NSMutableURLRequest alloc]initWithURL:URL cachePolicy:(NSURLRequestUseProtocolCachePolicy) timeoutInterval:30];
    NSString *boundary = @"wfWiEWrgEFA9A78512weF7106A";
    
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    request.HTTPMethod = @"POST";
    request.allHTTPHeaderFields = @{
                                    @"Content-Type":[NSString stringWithFormat:@"multipart/form-data; boundary=%@ ; charset=UTF-8",boundary],
                                    
                                    };
    
    //multipart/form-data格式按照构建上传数据
    NSMutableData *postData = [[NSMutableData alloc]init];
    for (NSString *key in params) {
        NSString *pair = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\"\r\n\r\n",boundary,key];
        [postData appendData:[pair dataUsingEncoding:NSUTF8StringEncoding]];
        
        id value = [params objectForKey:key];
        if ([value isKindOfClass:[NSString class]]) {
            [postData appendData:[value dataUsingEncoding:NSUTF8StringEncoding]];
        }else if ([value isKindOfClass:[NSData class]]){
            [postData appendData:value];
        }
        [postData appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    //文件部分
    NSString *filename = [filePath lastPathComponent];
        
    NSString *filePair = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",boundary,fileKey,filename];
    
    [postData appendData:[filePair dataUsingEncoding:NSUTF8StringEncoding]];
    
    [postData appendData:[@"Content-Type=multipart/form-data\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [postData appendData:[@"Content-Transfer-Encoding=binary\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];

    
    //[postData appendData:[@"测试文件数据" dataUsingEncoding:NSUTF8StringEncoding]];
    [postData appendData:fileData]; //加入文件的数据
    
    [postData appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        request.HTTPBody = postData;
//    NSString *lastPair = [NSString stringWithFormat:@"--%@",boundary];

//    [postData appendData:[lastPair dataUsingEncoding:NSUTF8StringEncoding]]; //加入文件的数据

    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)postData.length] forHTTPHeaderField:@"Content-Length"];
    
    _connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    [_connection start];
}

#pragma mark - connection delegate

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    self.response = response;

    NSLog(@"reveive Response:\n%@",response);
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    if (!_reveivedData) {
        _reveivedData = [[NSMutableData alloc]init];
    }
    
    [_reveivedData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"received Data:\n%@",[[NSString alloc] initWithData:_reveivedData encoding:NSUTF8StringEncoding]);
    NSData *data=_reveivedData;
    if (SuccessCallbackBlock) { // 如果设置了回调的block，直接调用
        SuccessCallbackBlock(data,self.response);
    }

}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    if (FailCallbackBlock) { // 如果设置了回调的block，直接调用
        FailCallbackBlock(error,self.response);
    }

    NSLog(@"fail connect:\n%@",error);
}


static inline NSString * AFContentTypeForPathExtension(NSString *extension) {
#ifdef __UTTYPE__
    NSString *UTI = (__bridge_transfer NSString *)UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)extension, NULL);
    NSString *contentType = (__bridge_transfer NSString *)UTTypeCopyPreferredTagWithClass((__bridge CFStringRef)UTI, kUTTagClassMIMEType);
    if (!contentType) {
        return @"application/octet-stream";
    } else {
        return contentType;
    }
#else
#pragma unused (extension)
    return @"application/octet-stream";
#endif
}

@end
