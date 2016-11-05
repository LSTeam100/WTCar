//
//  WTCReqCarInfoRequest.m
//  WTCar
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCReqCarInfoRequest.h"
#import "WTCarReqCarInfo.h"
@implementation WTCReqCarInfoRequest
-(id)initWithToken:(NSString *)token ReqCarInfoId:(NSNumber *)reqCarInfoId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self = [super initWithToken:token successCallback:success failureCallback:failed];
    if (self) {
        NSDictionary *parameters=@{@"id":reqCarInfoId,
                                   };
        
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"reqCarInfo.do";
}

-(NSString *)getMethod{
    return @"GET";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil){
            WTCarReqCarInfo *reqInfo = [[WTCarReqCarInfo alloc]init];
            reqInfo.firstUpTime = data[@"firstUpTime"];
            reqInfo.carReqId = data[@"carReqId"];
            reqInfo.price = data[@"price"];
            reqInfo.primaryPicUrl = data[@"primaryPicUrl"];
            reqInfo.productName = data[@"productName"];
            [self getResponse].data=reqInfo;
        }
    }
}

@end
