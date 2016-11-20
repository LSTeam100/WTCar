//
//  WTCUserInfoRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCUserInfoRequest.h"
#import "WTCGetUserInfoResult.h"
@implementation WTCUserInfoRequest

-(id)initWithToken:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
   self=[super initWithToken:token successCallback:success failureCallback:failed];
    
    if(self){
//        NSDictionary *parameters=@{@"token":token};
//        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/getUserInfo.do";
}

-(NSString *)getMethod{
    return @"POST";
}
-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCGetUserInfoResult *result=[[WTCGetUserInfoResult alloc]init];
            result.headPortraitPath = data[@"headPortraitPath"];
            result.merchantAddress = data[@"merchantAddress"];
            result.merchantDescr = data[@"merchantDescr"];
            result.merchantName = data[@"merchantName"];
            result.mobile = data[@"mobile"];
            result.realName = data[@"realName"];
            [self getResponse].data=result;
        }
    }
}

@end
