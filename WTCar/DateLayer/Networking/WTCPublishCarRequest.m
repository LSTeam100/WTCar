//
//  WTCPublishCarRequest.m
//  WTCar
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCPublishCarRequest.h"

@implementation WTCPublishCarRequest
-(id)initWithToken:(NSString *)token CBrand:(NSString *)cbrand CModel:(NSString *)cModel Ctype:(NSString *)ctype City:(NSString *)city FirstUpTime:(NSString *)firstUptime HeaderPic:(NSString *)headerPic Miles:(NSNumber *)miles PicList:(NSArray *)picList Price:(NSString *)price Product_descr:(NSString *)product_descr Province:(NSString *)province successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self = [super initWithToken:token successCallback:success failureCallback:failed];
    if (self) {
        NSDictionary *parameters=@{@"cBrand":cbrand,
                                   @"cModel":cModel,
                                   @"cType":ctype,
                                   @"city":city,
                                   @"firstUpTime":firstUptime,
                                   @"headerPic":headerPic,
                                   @"miles":miles,
                                   @"picList":picList,
                                   @"price":province,
                                   @"product_descr":product_descr,
                                   @"province":province};
        
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/publishCar.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
//            WTCLoginResult *result=[[WTCLoginResult alloc]init];
//            result.token=data[@"token"];
            [self getResponse].data=data;
        }
    }
}

@end
