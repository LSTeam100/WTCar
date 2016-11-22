//
//  WTCApplyCashRequest.m
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCApplyCashRequest.h"
@implementation WTCApplyCashRequest

-(id)initWithApplyCash:(NSString *)amount Token:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithToken:token successCallback:success failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{
        														@"amount":amount};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/applyCash.do";
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
