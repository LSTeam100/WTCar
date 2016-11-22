//
//  WTCModifyStoreInfoRequest.m
//  WTCar
//
//  Created by apple on 2016/11/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCModifyStoreInfoRequest.h"

@implementation WTCModifyStoreInfoRequest
-(id)initModifyStoreInfo:(NSString *)token DataDic:(NSDictionary *)dataDic   successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self  = [super initWithToken:token successCallback:success failureCallback:failed];
    if(self){
        NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
        for (NSString *key in dataDic) {
            NSString *value = [dataDic objectForKey:key];
            [parameters setValue:value forKey:key];
        }
        if (parameters.count > 0) {
            [self setParameters:parameters];
        }
//        NSDictionary *parameters=@{updataKey:updataValue};
    }
    return self;
}

-(NSString *)getURL{
    return @"/upStoreInfo.do";
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
