//
//  WTCOnShelfRequest.m
//  WTCar
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCOnShelfRequest.h"

@implementation WTCOnShelfRequest

-(id)initWithToken:(NSString *)token OnShelfId:(NSNumber *)onShelfId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self = [super initWithToken:token successCallback:success failureCallback:failed];
    if (self) {
        NSDictionary *parameters=@{@"id":onShelfId,
                                   };
        
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"onShelf.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            [self getResponse].data=data;
        }
    }
}

@end
