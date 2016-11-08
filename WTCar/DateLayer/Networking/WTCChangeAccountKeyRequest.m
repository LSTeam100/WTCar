//
//  WTCChangeAccountKeyRequest.m
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCChangeAccountKeyRequest.h"
@implementation WTCChangePayPasswdRequest

-(id)initChangeAccountKey:(NSString *)accountKey nwAccountKey:(NSString *)nwAccountKey successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"accountKey":accountKey,
                                   @"nwAccountKey":nwAccountKey};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/upSubAcountKey.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSLog(@"修改密码成功");
    }
}

@end
