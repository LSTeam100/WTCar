//
//  WTCGetShopInfoResult.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTCGetShopInfoResult : NSObject
@property(nonatomic,strong)NSString *merchantAddress;
@property(nonatomic,strong)NSString *merchantDescr;
@property(nonatomic,strong)NSString *merchantImagePath;
@property(nonatomic,strong)NSString *merchantName;
@property(nonatomic,strong)NSString *mobile;
@property(nonatomic,strong)NSString *nick;
@end
