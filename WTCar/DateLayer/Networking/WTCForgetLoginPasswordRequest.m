//
//  WTCForgetLoginPasswordRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCForgetLoginPasswordRequest.h"
#import "WTCForgetLoginPasswordResult.h"
@implementation WTCForgetLoginPasswordRequest

-(id)initWithLoginName:(NSString *)loginName password:(NSString *)password VerityCode:(NSString *)code successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"account":loginName,
                                   @"accountPassword":password,@"code":code};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/forget.do";
}

-(NSString *)getMethod{
    return @"POST";
}
-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCForgetLoginPasswordResult *result=[[WTCForgetLoginPasswordResult alloc]init];
            
            [self getResponse].data=result;
        }
    }
}

@end
