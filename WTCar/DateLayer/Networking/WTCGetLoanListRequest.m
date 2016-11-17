//
//  WTCGetLoanListRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCGetLoanListRequest.h"
#import "WTCGetLoanListResult.h"
@implementation WTCGetLoanListRequest
-(id)initWithToken:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"token":token};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/getApplyFundsList.do";
}

-(NSString *)getMethod{
    return @"POST";
}
-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCGetLoanListResult *result=[[WTCGetLoanListResult alloc]init];
            
            [self getResponse].data=result;
        }
    }
}
@end
