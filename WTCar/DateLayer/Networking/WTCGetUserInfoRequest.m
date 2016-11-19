//
//  WTCGetUserInfoRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCGetUserInfoRequest.h"
#import "WTCGetUserInfoResult.h"
@implementation WTCGetUserInfoRequest
-(id)initWithToken:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"token":token};
        [self setParameters:parameters];
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
            
            [self getResponse].data=result;
        }
    }
}
@end
