//
//  WTCGetUserInfoResult.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCGetUserInfoResult.h"

@implementation WTCGetUserInfoResult
-(instancetype)initWithDictionary:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        if ([dataDic objectForKey:@"headPortraitPath"]) {
            self.headPortraitPath = [dataDic objectForKey:@"headPortraitPath"];
        }
        else
        {
            self.headPortraitPath = @"";
        }
        if ([dataDic objectForKey:@"merchantAddress"]) {
            self.merchantAddress = [dataDic objectForKey:@"merchantAddress"];
        }
        else
        {
            self.merchantAddress = @"";
        }
        if ([dataDic objectForKey:@"merchantDescr"]) {
            self.merchantDescr = [dataDic objectForKey:@"merchantDescr"];
        }
        else
        {
            self.merchantDescr = @"";
        }
        if ([dataDic objectForKey:@"merchantName"]) {
            self.merchantName = [dataDic objectForKey:@"merchantName"];
        }
        else
        {
            self.merchantName = @"";
        }
        if ([dataDic objectForKey:@"mobile"]) {
            self.mobile = [dataDic objectForKey:@"mobile"];
        }
        else
        {
            self.mobile = @"";
        }
        if ([dataDic objectForKey:@"realName"]) {
            self.realName = [dataDic objectForKey:@"realName"];
        }
        else
        {
            self.realName = @"";
        }
        if ([dataDic objectForKey:@"avail"]) {
            self.avail = [dataDic objectForKey:@"avail"];
        }
        else
        {
            self.avail = [NSNumber numberWithInt:0];
        }
        if ([dataDic objectForKey:@"frozen"]) {
            self.frozen = [dataDic objectForKey:@"frozen"];
        }
        else
        {
            self.frozen = [NSNumber numberWithInt:0];
        }
        if ([dataDic objectForKey:@"isBk"]) {
            self.isBk = [[dataDic objectForKey:@"isBk"]integerValue];
        }
        else
        {
            self.isBk = 1;
        }
        if ([dataDic objectForKey:@"isMerchantAudit"]) {
            self.isMerchantAudit = [[dataDic objectForKey:@"isMerchantAudit"] integerValue];
        }
        else
        {
            self.isMerchantAudit = 1;
        }
        if ([dataDic objectForKey:@"isPaypwd"]) {
            self.isPaypwd = [[dataDic objectForKey:@"isPaypwd"]integerValue];
        }
        else
        {
            self.isPaypwd = 1;
        }
        if ([dataDic objectForKey:@"isRealNameAudit"]) {
            self.isRealNameAudit = [[dataDic objectForKey:@"isRealNameAudit"]integerValue];
        }
        else
        {
            self.isRealNameAudit = 1;
        }
        if ([dataDic objectForKey:@"merchantImagePath"]) {
            self.merchantImagePath = [dataDic objectForKey:@"merchantImagePath"];
        }
        else
        {
            self.merchantImagePath = @"";
        }
        if ([dataDic objectForKey:@"nick"]) {
            self.nick = [dataDic objectForKey:@"nick"];
        }
        else
        {
            self.nick = @"";
        }
        if ([dataDic objectForKey:@"idcard"]) {
            self.idcard = [dataDic objectForKey:@"idcard"];
        }
        else
        {
            self.idcard = @"";
 
        }
        if ([dataDic objectForKey:@"city"]) {
            self.city = [dataDic objectForKey:@"city"];
        }
        else
        {
            self.city = @"";
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
