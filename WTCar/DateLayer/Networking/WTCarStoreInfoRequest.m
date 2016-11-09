//
//  WTCarStoreInfoRequest.m
//  WTCar
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarStoreInfoRequest.h"
#import "WTCarGetStoreInfo.h"
@implementation WTCarStoreInfoRequest
-(id)initWithToken:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self = [super initWithToken:token successCallback:success failureCallback:failed];
    if (self) {
    
//        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"getStoreInfo.do";
}

-(NSString *)getMethod{
    return @"GET";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCarGetStoreInfo *storeInfo = [[WTCarGetStoreInfo alloc]init];
            storeInfo.merchantAddress = data[@"merchantAddress"];
            storeInfo.merchantDescr = data[@"merchantDescr"];
            storeInfo.merchantImagePath = data[@"merchantImagePath"];
            storeInfo.merchantName = data[@"merchantName"];
            storeInfo.mobile = data[@"mobile"];
            storeInfo.nick = data[@"nick"];
            [self getResponse].data=storeInfo;
        }
    }
}

@end
