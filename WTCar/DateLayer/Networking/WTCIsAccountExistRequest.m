//
//  WTCIsAccountExistRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCIsAccountExistRequest.h"
#import "WTCIsAccountExistResult.h"
@implementation WTCIsAccountExistRequest

-(id)initWithLoginName:(NSString *)LoginName successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"account":LoginName};
        [self setParameters:parameters];
    }
    return self;
}
-(NSString *)getURL{
    return @"/isAccountExist.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCIsAccountExistResult *result=[[WTCIsAccountExistResult alloc]init];
            result.isExist = data[@"isExist"];
            [self getResponse].data=result;
        }
    }
}

@end
