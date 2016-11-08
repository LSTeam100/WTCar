//
//  WTCChangeAccountKeyRequest.h
//  WTCar
//
//  Created by apple on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//
#import "WTCarBaseRequest.h"

@interface WTCChangePayPasswdRequest : WTCarBaseRequest
-(id)initChangeAccountKey:(NSString *)accountKey nwAccountKey:(NSString *)nwAccountKey successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
