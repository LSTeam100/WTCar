//
//  WTCarOffShelfListRequest.m
//  WTCar
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarOffShelfListRequest.h"
#import "WTCOffShelfList.h"

@implementation WTCarOffShelfListRequest
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
    return @"GET";
}

-(void)processResponse:(NSDictionary *)responseDictionary{
    [super processResponse:responseDictionary];
    
    if([[self getResponse] isSucceed]){
        NSDictionary* data=responseDictionary[@"data"];
        if(data!=nil){
            WTCAOffShelf *saleList = [[WTCAOffShelf alloc]initWithDictionary:data];
            [self getResponse].data=saleList;
        }
    }
}

@end
