//
//  WTCLoginRequest.m
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCLoginRequest.h"
#import "WTCLoginResult.h"
@implementation WTCLoginRequest

-(id)initWithLoginName:(NSString *)loginName password:(NSString *)password successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"account":loginName,
                                   @"accountPassword":password};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/login.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil){
            WTCLoginResult *result=[[WTCLoginResult alloc]init];
            result.token=data[@"token"];
            [self getResponse].data=result;
        }
    }
}

@end
