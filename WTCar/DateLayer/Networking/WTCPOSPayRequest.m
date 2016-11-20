//
//  WTCPOSPayRequest.m
//  WTCar
//
//  Created by apple on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCPOSPayRequest.h"
#import "WTCPOSPayModel.h"
#import "MJExtension.h"
@implementation WTCPOSPayRequest
-(id)initWithToken:(NSString *)token ProductId:(NSNumber *)productId OrderPrice:(double)orderPrice successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self = [super initWithToken:token successCallback:success failureCallback:failed];
    if (self) {
        NSDictionary *parameters=@{@"productId":productId,
                                   @"orderPrice":[NSNumber numberWithDouble:orderPrice]
                                   };
        
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"posPay.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
            WTCPOSPayModel *posModel = [[WTCPOSPayModel alloc]initWithDictionary:data];
            [self getResponse].data=posModel;
        }
    }
}
@end
