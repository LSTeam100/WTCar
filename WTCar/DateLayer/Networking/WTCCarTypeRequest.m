//
//  WTCCarTypeRequest.m
//  WTCar
//
//  Created by apple on 2016/11/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCarTypeRequest.h"
#import "WTCCarType.h"
@implementation WTCCarTypeRequest

-(id)initWithToken:(NSString *)token TypeId:(NSNumber *)typeId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self = [super initWithToken:token successCallback:success failureCallback:failed];
    if (self) {
                NSDictionary *parameters=@{@"id":typeId,
                                           };
                [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"carType.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCAllCarsType *carsType = [[WTCAllCarsType alloc]initWithDictionary:data];
            [self getResponse].data=carsType;
        }
    }
}

@end
