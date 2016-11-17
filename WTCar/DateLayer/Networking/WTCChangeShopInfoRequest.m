//
//  WTCChangeShopInfoRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCChangeShopInfoRequest.h"
#import "WTCChangeShopInfoResult.h"
@implementation WTCChangeShopInfoRequest

-(id)initWithmerchanAddress:(NSString *)merchanAddress merchanDescr:(NSString *)merchanDescr merchanImage_path:(NSString *)merchanImage_path merchanName:(NSString *)merchanName mobile:(NSString *)mobile nick:(NSString *)nick token:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"merchanAddress":merchanAddress,@"merchanDescr":merchanDescr,@"merchanImage_path":merchanImage_path,@"merchanName":merchanName,@"mobile":mobile,@"nick":nick,@"mobile":mobile,@"token":token};
        [self setParameters:parameters];
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
            WTCChangeShopInfoResult *result=[[WTCChangeShopInfoResult alloc]init];

            [self getResponse].data=result;
        }
    }
}


@end
