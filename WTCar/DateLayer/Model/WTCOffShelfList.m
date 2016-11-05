//
//  WTCOffShelfList.m
//  WTCar
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCOffShelfList.h"

@implementation WTCOffShelfList
-(instancetype)initWithDictionary:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        NSArray *dataArr = [dataDic objectForKey:@"rows"];
        self.rows = [[NSMutableArray alloc]init];
        for (int i = 0; i < dataArr.count; i++) {
            NSDictionary *oneDic = [dataArr objectAtIndex:i];
            WTCAOffShelf *asale = [[WTCAOffShelf alloc]initWithDictionary:oneDic];
            [self.rows addObject:asale];
        }
    }
    return self;
}

@end

@implementation WTCAOffShelf

-(instancetype)initWithDictionary:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        if ( [dataDic objectForKey:@"firstUpTime"]) {
            self.firstUpTime = [dataDic objectForKey:@"firstUpTime"];
        }
        else
        {
            self.firstUpTime = @"0";
        }
        if ( [dataDic objectForKey:@"id"]) {
            self.saleId = [dataDic objectForKey:@"id"];
        }
        else
        {
            self.saleId = [NSNumber numberWithDouble:0];
        }
        if ( [dataDic objectForKey:@"price"]) {
            self.price = [dataDic objectForKey:@"price"];
        }
        else
        {
            self.price = @"";
        }
        if ( [dataDic objectForKey:@"primaryPicUrl"]) {
            self.primaryPicUrl = [dataDic objectForKey:@"primaryPicUrl"];
        }
        else
        {
            self.primaryPicUrl = @[];
        }
        if ( [dataDic objectForKey:@"productName"]) {
            self.productName = [dataDic objectForKey:@"productName"];
        }
        else
        {
            self.productName = @"";
        }
    }
    return self;
}


@end
