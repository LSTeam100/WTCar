//
//  WTCCarDetailRequest.m
//  WTCar
//
//  Created by apple on 2016/11/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCarDetailRequest.h"
#import "WTCarDetailModel.h"

@implementation WTCCarDetailRequest
-(id)initWithToken:(NSString *)token CarDetailId:(NSNumber *)carDetailId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithToken:token successCallback:success failureCallback:failed];
    if(self){
        NSDictionary *parameters=@{@"id":carDetailId};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/carDetail.do";
}

-(NSString *)getMethod{
    return @"POST";
}
-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCarDetailModel *detail=[[WTCarDetailModel alloc]initWithDictionary:data];
            [self getResponse].data=detail;
        }
    }
}

@end
