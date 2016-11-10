//
//  WTCDelSubUserRequest.m
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCDelSubUserRequest.h"
@implementation WTCDelSubUserRequest

-(id)initWithDelSubUser:(NSNumber *)subUserId  successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"id":subUserId};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/delSubUser.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSLog(@"删除子账号成功");
    }
}

@end
