//
//  WTCGetCashListResult.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCGetCashListResult.h"

@implementation WTCGetCashListResult

-(instancetype)initWithDictionary:(NSArray *)dataArr
{
    self = [super init];
    if (self) {
        //        NSArray *dataArr = [dataDic objectForKey:@"rows"];
        self.rows = [[NSMutableArray alloc]init];
        for (int i = 0; i < dataArr.count; i++) {
            NSDictionary *oneDic = [dataArr objectAtIndex:i];
            WTCACash *acash = [[WTCACash alloc]initWithDictionary:oneDic];
            [self.rows addObject:acash];
        }
    }
    return self;
}

@end
@implementation WTCACash

-(instancetype)initWithDictionary:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        if ( [dataDic objectForKey:@"amount"]) {
            self.amount = [dataDic objectForKey:@"amount"];
        }
        else
        {
            self.amount = [NSNumber numberWithDouble:0];
        }
        if ( [dataDic objectForKey:@"createTime"]) {
            self.createTime = [dataDic objectForKey:@"createTime"];
        }
        else
        {
            self.createTime = @"0";
        }
        if ( [dataDic objectForKey:@"status"]) {
            self.status = [dataDic objectForKey:@"status"];
        }
        else
        {
            self.status = [NSNumber numberWithDouble:0];
        }
        if ( [dataDic objectForKey:@"withdrawNum"]) {
            self.withdrawNum = [dataDic objectForKey:@"withdrawNum"];
        }
        else
        {
            self.withdrawNum = @"";
        }
    }
    return self;
}

@end
