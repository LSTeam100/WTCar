//
//  WTCApplyBusinessLicenseRequest.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCApplyBusinessLicenseRequest.h"
#import "WTCApplyBusinessLicenseResult.h"
@implementation WTCApplyBusinessLicenseRequest

-(id)initWithLicencePath:(NSString *)licenPath Token:(NSString*)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithToken:token successCallback:success failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"licencePath":licenPath};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/applyBusinessLicense";
}

-(NSString *)getMethod{
    return @"POST";
}
-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCApplyBusinessLicenseResult *result=[[WTCApplyBusinessLicenseResult alloc]init];
            
            [self getResponse].data=result;
        }
    }
}


@end
