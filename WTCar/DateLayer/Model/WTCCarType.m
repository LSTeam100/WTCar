//
//  WTCCarType.m
//  WTCar
//
//  Created by apple on 2016/11/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCarType.h"

@implementation WTCCarType
-(instancetype)initWithDictionary:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        if ([dataDic objectForKey:@"createTime"]) {
            self.createTime = [dataDic objectForKey:@"createTime"];
        }
        else
        {
            self.createTime = @"";
        }
        if ([dataDic objectForKey:@"depth"]) {
            self.depth = [dataDic objectForKey:@"depth"];
        }
        else
        {
            self.depth = @"";
        }
        if ([dataDic objectForKey:@"fullname"]) {
            self.fullname = [dataDic objectForKey:@"fullname"];
        }
        else
        {
            self.fullname = @"";
        }
        if ([dataDic objectForKey:@"id"]) {
            self.typeId = [dataDic objectForKey:@"id"];
        }
        else
        {
            self.typeId = [NSNumber numberWithLong:0];
        }
        if ([dataDic objectForKey:@"initial"]) {
            self.initial = [dataDic objectForKey:@"initial"];
        }
        else
        {
            self.initial = @"";
        }
        if ([dataDic objectForKey:@"logo"]) {
            self.logo = [dataDic objectForKey:@"logo"];
        }
        else
        {
            self.logo = @"";
        }
        if ([dataDic objectForKey:@"name"]) {
            self.name = [dataDic objectForKey:@"name"];
        }
        else
        {
            self.name = @"";
        }
        if ([dataDic objectForKey:@"parentid"]) {
            self.parentid = [dataDic objectForKey:@"parentid"];
        }
        else
        {
            self.parentid = [NSNumber numberWithLong:0];
        }
        if ([dataDic objectForKey:@"price"]) {
            self.price = [dataDic objectForKey:@"price"];
        }
        else
        {
            self.price = @"";
        }
        if ([dataDic objectForKey:@"productionstate"]) {
            self.productionstate = [dataDic objectForKey:@"productionstate"];
        }
        else
        {
            self.productionstate = @"";
        }
        if ([dataDic objectForKey:@"salestate"]) {
            self.salestate = [dataDic objectForKey:@"salestate"];
        }
        else
        {
            self.salestate = @"";
        }
        if ([dataDic objectForKey:@"sizetype"]) {
            self.sizetype = [dataDic objectForKey:@"sizetype"];
        }
        else
        {
            self.sizetype = @"";
        }
        if ([dataDic objectForKey:@"updateTime"]) {
            self.updateTime = [dataDic objectForKey:@"updateTime"];
        }
        else
        {
            self.updateTime = @"";
        }
        if ([dataDic objectForKey:@"yeartype"]) {
            self.yeartype = [dataDic objectForKey:@"yeartype"];
        }
        else
        {
            self.yeartype = @"";
        }
    }
    return self;
}
@end
@implementation WTCAllCarsType
-(instancetype)initWithDictionary:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        self.carsTypeArr = [[NSMutableArray alloc]init];
        
        for (NSString *key in dataDic) {
            NSArray *carTypeArr = [dataDic objectForKey:key];
            NSMutableArray *aTypeArr = [[NSMutableArray alloc]init];
            for (int i = 0; i < carTypeArr.count; i++) {
                WTCCarType *atype = [[WTCCarType alloc]initWithDictionary:[carTypeArr objectAtIndex:i]];
                [aTypeArr addObject:atype];
            }
            [self.carsTypeArr addObject:aTypeArr];
        }
    }
    return self;
}


@end
