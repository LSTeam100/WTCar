//
//  WTCApplyLoanRequest.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCApplyLoanRequest :WTCarBaseRequest
-(id)initWithAmount:(NSString *)amount Token:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
