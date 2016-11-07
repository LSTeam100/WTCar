//
//  WTCarSaledRequest.h
//  WTCar
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCarSaledRequest : WTCarBaseRequest
-(id)initWithToken:(NSString *)token OffShelfId:(NSNumber *)offShelfId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;

@end
