//
//  WTCReqCarInfoRequest.h
//  WTCar
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCReqCarInfoRequest : WTCarBaseRequest
-(id)initWithToken:(NSString *)token ReqCarInfoId:(NSNumber *)reqCarInfoId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
