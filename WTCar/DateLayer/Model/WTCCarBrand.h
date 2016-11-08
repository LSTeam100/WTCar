//
//  WTCCarBrand.h
//  WTCar
//
//  Created by apple on 2016/11/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTCCarBrand : NSObject
@property(nonatomic,strong)NSNumber *brandId;
@property(nonatomic,strong)NSString *initial;
@property(nonatomic,strong)NSString *logo;
@property(nonatomic,strong)NSString *name;
-(instancetype)initWithDictionary:(NSDictionary *)dataDic;
@end

@interface WTCAllCarBrands : NSObject
@property(nonatomic,strong)NSMutableArray *brandsArr;
-(instancetype)initWithDictionary:(NSDictionary *)dataDic;
@end
