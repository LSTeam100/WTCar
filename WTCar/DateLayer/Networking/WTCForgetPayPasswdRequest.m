//
//  WTCForgetPayPasswdRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCForgetPayPasswdRequest.h"
#import "WTCForgetPayPasswdResult.h"
@implementation WTCForgetPayPasswdRequest

-(id)initWithCode:(NSString *)verityCode payPassword:(NSString *)payPassword successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"code":verityCode,
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
        NSLog(@"修改密码成功");
    }
}



@end
