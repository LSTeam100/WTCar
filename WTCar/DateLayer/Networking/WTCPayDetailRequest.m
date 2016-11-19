//
//  WTCPayDetailRequest.m
//  WTCar
//
//  Created by apple on 2016/11/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCPayDetailRequest.h"
#import "WTCPayDetail.h"
@implementation WTCPayDetailRequest
-(id)initWithToken:(NSString *)token POSId:(NSNumber *)posId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self = [super initWithToken:token successCallback:success failureCallback:failed];
    if (self) {
                NSDictionary *parameters=@{@"id":posId,
                                           };
                [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"payDetail.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCPayDetail *detail = [[WTCPayDetail alloc]initWithDictionary:data];
            [self getResponse].data=detail;
        }
    }
}

@end
