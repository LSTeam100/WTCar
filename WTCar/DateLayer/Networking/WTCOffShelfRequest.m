//
//  WTCOffShelfRequest.m
//  WTCar
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCOffShelfRequest.h"
#import "WTCOffShelfList.h"
@implementation WTCOffShelfRequest
-(id)initWithToken:(NSString *)token OffShelfId:(NSNumber *)offShelfId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self = [super initWithToken:token successCallback:success failureCallback:failed];
    if (self) {
        NSDictionary *parameters=@{@"id":offShelfId,
                                   };
        
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"/offShelf.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSDictionary *)[NSNull null]){
//            WTCOffShelfList *offShelfList = [[WTCOffShelfList alloc]initWithDictionary:data];
            [self getResponse].data=data;
        }
    }
}
@end
