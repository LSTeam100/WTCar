//
//  WTCToPayList.h
//  WTCar
//
//  Created by apple on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTCToPayList : NSObject
@property(nonatomic,strong)NSString *amount;
@property(nonatomic,strong)NSString *createTime;
@property(nonatomic,strong)NSString *toPosPayListId;
@property(nonatomic,strong)NSNumber *orderPrice;
@property(nonatomic,strong)NSString *payBarCode;
@property(nonatomic,strong)NSString *payBarCodePicPath;
@property(nonatomic,strong)NSString *payTime;
@property(nonatomic,strong)NSString *posId;
@property(nonatomic,strong)NSString *productId;
@property(nonatomic,strong)NSString *receiptType;
@property(nonatomic,strong)NSString *status;
@property(nonatomic,strong)NSString *summitTime;
@property(nonatomic,strong)NSString *updateTime;

@end
