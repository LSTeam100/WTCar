//
//  WTCUpSubUserRequest.m
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCUpSubUserRequest.h"
@implementation WTCUpSubUserRequest

-(id)initWithUpSubUser:(NSNumber *)subUserId  ChildAccountMobile:(NSString *)childAccountMobile ChildAccountName:(NSString *)childAccountName successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{ @"id":subUserId,
        														@"childAccountMobile":childAccountMobile,
        														@"childAccountName":childAccountName};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/upSubUser.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSLog(@"更新子账号成功");
    }
}

@end
