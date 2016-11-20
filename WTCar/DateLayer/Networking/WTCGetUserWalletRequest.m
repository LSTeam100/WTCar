//
//  WTCGetUserWalletRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCGetUserWalletRequest.h"
#import "WTCGetUserWalletResult.h"
@implementation WTCGetUserWalletRequest

-(id)initWithToken:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithToken:token successCallback:success failureCallback:failed];
    
    if(self){
//        NSDictionary *parameters=@{@"token":token};
//        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/ .do";
}

-(NSString *)getMethod{
    return @"POST";
}
-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCGetUserWalletResult *result=[[WTCGetUserWalletResult alloc]init];
            result.avail = data[@"avail"];
            result.frozen = data[@"frozen"];

            [self getResponse].data=result;
        }
    }
}

@end
