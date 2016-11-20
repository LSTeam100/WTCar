//
//  WTCarDetailModel.m
//  WTCar
//
//  Created by apple on 2016/11/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarDetailModel.h"

@implementation WTCarDetailModel
-(instancetype)initWithDictionary:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        if ([dataDic objectForKey:@"firstUpTime"]) {
            self.firstUpTime = [dataDic objectForKey:@"firstUpTime"];
        }
        else
        {
            self.firstUpTime = @"";
        }
        if ([dataDic objectForKey:@"id"]) {
            self.carDetialId = [dataDic objectForKey:@"id"];
        }
        else
        {
            self.carDetialId = @"0";
        }
        if ([dataDic objectForKey:@"price"]) {
            self.price = [dataDic objectForKey:@"price"];
        }
        else
        {
            self.price = @"99999999";
        }
        if ([dataDic objectForKey:@"primaryPicUrl"]) {
            self.primaryPicUrlArr = [dataDic objectForKey:@"primaryPicUrl"];
        }
        else
        {
            self.primaryPicUrlArr = @[];
        }
        if ([dataDic objectForKey:@"productName"]) {
            self.productName = [dataDic objectForKey:@"productName"];
        }
        else
        {
            self.productName = @"";
        }
        if ([dataDic objectForKey:@"cbrand"]) {
            self.cbrand = [dataDic objectForKey:@"cbrand"];
        }
        else
        {
            self.cbrand = @"";
        }
        if ([dataDic objectForKey:@"city"]) {
            self.city = [dataDic objectForKey:@"city"];
        }
        else
        {
            self.city = @"";
        }
        if ([dataDic objectForKey:@"cmodel"]) {
            self.cmodel = [dataDic objectForKey:@"cmodel"];
        }
        else
        {
            self.cmodel = @"";
        }
        if ([dataDic objectForKey:@"ctype"]) {
            self.ctype = [dataDic objectForKey:@"ctype"];
        }
        else
        {
            self.ctype = @"";
        }
        if ([dataDic objectForKey:@"miles"]) {
            self.miles = [dataDic objectForKey:@"miles"];
        }
        else
        {
            self.miles = @"0";
        }
        if ([dataDic objectForKey:@"oldCarId"]) {
            self.oldCarId = [dataDic objectForKey:@"oldCarId"];
        }
        else
        {
            self.oldCarId = [NSNumber numberWithInt:0];
        }
        if ([dataDic objectForKey:@"productDescr"]) {
            self.productDescr = [dataDic objectForKey:@"productDescr"];
        }
        else
        {
            self.productDescr = @"";
        }
        if ([dataDic objectForKey:@"province"]) {
            self.province = [dataDic objectForKey:@"province"];
        }
        else
        {
            self.province = @"";
        }
        
    }
    return self;
}


@end
