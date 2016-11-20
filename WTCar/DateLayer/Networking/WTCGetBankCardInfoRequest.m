//
//  WTCGetBankCardInfoRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCGetBankCardInfoRequest.h"
#import "WTCGetBankCardInfoResult.h"
@implementation WTCGetBankCardInfoRequest

-(id)initWithToken:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithToken:token successCallback:success failureCallback:failed];
    
    if(self){
//        NSDictionary *parameters=@{@"token":token};
//        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/getBankCardInfo.do";
}

-(NSString *)getMethod{
    return @"POST";
}
-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCGetBankCardInfoResult *result=[[WTCGetBankCardInfoResult alloc]init];
            result.bankNum = data[@"bankNum"];
            result.openedBank = data[@"openedBank"];
            result.realName = data[@"realName"];
            [self getResponse].data=result;
        }
    }
}

@end
