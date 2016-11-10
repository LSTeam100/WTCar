//
//  WTCIdcardverifyRequest.h
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//
#import "WTCarBaseRequest.h"

@interface WTCIdcardverifyRequest : WTCarBaseRequest
-(id)initWithIdcardverify:(NSString *)idcard realName:(NSString *)realName successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
