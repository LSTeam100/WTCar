//
//  WTCToPayListRequest.m
//  WTCar
//
//  Created by apple on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCToPayListRequest.h"
#import "MJExtension.h"
#import "WTCToPayList.h"
@implementation WTCToPayListRequest
-(id)initWithToken:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self = [super initWithToken:token successCallback:success failureCallback:failed];
    if (self) {
//        NSDictionary *parameters=@{@"productId":productId,
//                                   @"orderPrice":[NSNumber numberWithDouble:orderPrice]
//                                   };
//        
//        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"getToPayList.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCToPayList *payList = [WTCToPayList objectWithKeyValues:data];
            [self getResponse].data=payList;
        }
    }
}

@end
