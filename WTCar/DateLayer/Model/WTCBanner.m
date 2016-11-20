//
//  WTCBanner.m
//  WTCar
//
//  Created by apple on 2016/11/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBanner.h"

@implementation WTCBanner
-(instancetype)initWithDictionary:(NSArray *)dataArr
{
    self = [super init];
    if (self) {
        self.bannerArr = [[NSMutableArray alloc]init];
        
        for (int i = 0;i < dataArr.count ; i++) {
            NSDictionary *oneBannerDic = [dataArr objectAtIndex:i];
            WTCOneBanner *oneBanner = [[WTCOneBanner alloc]initWithDictionary:oneBannerDic];
            [self.bannerArr addObject:oneBanner];
        }
        
        
        
    }
    return self;
}

@end


@implementation WTCOneBanner

-(instancetype)initWithDictionary:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        
        if ([dataDic objectForKey:@"clickurl"]) {
            self.clickurl = [dataDic objectForKey:@"clickurl"];
        }
        else
        {
            self.clickurl = @"";
        }
        if ([dataDic objectForKey:@"createTime"]) {
            self.createTime = [dataDic objectForKey:@"createTime"];
        }
        else
        {
            self.createTime = @"0";
        }
        if ([dataDic objectForKey:@"id"]) {
            self.bannerId = [dataDic objectForKey:@"id"];
        }
        else
        {
            self.bannerId = @"";
        }
        if ([dataDic objectForKey:@"picurl"]) {
            self.picUrl = [dataDic objectForKey:@"picurl"];
        }
        else
        {
            self.picUrl = @"";
        }
        if ([dataDic objectForKey:@"postype"]) {
            self.postype = [dataDic objectForKey:@"postype"];
        }
        else
        {
            self.postype = @"";
        }
        if ([dataDic objectForKey:@"sortnum"]) {
            self.sortnum = [dataDic objectForKey:@"sortnum"];
        }
        else
        {
            self.sortnum =@"0";
        }
        if ([dataDic objectForKey:@"title"]) {
            self.title = [dataDic objectForKey:@"title"];
        }
        else
        {
            self.title = @"";
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
