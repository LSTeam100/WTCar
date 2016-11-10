//
//  WTCBindBankCardRequest.h
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//
#import "WTCarBaseRequest.h"

@interface WTCBindBankCardRequest : WTCarBaseRequest
-(id)initWithBindBankCard:(NSString *)bankcard  openedBank:(NSString *)openedBank  successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
