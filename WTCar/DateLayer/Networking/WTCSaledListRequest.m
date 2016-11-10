//
//  WTCSaledListRequest.m
//  WTCar
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCSaledListRequest.h"
#import "WTCSaledList.h"


@implementation WTCSaledListRequest
-(id)initWithToken:(NSString *)token CurPage:(NSNumber *)curPage PageSize:(NSNumber *)pageSize successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed
{
    self = [super initWithToken:token successCallback:success failureCallback:failed];
    if (self) {
        NSDictionary *parameters=@{@"curPage":curPage,
                                   @"pageSize":pageSize,
                                   };
        
        [self setParameters:parameters];
    }
    return self;
}

-(NSString *)getURL{
    return @"saledList.do";
}

-(NSString *)getMethod{
    return @"POST";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSArray* data=responseDictionary[@"data"];
        if(data!=nil && data != NULL && data != (NSArray *)[NSNull null]){
            WTCSaledLIST *saleList = [[WTCSaledLIST alloc]initWithDictionary:data];
            [self getResponse].data=saleList;
        }
    }
}

@end
