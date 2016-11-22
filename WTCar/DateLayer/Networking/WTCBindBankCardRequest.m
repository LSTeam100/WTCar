//
//  WTCBindBankCardRequest.m
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBindBankCardRequest.h"
@implementation WTCBindBankCardRequest

-(id)initWithBindBankCard:(NSString *)token Bankcard:(NSString *)bankcard  openedBank:(NSString *)openedBank  successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self = [super initWithToken:token successCallback:success failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{
        														@"bankcard":bankcard,
        														@"openedBank":openedBank};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/bindBankCard.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    NSDictionary* data=responseDictionary[@"data"];
    if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
        
        [self getResponse].data=data;
    }

//    
//    if([[self getResponse] isSucceed]){
//        NSLog(@"绑定成功");
//    }
}

@end
