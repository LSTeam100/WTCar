//
//  WTCGetUserInfoResult.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTCGetUserInfoResult : NSObject
@property(nonatomic,strong)NSString *headPortraitPath;
@property(nonatomic,strong)NSString *merchantAddress;
@property(nonatomic,strong)NSString *merchantDescr;
@property(nonatomic,strong)NSString *merchantName;
@property(nonatomic,strong)NSString *mobile;
@property(nonatomic,strong)NSString *realName;
@property(nonatomic,strong)NSNumber *avail;
@property(nonatomic,strong)NSNumber *frozen;
@property(nonatomic,assign)NSInteger isBk;
@property(nonatomic,assign)NSInteger isMerchantAudit;
@property(nonatomic,assign)NSInteger isPaypwd;
@property(nonatomic,assign)NSInteger isRealNameAudit;
@property(nonatomic,strong)NSString *merchantImagePath;
@property(nonatomic,strong)NSString *nick;
@property(nonatomic,strong)NSString *idcard;
@property(nonatomic,strong)NSString *city;
@property(nonatomic,strong)NSString *province;
-(instancetype)initWithDictionary:(NSDictionary *)dataDic;
@end
