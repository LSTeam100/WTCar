//
//  WTCGetShopInfoRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCGetShopInfoRequest.h"
#import "WTCGetShopInfoResult.h"
@implementation WTCGetShopInfoRequest

-(id)initWithAccountToken:(NSString *)accountToken  successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithToken:accountToken successCallback:success failureCallback:failed];
    
    if(self){
//        NSDictionary *parameters=@{@"accountKey":accountToken};
//        [self setParameters:parameters];
    }
    return self;
}
-(NSString *)getURL{
    return @"/getStoreInfo.do";
}

-(NSString *)getMethod{
    return @"POST";
}
-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCGetShopInfoResult *result=[[WTCGetShopInfoResult alloc]init];
            result.merchantName = data[@"merchantName"];
            result.merchantDescr= data[@"merchantDescr"];
            result.merchantAddress= data[@"merchantAddress"];
            result.merchantImagePath= data[@"merchantImagePath"];
            result.mobile= data[@"mobile"];
            result.nick=data[@"nick"];
            [self getResponse].data=result;
        }
    }
}

@end
