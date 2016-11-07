//
//  WTCUpStoreInfoRequest.h
//  WTCar
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCUpStoreInfoRequest : WTCarBaseRequest
-(id)initWithToken:(NSString *)token MerchantAddress:(NSNumber *)merchantAddress MerchantDescr:(NSNumber *)merchantDescr MerchantImage_path:(NSString *)merchantImage_path MerchantName:(NSString *)merchantName Nick:(NSString *)nick Mobile:(NSString *)mobile successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;

@end
