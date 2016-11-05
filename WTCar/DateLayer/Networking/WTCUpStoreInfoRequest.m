//
//  WTCUpStoreInfoRequest.m
//  WTCar
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCUpStoreInfoRequest.h"

@implementation WTCUpStoreInfoRequest
-(id)initWithToken:(NSString *)token MerchantAddress:(NSNumber *)merchantAddress MerchantDescr:(NSNumber *)merchantDescr MerchantImage_path:(NSString *)merchantImage_path MerchantName:(NSString *)merchantName Nick:(NSString *)nick Mobile:(NSString *)mobile successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self = [super initWithToken:token successCallback:success failureCallback:failed];
    if (self) {
        NSDictionary *parameters=@{@"merchantAddress":merchantAddress,
                                   @"merchantDescr":merchantDescr,
                                   @"merchantImage_path":merchantImage_path,
                                   @"merchantName":merchantName,
                                   @"nick":nick,
                                   @"mobile":mobile,
                                   };
        [self setParameters:parameters];
    }
    return self;

}
-(NSString *)getURL{
    return @"upStoreInfo.do";
}

-(NSString *)getMethod{
    return @"GET";
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
