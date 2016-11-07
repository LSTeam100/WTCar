//
//  WTCOnSaleList.h
//  WTCar
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTCOnSaleList : NSObject
@property(nonatomic,strong)NSMutableArray *rows;
-(instancetype)initWithDictionary:(NSDictionary *)dataDic;

@end

@interface WTCASale : NSObject
@property(nonatomic,strong)NSNumber *browseNumTimes;
@property(nonatomic,strong)NSString *firstUpTime;
@property(nonatomic,strong)NSNumber *saleId;
@property(nonatomic,strong)NSString *price;
@property(nonatomic,strong)NSArray *primaryPicUrl;
@property(nonatomic,strong)NSString *productName;
@property(nonatomic,strong)NSNumber *telNumTimes;
-(instancetype)initWithDictionary:(NSDictionary *)dataDic;

@end
