//
//  WTCGetBankCardInfoResult.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTCGetBankCardInfoResult : NSObject
@property(nonatomic,strong) NSString *bankNum;
@property(nonatomic,strong) NSString *openedBank;
@property(nonatomic,strong) NSNumber *realName;
@end
