//
//  WTCChangePOSPassWordRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCChangePOSPassWordRequest.h"
#import "WTCChangePOSPassWordResult.h"
@implementation WTCChangePOSPassWordRequest
-(id)initWithPosLoginPasswd:(NSString *)posLoginPasswd Token:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"posLoginPasswd":posLoginPasswd,@"token":token};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/upPosPwd.do";
}

-(NSString *)getMethod{
    return @"POST";
}
-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCChangePOSPassWordResult *result=[[WTCChangePOSPassWordResult alloc]init];
            
            [self getResponse].data=result;
        }
    }
}

@end
