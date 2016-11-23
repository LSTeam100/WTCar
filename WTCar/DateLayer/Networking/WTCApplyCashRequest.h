//
//  WTCApplyCashRequest.h
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//
#import "WTCarBaseRequest.h"

@interface WTCApplyCashRequest : WTCarBaseRequest
-(id)initWithApplyCash:(NSString *)amount Token:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
