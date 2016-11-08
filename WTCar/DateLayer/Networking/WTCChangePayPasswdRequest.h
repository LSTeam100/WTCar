//
//  WTCResetPayPasswdRequest.h
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//
#import "WTCarBaseRequest.h"

@interface WTCChangePayPasswdRequest : WTCarBaseRequest

-(id)initChangePayPasswd:(NSString *)nwPayPassword payPassword:(NSString *)payPassword successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
