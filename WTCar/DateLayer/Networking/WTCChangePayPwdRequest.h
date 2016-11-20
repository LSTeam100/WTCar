//
//  WTCChangePayPwdRequest.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import"WTCarBaseRequest.h"

@interface WTCChangePayPwdRequest :WTCarBaseRequest
-(id)initChangePayPasswd:(NSString *)nwPayPassword payPassword:(NSString *)payPassword successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
