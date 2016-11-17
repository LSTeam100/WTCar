//
//  WTCGetCashListResult.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTCGetCashListResult : NSObject
@property(nonatomic,strong)NSMutableArray *rows;
-(instancetype)initWithDictionary:(NSArray *)dataArr;
@end

@interface WTCACash : NSObject
@property(nonatomic,strong)NSNumber *amount;
@property(nonatomic,strong)NSString *createTime;
@property(nonatomic,strong)NSNumber *status;
@property(nonatomic,strong)NSString *withdrawNum;
-(instancetype)initWithDictionary:(NSDictionary *)dataDic;

@end
