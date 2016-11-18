//
//  WTCPOSPayRequest.h
//  WTCar
//
//  Created by apple on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCPOSPayRequest : WTCarBaseRequest
-(id)initWithToken:(NSString *)token ProductId:(NSNumber *)productId OrderPrice:(double)orderPrice successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
