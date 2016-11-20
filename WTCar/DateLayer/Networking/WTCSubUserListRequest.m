//
//  WTCSubUserListRequest.m
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCSubUserListRequest.h"
#import "WTCSubUser.h"
@implementation WTCSubUserListRequest

-(id)initWithToken:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self=[super initWithToken:token successCallback:success failureCallback:failed];
    
    if(self){
//        NSDictionary *parameters=@{};
//        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/subUserList.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSArray* data=responseDictionary[@"data"];
        if(data!=nil){
            WTCSubUser *subUser = [[WTCSubUser alloc]initWithDictionary:data];
            [self getResponse].data=subUser;
        }
    }
}

@end
