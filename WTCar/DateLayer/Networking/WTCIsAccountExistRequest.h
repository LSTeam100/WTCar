//
//  WTCIsAccountExistRequest.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCIsAccountExistRequest :WTCarBaseRequest
-(id)initWithLoginName:(NSString *)LoginName successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
