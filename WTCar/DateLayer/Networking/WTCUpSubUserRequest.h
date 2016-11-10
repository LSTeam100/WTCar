//
//  WTCUpSubUserRequest.h
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//
#import "WTCarBaseRequest.h"

@interface WTCUpSubUserRequest : WTCarBaseRequest
-(id)initWithUpSubUser:(NSNumber *)subUserId  ChildAccountMobile:(NSString *)childAccountMobile ChildAccountName:(NSString *)childAccountName successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
