//
//  WTCCheckPayPwdRequest.h
//  WTCar
//
//  Created by apple on 2016/11/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCCheckPayPwdRequest : WTCarBaseRequest
-(id)initWithPayPasswd:(NSString *)token PayPassword:(NSString *)payPassword successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
