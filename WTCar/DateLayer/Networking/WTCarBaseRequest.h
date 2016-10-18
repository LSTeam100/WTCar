//
//  WTCarBaseRequest.h
//  WTCar
//
//  Created by apple on 2016/10/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSString * const BaseAddress = @"http://api.umeilin.com";

@interface WTCarBaseRequest : NSObject
typedef void(^onSuccessCallback)(WTCarBaseRequest* request);
typedef void(^onFailureCallback)(WTCarBaseRequest* request);

-(id)initWithSuccessCallback: (onSuccessCallback)success failureCallback:(onFailureCallback) failed;

-(id)initWithSessionId:(NSString *)sessionId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;

-(NSString*)getMethod;

-(NSString*)getURL;

-(void)processResponse:(NSDictionary *)responseDictionary;

-(void)setParameters:(NSDictionary *)parameters;

//-(UPMResponse *)getResponse;

-(void)start;

-(void)updateSessionId:(NSString *)sessionId;

-(onFailureCallback)failCallback;


@end
