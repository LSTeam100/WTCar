//
//  WTCChekVerityCodeRequest.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCChekVerityCodeRequest :WTCarBaseRequest
-(id)initWithLoginName:(NSString *)loginName Code:(NSString *)code successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
