//
//  WTCSubUser.m
//  WTCar
//
//  Created by apple on 2016/11/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCSubUser.h"

@implementation WTCSubUser
-(instancetype)initWithDictionary:(NSArray *)dataArr
{
    self = [super init];
    if (self) {
        //        NSArray *dataArr = [dataDic objectForKey:@"rows"];
        self.rows = [[NSMutableArray alloc]init];
        for (int i = 0; i < dataArr.count; i++) {
            NSDictionary *oneDic = [dataArr objectAtIndex:i];
            WTCASubUser *asub = [[WTCASubUser alloc]initWithDictionary:oneDic];
            [self.rows addObject:asub];
        }
    }
    return self;
}

@end

@implementation WTCASubUser

-(instancetype)initWithDictionary:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        if ( [dataDic objectForKey:@"childAccountName"]) {
            self.childAccountName = [dataDic objectForKey:@"childAccountName"];
        }
        else
        {
            self.childAccountName = @"0";
        }
        if ( [dataDic objectForKey:@"childAccountMobile"]) {
            self.childAccountMobile = [dataDic objectForKey:@"childAccountMobile"];
        }
    }
    return self;
}
@end

