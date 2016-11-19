//
//  WTCGetPOSInfoRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCGetPOSInfoRequest.h"
#import "WTCGetPOSInfoResult.h"
@implementation WTCGetPOSInfoRequest
-(id)initWithToken:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithToken:token successCallback:success failureCallback:failed];
    if(self){
//        NSDictionary *parameters=@{@"token":token};
//        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/getPosInfo.do";
}

-(NSString *)getMethod{
    return @"POST";
}
-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCGetPOSInfoResult *result=[[WTCGetPOSInfoResult alloc]init];
            result.accountId = data[@"accountId"];
            result.applySatus = data[@"applyStatus"];
            result.createTime = data[@"createTime"];
            result.Id = data[@"id"];
            result.openStatus = data[@"openStatus"];
            result.posloginAccount = data[@"posloginAccount"];
            result.possSn = data[@"posSn"];
            result.updateTime = data[@"updateTime"];
            [self getResponse].data=result;
        }
    }
}
@end
