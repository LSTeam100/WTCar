//
//  WTCSaledRequest.m
//  WTCar
//
//  Created by apple on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCSaledRequest.h"

@implementation WTCSaledRequest
-(id)initWithToken:(NSString *)token SaledId:(NSNumber *)saledId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self = [super initWithToken:token successCallback:success failureCallback:failed];
    if (self) {
        NSDictionary *parameters=@{@"id":saledId,
                                   };
        
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"saled.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSArray* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSArray *)[NSNull null]){
            [self getResponse].data=data;
        }
    }
}
@end
