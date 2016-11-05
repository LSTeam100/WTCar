//
//  WTCVerfiyCodeRequest.m
//  WTCar
//
//  Created by apple on 2016/11/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCVerfiyCodeRequest.h"
#import "WTCVerifyCode.h"
@implementation WTCVerfiyCodeRequest
-(id)initWithLoginName:(NSString *)loginName password:(NSString *)password successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"account":loginName,
                                   };
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/reqValidationCode.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil){
            WTCVerifyCode *VerifyCode=[[WTCVerifyCode alloc]init];
            VerifyCode.validationCode=data[@"validationCode"];
            [self getResponse].data=VerifyCode;
        }
    }
}

@end
