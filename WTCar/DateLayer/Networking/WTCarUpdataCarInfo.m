//
//  WTCarUpdataCarInfo.m
//  WTCar
//
//  Created by apple on 2016/11/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarUpdataCarInfo.h"

@implementation WTCarUpdataCarInfo
-(id)initWithToken:(NSString *)token CBrand:(NSString *)cbrand CModel:(NSString *)cModel Ctype:(NSString *)ctype City:(NSString *)city FirstUpTime:(NSString *)firstUptime HeaderPic:(NSString *)headerPic Miles:(NSNumber *)miles PicList:(NSMutableArray *)picList Price:(NSString *)price Product_descr:(NSString *)product_descr Province:(NSString *)province Sid:(NSNumber *)sid ModifyId:(NSNumber *)modifyId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
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
                                   @"price":price,
                                   @"productDescr":product_descr,
                                   @"province":province,
                                   @"sid" : sid,
                                   @"id" : modifyId
                                   };
        
        [self setParameters:parameters];
    }
    return self;
}
-(NSString *)getURL{
    return @"/editCar.do";
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
