//
//  WTCApplyLoanRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCApplyLoanRequest.h"
#import "WTCApplyLoanResult.h"
@implementation WTCApplyLoanRequest
-(id)initWithAmount:(NSString *)amount Token:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
//    self=[super initWithSuccessCallback:success
//                        failureCallback:failed];
    self = [self initWithToken:token successCallback:success failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"amount":amount};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/applyFunds.do";
}

-(NSString *)getMethod{
    return @"POST";
}
-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCApplyLoanResult *result=[[WTCApplyLoanResult alloc]init];
            
            [self getResponse].data=result;
        }
    }
}
@end
