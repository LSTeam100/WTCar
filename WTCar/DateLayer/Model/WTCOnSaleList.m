//
//  WTCOnSaleList.m
//  WTCar
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCOnSaleList.h"

@implementation WTCOnSaleList

-(instancetype)initWithDictionary:(NSArray *)dataArr
{
    self = [super init];
    if (self) {
        
//        if ([dataDic objectForKey:@"rows"]) {
//            NSArray *dataArr = [dataDic objectForKey:@"rows"];
            self.rows = [[NSMutableArray alloc]init];
            for (int i = 0; i < dataArr.count; i++) {
                NSDictionary *oneDic = [dataArr objectAtIndex:i];
                WTCASale *asale = [[WTCASale alloc]initWithDictionary:oneDic];
                [self.rows addObject:asale];
            }
//        }
    }
    return self;
}



@end

@implementation WTCASale
-(instancetype)initWithDictionary:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        if ( [dataDic objectForKey:@"browseNumTimes"]) {
            self.browseNumTimes = [dataDic objectForKey:@"browseNumTimes"];
        }
        else
        {
            self.browseNumTimes = [NSNumber numberWithDouble:0];
        }
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
        if ( [dataDic objectForKey:@"telNumTimes"]) {
            self.telNumTimes = [dataDic objectForKey:@"telNumTimes"];
        }
        else
        {
            self.telNumTimes = [NSNumber numberWithDouble:0];
        }
        if ([dataDic objectForKey:@"saledDays"]) {
            self.saledDays = [dataDic objectForKey:@"saledDays"];
        }
        else
        {
            self.saledDays = [NSNumber numberWithLong:0];
        }
        
    }
    return self;
}

@end
