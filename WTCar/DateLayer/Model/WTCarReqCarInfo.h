//
//  WTCarReqCarInfo.h
//  WTCar
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCarReqCarInfo : WTCarBaseRequest
@property(nonatomic,strong)NSString *firstUpTime;
@property(nonatomic,strong)NSNumber *carReqId;
@property(nonatomic,strong)NSString *price;
@property(nonatomic,strong)NSString *primaryPicUrl;
@property(nonatomic,strong)NSString *productName;

@end
