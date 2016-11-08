//
//  WTCChangePayPasswdRequest.m
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCChangePayPasswdRequest.h"
@implementation WTCChangePayPasswdRequest

-(id)initChangePayPasswd:(NSString *)nwPayPassword payPassword:(NSString *)payPassword successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"nwPayPassword":nwPayPassword,
                                   @"payPassword":payPassword};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/upPayPwd.do";
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
