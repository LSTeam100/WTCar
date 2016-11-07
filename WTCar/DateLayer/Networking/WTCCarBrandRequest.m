//
//  WTCCarBrandRequest.m
//  WTCar
//
//  Created by apple on 2016/11/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCarBrandRequest.h"
#import "WTCCarBrand.h"
@implementation WTCCarBrandRequest
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
    return @"carBrand.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil){
            WTCAllCarBrands *allBrands = [[WTCAllCarBrands alloc]initWithDictionary:data];
            [self getResponse].data=allBrands;
        }
    }
}

@end
