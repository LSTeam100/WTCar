//
//  WTCarDetailModel.h
//  WTCar
//
//  Created by apple on 2016/11/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTCarDetailModel : NSObject
@property(nonatomic,strong)NSString *firstUpTime;
@property(nonatomic,strong)NSString *carDetialId;
@property(nonatomic,strong)NSString *price;
@property(nonatomic,strong)NSArray *primaryPicUrlArr;
@property(nonatomic,strong)NSString *productName;
@property(nonatomic,strong)NSString *cbrand;
@property(nonatomic,strong)NSString *city;
@property(nonatomic,strong)NSString *cmodel;
@property(nonatomic,strong)NSString *ctype;
@property(nonatomic,strong)NSString *miles;
@property(nonatomic,strong)NSNumber *oldCarId;
@property(nonatomic,strong)NSString *productDescr;
@property(nonatomic,strong)NSString *province;


-(instancetype)initWithDictionary:(NSDictionary *)dataDic;

@end
