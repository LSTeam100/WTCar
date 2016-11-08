//
//  WTCCarModel.h
//  WTCar
//
//  Created by apple on 2016/11/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTCCarModel : NSObject
@property(nonatomic,strong)NSString *createTime;
@property(nonatomic,strong)NSString *depth;
@property(nonatomic,strong)NSString *fullname;
@property(nonatomic,strong)NSNumber *typeId;
@property(nonatomic,strong)NSString *initial;
@property(nonatomic,strong)NSString *logo;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSNumber *parentid;
@property(nonatomic,strong)NSString *price;
@property(nonatomic,strong)NSString *productionstate;
@property(nonatomic,strong)NSString *salestate;
@property(nonatomic,strong)NSString *sizetype;
@property(nonatomic,strong)NSString *updateTime;
@property(nonatomic,strong)NSString *yeartype;
-(instancetype)initWithDictionary:(NSDictionary *)dataDic;

@end

@interface WTCAllCarsModel : NSObject
@property(nonatomic,strong)NSMutableArray *carsModelArr;
-(instancetype)initWithDictionary:(NSDictionary *)dataDic;
@end
