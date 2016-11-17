//
//  WTCarBaseRequest.h
//  WTCar
//
//  Created by apple on 2016/10/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WTCarResponse.h"

static NSString * const BaseAddress = @"http://carsok.utonw.com/carsokApi";

@interface WTCarBaseRequest : NSObject
typedef void(^onSuccessCallback)(WTCarBaseRequest* request);
typedef void(^onFailureCallback)(WTCarBaseRequest* request);

-(id)initWithSuccessCallback: (onSuccessCallback)success failureCallback:(onFailureCallback) failed;

-(id)initWithToken:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
-(void)imageUpload:(NSString *)token PhotoName:(NSString *)photoName ImageUrl:(NSString *)imageUrl ImageData:(NSData *)imageData Success:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;

-(NSString*)getMethod;

-(NSString*)getURL;

-(void)processResponse:(NSDictionary *)responseDictionary;

-(void)setParameters:(NSDictionary *)parameters;

-(WTCarResponse *)getResponse;

-(void)start;

-(void)updateToken:(NSString *)token;
-(onFailureCallback)failCallback;


@end
