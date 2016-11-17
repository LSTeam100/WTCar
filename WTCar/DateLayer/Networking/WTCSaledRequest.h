//
//  WTCSaledRequest.h
//  WTCar
//
//  Created by apple on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCSaledRequest : WTCarBaseRequest
-(id)initWithToken:(NSString *)token SaledId:(NSNumber *)saledId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;

@end
