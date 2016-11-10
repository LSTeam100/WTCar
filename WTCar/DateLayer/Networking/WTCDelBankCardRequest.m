//
//  WTCDelBankCardRequest.m
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCDelBankCardRequest.h"
@implementation WTCDelBankCardRequest

-(id)initWithDelBankCard:(NSNumber *)bankCardId  successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"id":bankCardId};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/delBankCard.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSLog(@"删除银行卡成功");
    }
}

@end
