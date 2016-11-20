//
//  WTCCarDetailRequest.h
//  WTCar
//
//  Created by apple on 2016/11/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCCarDetailRequest : WTCarBaseRequest
-(id)initWithToken:(NSString *)token CarDetailId:(NSNumber *)carDetailId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
