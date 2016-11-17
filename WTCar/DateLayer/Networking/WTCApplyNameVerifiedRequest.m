//
//  WTCApplyNameVerifiedRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCApplyNameVerifiedRequest.h"
#import "WTCApplyNameVerifiedResult.h"
@implementation WTCApplyNameVerifiedRequest

-(id)initWithIdcard:(NSString *)idcard realName:(NSString *)realName Token:(NSString*)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"idcard":idcard,@"realName":realName,@"token":token};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/idcardverify.do";
}

-(NSString *)getMethod{
    return @"POST";
}
-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCApplyNameVerifiedResult *result=[[WTCApplyNameVerifiedResult alloc]init];
            
            [self getResponse].data=result;
        }
    }
}



@end
