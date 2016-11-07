//
//  WTCOnShelfRequest.h
//  WTCar
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WTCarBaseRequest.h"
@interface WTCOnShelfRequest : WTCarBaseRequest
-(id)initWithToken:(NSString *)token OnShelfId:(NSNumber *)onShelfId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;

@end
