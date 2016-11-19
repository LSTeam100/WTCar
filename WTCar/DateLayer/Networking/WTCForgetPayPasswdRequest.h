//
//  WTCForgetPayPasswdRequest.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import"WTCarBaseRequest.h"

@interface WTCForgetPayPasswdRequest :WTCarBaseRequest
-(id)initWithCode:(NSString *)verityCode payPassword:(NSString *)payPassword successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
