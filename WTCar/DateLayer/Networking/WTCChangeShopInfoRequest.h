//
//  WTCChangeShopInfoRequest.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCChangeShopInfoRequest :WTCarBaseRequest
-(id)initWithmerchanAddress:(NSString *)merchanAddress merchanDescr:(NSString *)merchanDescr merchanImage_path:(NSString *)merchanImage_path merchanName:(NSString *)merchanName mobile:(NSString *)mobile nick:(NSString *)nick token:(NSString *)token successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
