//
//  WTCBannerRequest.h
//  WTCar
//
//  Created by apple on 2016/11/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCBannerRequest : WTCarBaseRequest
-(id)initWithBanner:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;

@end
