//
//  WTCChekVerityCodeRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCChekVerityCodeRequest.h"

@implementation WTCChekVerityCodeRequest

-(id)initWithLoginName:(NSString *)loginName Code:(NSString *)code successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"account":loginName,@"code":code
                                   };
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/checkCode.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
 
        }
    }
}


@end
