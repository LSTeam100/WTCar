//
//  WTCCarModelRequest.h
//  WTCar
//
//  Created by apple on 2016/11/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCCarModelRequest : WTCarBaseRequest
-(id)initWithToken:(NSString *)token ModelId:(NSNumber *)modelId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
