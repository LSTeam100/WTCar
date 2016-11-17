//
//  WTCGetLoanListResult.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTCGetLoanListResult : NSObject
@property(nonatomic,strong)NSMutableArray *rows;
-(instancetype)initWithDictionary:(NSArray *)dataArr;
@end

@interface WTCALoan : NSObject
@property(nonatomic,strong)NSString *amount;
@property(nonatomic,strong)NSNumber *status;
@property(nonatomic,strong)NSString *updateTime;

-(instancetype)initWithDictionary:(NSDictionary *)dataDic;

@end
