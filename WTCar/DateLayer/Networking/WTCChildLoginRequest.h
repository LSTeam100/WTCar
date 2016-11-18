//
//  WTCChildLoginRequest.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"
@interface WTCChildLoginRequest :WTCarBaseRequest
-(id)initWithChildAccountKey:(NSString *)accountKey MainAccount:(NSString *)account childAccountTele:(NSString *)childAccountMobile successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
