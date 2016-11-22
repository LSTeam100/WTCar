//
//  WTCGetBankCardInfoResult.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import"WTCarBaseRequest.h"

@interface WTCGetBankCardInfoResult :WTCarBaseRequest
@property(nonatomic,strong) NSString *bankNum;
@property(nonatomic,strong) NSString *openedBank;
@property(nonatomic,strong) NSString *realName;
@end
