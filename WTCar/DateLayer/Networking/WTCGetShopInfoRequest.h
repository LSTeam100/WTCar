//
//  WTCGetShopInfoRequest.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCGetShopInfoRequest :WTCarBaseRequest
-(id)initWithAccountToken:(NSString *)accountToken  successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
