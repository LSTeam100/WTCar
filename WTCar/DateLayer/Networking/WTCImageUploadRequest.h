//
//  WTCImageUploadRequest.h
//  WTCar
//
//  Created by apple on 2016/11/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"
#import "AFNetworking.h"
@interface WTCImageUploadRequest : WTCarBaseRequest
-(void)imageUpload:(NSString *)photoName ImageUrl:(NSString *)imageUrl ImageData:(NSData *)imageData;

@end
