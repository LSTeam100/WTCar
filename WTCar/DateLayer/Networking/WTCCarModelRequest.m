//
//  WTCCarModelRequest.m
//  WTCar
//
//  Created by apple on 2016/11/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCarModelRequest.h"
#import "WTCCarModel.h"
@implementation WTCCarModelRequest
-(id)initWithToken:(NSString *)token ModelId:(NSNumber *)modelId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self = [super initWithToken:token successCallback:success failureCallback:failed];
    if (self) {
        NSDictionary *parameters=@{@"id":modelId,
                                   };
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"carModel.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCAllCarsModel *carsModel = [[WTCAllCarsModel alloc]initWithDictionary:data];
            [self getResponse].data=carsModel;
        }
    }
}

@end
