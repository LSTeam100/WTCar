//
//  WTCPayDetail.m
//  WTCar
//
//  Created by apple on 2016/11/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCPayDetail.h"

@implementation WTCPayDetail
-(instancetype)initWithDictionary:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        self.payDetailsArr = [[NSMutableArray alloc]init];
        if ([dataDic objectForKey:@"amount"]) {
            self.amount = [dataDic objectForKey:@"amount"];
        }
        else
        {
            self.amount = @"";
        }
        
        if ([dataDic objectForKey:@"status"]) {
            self.status = [dataDic objectForKey:@"status"];
        }
        else
        {
            self.status = @"";
        }
        
        if ([dataDic objectForKey:@"payDetails"]) {
            NSArray *detailArr = [dataDic objectForKey:@"payDetails"];
            for (int i = 0; i < detailArr.count; i++) {
                NSDictionary *oneDic = [detailArr objectAtIndex:i];
                WTCPayOneDetail *oneDetail = [[WTCPayOneDetail alloc]initWithDictionary:oneDic];
                [self.payDetailsArr addObject:oneDetail];
            }
            
        }
        else{
            self.payDetailsArr = [NSMutableArray arrayWithCapacity:0];
        }
        
    }
    return self;
}
@end

@implementation WTCPayOneDetail

-(instancetype)initWithDictionary:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        
        if ([dataDic objectForKey:@"amount"]) {
            self.amount = [dataDic objectForKey:@"amount"];
        }
        else
        {
            self.amount = @"0";
        }
        if ([dataDic objectForKey:@"createTime"]) {
            self.createTime = [dataDic objectForKey:@"createTime"];
        }
        else
        {
            self.createTime = @"0";
        }
        if ([dataDic objectForKey:@"id"]) {
            self.oneDetailId = [dataDic objectForKey:@"id"];
        }
        else
        {
            self.oneDetailId = @"";
        }
        if ([dataDic objectForKey:@"payTime"]) {
            self.payTime = [dataDic objectForKey:@"payTime"];
        }
        else
        {
            self.payTime = @"0";
        }
        if ([dataDic objectForKey:@"pid"]) {
            self.pid = [dataDic objectForKey:@"pid"];
        }
        else
        {
            self.pid = @"0";
        }
        if ([dataDic objectForKey:@"updateTime"]) {
            self.updateTime = [dataDic objectForKey:@"updateTime"];
        }
        else
        {
            self.updateTime = @"0";
        }
        
    }
    return self;
}


@end
