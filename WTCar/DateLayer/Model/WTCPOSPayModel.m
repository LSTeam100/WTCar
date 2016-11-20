//
//  WTCPOSPayModel.m
//  WTCar
//
//  Created by apple on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCPOSPayModel.h"

@implementation WTCPOSPayModel
-(instancetype)initWithDictionary:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        
        if ([dataDic objectForKey:@"amount"]) {
            self.amount = [dataDic objectForKey:@"amount"];
        }
        else{
            self.amount = @"";
        }
        if ([dataDic objectForKey:@"createTime"]) {
            self.createTime = [dataDic objectForKey:@"createTime"];
        }
        else{
            self.createTime = @"";
        }
        
        if ([dataDic objectForKey:@"id"]) {
            self.posPayId = [dataDic objectForKey:@"id"];
            
        }
        else
        {
            self.posPayId = @"";
        }

        if ([dataDic objectForKey:@"orderPrice"]) {
            self.orderPrice = [dataDic objectForKey:@"orderPrice"];
        }
        else
        {
            self.orderPrice = [NSNumber numberWithInt:99999999];
        }
        
        if ([dataDic objectForKey:@"payBarCode"]) {
            self.payBarCode = [dataDic objectForKey:@"payBarCode"];
        }
        else
        {
            self.payBarCode = @"";
        }
        if ([dataDic objectForKey:@"payBarCodePicPath"]) {
            self.payBarCodePicPath = [dataDic objectForKey:@"payBarCodePicPath"];
        }
        else
        {
            self.payBarCodePicPath = @"";
        }
        if ([dataDic objectForKey:@"payTime"]) {
            self.payTime = [dataDic objectForKey:@"payTime"];
        }
        else
        {
            self.payTime = @"";
        }
        if ([dataDic objectForKey:@"posId"]) {
            self.posId = [dataDic objectForKey:@"posId"];
        }
        else
        {
            self.posId = @"";
        }
        if ([dataDic objectForKey:@"productId"]) {
            self.productId = [dataDic objectForKey:@"productId"];
        }
        else
        {
            self.productId = @"";
        }
        
        if ([dataDic objectForKey:@"receiptType"]) {
            self.receiptType = [dataDic objectForKey:@"receiptType"];
        }
        else
        {
            self.receiptType = @"";
        }
        if ([dataDic objectForKey:@"status"]) {
            self.status = [dataDic objectForKey:@"status"];
        }
        else
        {
            self.status = @"";
        }
        if ([dataDic objectForKey:@"summitTime"]) {
            self.summitTime = [dataDic objectForKey:@"summitTime"];
        }
        else
        {
            self.summitTime = @"";
        }
        if ([dataDic objectForKey:@"updateTime"]) {
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
