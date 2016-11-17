//
//  WTCForgetLoginPasswordRequest.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCForgetLoginPasswordRequest :WTCarBaseRequest
-(id)initWithLoginName:(NSString *)loginName password:(NSString *)password VerityCode:(NSString *)code successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
