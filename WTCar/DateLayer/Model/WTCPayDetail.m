//
//  WTCPayDetail.m
//  WTCar
//
//  Created by apple on 2016/11/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCPayDetail.h"

@implementation WTCPayDetail
-(instancetype)initWithDictionary:(NSDictionary *)dataDic
{
    self = [super init];
    if (self) {
        self.payDetailsArr = [[NSMutableArray alloc]init];
        if ([dataDic objectForKey:@"amount"]) {
            self.amount = [dataDic objectForKey:@"amount"];
        }
        else
        {
            self.amount = @"";
        }
        
        if ([dataDic objectForKey:@"status"]) {
            self.status = [dataDic objectForKey:@"status"];
        }
        else
        {
            self.status = @"";
        }
        
        if ([dataDic objectForKey:@"payDetails"]) {
            NSArray *detailArr = [dataDic objectForKey:@"payDetails"];
            WTCPayOneDetail *oneDetail = [[WTCPayOneDetail alloc]initWithDictionary:detailArr];
//            for (; <#condition#>; <#increment#>) {
//                <#statements#>
//            }
            
        }
        else{
            self.payDetailsArr = [NSMutableArray arrayWithCapacity:0];
        }
        
    }
    return self;
}
@end

@implementation WTCPayOneDetail

-(instancetype)initWithDictionary:(NSArray *)dataArr
{
    self = [super init];
    if (self) {
//        if (<#condition#>) {
//            <#statements#>
//        }
//        "amount": 7.00,
//        "createTime": "2016-10-31 17:25:47",
//        "id": 1,
//        "payTime": "2016-10-31 17:25:45",
//        "pid": 1,
//        "updateTime": "2016-10-31 17:25:49"

        
    }
    return self;
}


@end
