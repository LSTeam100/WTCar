//
//  WTCChildLoginRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCChildLoginRequest.h"
#import "WTCChildLoginResult.h"
@implementation WTCChildLoginRequest

-(id)initWithChildAccountKey:(NSString *)accountKey mainAccount:(NSString *)account childAccountTele:(NSString *)childAccountMobile successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"accountKey":accountKey,@"acount":account,@"childAccountMobile":childAccountMobile};
        [self setParameters:parameters];
    }
    return self;
}
-(NSString *)getURL{
    return @"/subLogin.do";
}

-(NSString *)getMethod{
    return @"POST";
}
-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCChildLoginResult *result=[[WTCChildLoginResult alloc]init];
            result.subToken = data[@"subToken"];
            [self getResponse].data=result;
        }
    }
}


@end
