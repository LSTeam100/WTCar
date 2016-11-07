//
//  WTCLoginRequest.h
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCLoginRequest : WTCarBaseRequest
-(id)initWithLoginName:(NSString *)loginName password:(NSString *)password successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
