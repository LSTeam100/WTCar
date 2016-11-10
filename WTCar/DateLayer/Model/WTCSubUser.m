//
//  WTCSubUser.m
//  WTCar
//
//  Created by apple on 2016/11/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCSubUser.h"

@implementation WTCSubUser
-(instancetype)initWithDictionary:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        if ([dataDic objectForKey:@"id"]) {
            self.subUserId = [dataDic objectForKey:@"id"];
        }
        else
        {
            self.subUserId = [NSNumber numberWithLong:0];
        }
        if ([dataDic objectForKey:@"childAccountMobile"]) {
            self.childAccountMobile = [dataDic objectForKey:@"childAccountMobile"];
        }
        else
        {
            self.childAccountMobile = [NSNumber numberWithLong:0];
        }
        if ([dataDic objectForKey:@"childAccountName"]) {
            self.childAccountName = [dataDic objectForKey:@"childAccountName"];
        }
        else
        {
            self.childAccountName = @"";
        }
    }
    return self;
}

@end

