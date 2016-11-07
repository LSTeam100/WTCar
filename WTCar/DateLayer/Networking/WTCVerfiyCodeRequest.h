//
//  WTCVerfiyCodeRequest.h
//  WTCar
//
//  Created by apple on 2016/11/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTCarBaseRequest.h"
@interface WTCVerfiyCodeRequest : WTCarBaseRequest
-(id)initWithLoginName:(NSString *)loginName password:(NSString *)password successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
@end
