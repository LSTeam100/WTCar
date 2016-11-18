//
//  WTCPayDetail.h
//  WTCar
//
//  Created by apple on 2016/11/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTCPayDetail : NSObject
@property(nonatomic,strong)NSString *amount;
@property(nonatomic,strong)NSString *status;
@property(nonatomic,strong)NSMutableArray *payDetailsArr;
-(instancetype)initWithDictionary:(NSDictionary *)dataDic;
@end

@interface WTCPayOneDetail : NSObject
@property(nonatomic,strong)NSString *amount;
@property(nonatomic,strong)NSString *createTime;
@property(nonatomic,strong)NSString *oneDetailId;
@property(nonatomic,strong)NSString *payTime;
@property(nonatomic,strong)NSString *pid;
@property(nonatomic,strong)NSString *updateTime;
-(instancetype)initWithDictionary:(NSDictionary *)dataDic;

@end
