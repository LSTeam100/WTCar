//
//  WTCSetPayPasswdRequest.m
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCSetPayPasswdRequest.h"
@implementation WTCSetPayPasswdRequest 

-(id)initSetPayPasswd:(NSString *)payPassword Token:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithToken:token successCallback:success failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"payPassword":payPassword};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/setPayPwd.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSLog(@"设置密码成功");
    }
}

@end
