//
//  WTCApplyCashRequest.m
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCApplyCashRequest.h"
@implementation WTCApplyCashRequest

-(id)initWithApplyCash:(NSString *)amount    successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
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
        NSLog(@"体现申请成功");
    }
}

@end
