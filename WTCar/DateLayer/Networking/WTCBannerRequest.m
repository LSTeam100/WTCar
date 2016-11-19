//
//  WTCBannerRequest.m
//  WTCar
//
//  Created by apple on 2016/11/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBannerRequest.h"
#import "WTCBanner.h"
@implementation WTCBannerRequest
-(id)initWithBanner:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self = [super initWithSuccessCallback:success failureCallback:failed];
    if (self) {
//        NSDictionary *parameters=@{@"id":posId,
//                                   };
//        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"banners.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSArray* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSArray *)[NSNull null]){
            WTCBanner *banners = [[WTCBanner alloc]initWithDictionary:data];
            [self getResponse].data=banners;
        }
    }
}
@end
