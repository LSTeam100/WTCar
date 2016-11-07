//
//  WTCCarBrand.m
//  WTCar
//
//  Created by apple on 2016/11/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCarBrand.h"

@implementation WTCCarBrand
-(instancetype)initWithDictionary:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        if ([dataDic objectForKey:@"id"]) {
            self.brandId = [dataDic objectForKey:@"id"];
        }
        else
        {
            self.brandId = [NSNumber numberWithLong:0];
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


    }
    return self;
}

@end

@implementation WTCAllCarBrands

-(instancetype)initWithDictionary:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        self.brandsArr = [[NSMutableArray alloc]init];
        
        for (NSString *key in dataDic) {
            NSArray *brandArr = [dataDic objectForKey:key];
            for (int i = 0; i < brandArr.count; i++) {
                WTCCarBrand *abrand = [[WTCCarBrand alloc]initWithDictionary:[brandArr objectAtIndex:i]];
                [self.brandsArr addObject:abrand];
            }

        }
    }
    return self;
}

@end
