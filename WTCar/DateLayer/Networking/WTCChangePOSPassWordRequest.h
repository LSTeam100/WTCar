//
//  WTCChangePOSPassWordRequest.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCChangePOSPassWordRequest :WTCarBaseRequest
-(id)initWithNewPosLoginPasswd:(NSString *)newPosLoginPasswd PosLoginPasswd:(NSString *)posLoginPasswd Token:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
