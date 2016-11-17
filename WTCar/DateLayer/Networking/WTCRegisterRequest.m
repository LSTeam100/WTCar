//
//  WTCRegisterRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCRegisterRequest.h"
#import "WTCRegisterResult.h"
@implementation WTCRegisterRequest

-(id)initWithLoginName:(NSString *)loginName password:(NSString *)password AccountType:(NSString *)type VerityCode:(NSString *)code successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"account":loginName,@"accountPassword":password,@"accountType":type,@"code":code};
        [self setParameters:parameters];
    }
    return self;
}
-(NSString *)getURL{
    return @"/register.do";
}

-(NSString *)getMethod{
    return @"POST";
}
-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCRegisterResult *result=[[WTCRegisterResult alloc]init];
            result.token=data[@"token"];
            [self getResponse].data=result;
        }
    }
}

@end
