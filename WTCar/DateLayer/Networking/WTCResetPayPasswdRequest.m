//
//  WTCResetPayPasswdRequest.m
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//
#import "WTCResetPayPasswdRequest.h"

@implementation WTCResetPayPasswdRequest

-(id)initWithPayPasswd:(NSString *)code payPassword:(NSString *)payPassword successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"code":code,
                                   @"payPassword":payPassword};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/forgetPayPwd.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSLog(@"重置成功");
    }
}

@end
