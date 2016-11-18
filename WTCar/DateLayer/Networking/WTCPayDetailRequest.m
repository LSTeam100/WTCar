//
//  WTCPayDetailRequest.m
//  WTCar
//
//  Created by apple on 2016/11/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCPayDetailRequest.h"

@implementation WTCPayDetailRequest
-(id)initWithToken:(NSString *)token POSId:(NSNumber *)posId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self = [super initWithToken:token successCallback:success failureCallback:failed];
    if (self) {
                NSDictionary *parameters=@{@"productId":posId,
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
//            WTCGetPayedList *payedList = [WTCGetPayedList objectWithKeyValues:data];
            [self getResponse].data=data;
        }
    }
}

@end
