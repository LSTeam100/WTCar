//
//  WTCAddSubUserRequest.h
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//
#import "WTCarBaseRequest.h"

@interface WTCAddSubUserRequest : WTCarBaseRequest
-(id)initWithAddSubUser:(NSString *)childAccountName  childAccountMobile:(NSString *)childAccountMobile  successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
