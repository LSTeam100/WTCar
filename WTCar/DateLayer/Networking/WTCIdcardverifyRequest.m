//
//  WTCIdcardverifyRequest.m
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCIdcardverifyRequest.h"
@implementation WTCIdcardverifyRequest

-(id)initWithIdcardverify:(NSString *)idcard realName:(NSString *)realName successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed{
    self=[super initWithSuccessCallback:success
                        failureCallback:failed];
    
    if(self){
        NSDictionary *parameters=@{@"idcard":idcard,
                                   @"realName":realName};
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/idcardverify.do";
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
