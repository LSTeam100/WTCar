//
//  WTCGetLoanListResult.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCGetLoanListResult.h"

@implementation WTCGetLoanListResult
-(instancetype)initWithDictionary:(NSArray *)dataArr
{
    self = [super init];
    if (self) {
        //        NSArray *dataArr = [dataDic objectForKey:@"rows"];
        self.rows = [[NSMutableArray alloc]init];
        for (int i = 0; i < dataArr.count; i++) {
            NSDictionary *oneDic = [dataArr objectAtIndex:i];
            WTCALoan *aloan = [[WTCALoan alloc]initWithDictionary:oneDic];
            [self.rows addObject:aloan];
        }
    }
    return self;
}

@end

@implementation WTCALoan

-(instancetype)initWithDictionary:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        if ( [dataDic objectForKey:@"amount"]) {
            self.amount = [dataDic objectForKey:@"amount"];
        }
        else
        {
            self.amount = @"0";
        }
        if ( [dataDic objectForKey:@"status"]) {
            self.status = [dataDic objectForKey:@"status"];
        }
        else
        {
            self.status = [NSNumber numberWithDouble:0];
        }
        if ( [dataDic objectForKey:@"updateTime"]) {
            self.updateTime = [dataDic objectForKey:@"updateTime"];
        }
        else
        {
            self.updateTime = @"";
        }
    }
    return self;
}

@end
