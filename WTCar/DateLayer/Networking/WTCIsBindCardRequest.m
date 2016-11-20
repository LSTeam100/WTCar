//
//  WTCIsBindCardRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCIsBindCardRequest.h"
#import "WTCIsBindCardResult.h"
@implementation WTCIsBindCardRequest

-(id)initWithToken:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithToken:token successCallback:success failureCallback:failed];
    
    if(self){
//        NSDictionary *parameters=@{@"token":token};
//        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/cashList";
}

-(NSString *)getMethod{
    return @"POST";
}
-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCIsBindCardResult *result=[[WTCIsBindCardResult alloc]init];
            result.isBind = data[@"isBind"];
            [self getResponse].data=result;
        }
    }
}
@end
