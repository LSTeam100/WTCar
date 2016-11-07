//
//  WTCCarTypeRequest.m
//  WTCar
//
//  Created by apple on 2016/11/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCarTypeRequest.h"

@implementation WTCCarTypeRequest

-(id)initWithToken:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self = [super initWithToken:token successCallback:success failureCallback:failed];
    if (self) {
        //        NSDictionary *parameters=@{@"id":onShelfId,
        //                                   };
        
        //        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"carType.do";
}

-(NSString *)getMethod{
    return @"post";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil){
            [self getResponse].data=data;
        }
    }
}

@end
