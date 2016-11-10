//
//  WTCDelSubUserRequest.h
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//
#import "WTCarBaseRequest.h"

@interface WTCDelSubUserRequest : WTCarBaseRequest
-(id)initWithDelSubUser:(NSNumber *)subUserId  successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
