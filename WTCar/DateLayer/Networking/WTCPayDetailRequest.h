//
//  WTCPayDetailRequest.h
//  WTCar
//
//  Created by apple on 2016/11/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCPayDetailRequest : WTCarBaseRequest
-(id)initWithToken:(NSString *)token POSId:(NSNumber *)posId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;

@end
