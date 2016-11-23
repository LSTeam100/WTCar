//
//  WTCCheckPayPwdRequest.m
//  WTCar
//
//  Created by apple on 2016/11/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCheckPayPwdRequest.h"

@implementation WTCCheckPayPwdRequest
-(id)initWithPayPasswd:(NSString *)token PayPassword:(NSString *)payPassword successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithToken:token successCallback:success failureCallback:failed];
    if(self){
        NSDictionary *parameters=@{
                                   @"payPassword":payPassword};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/checkPayPwd.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            
            [self getResponse].data=data;
        }

    }
}
@end
