//
//  WTCarOffShelfListRequest.h
//  WTCar
//
//  Created by apple on 2016/11/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCarOffShelfListRequest : WTCarBaseRequest
-(id)initWithToken:(NSString *)token CurPage:(NSNumber *)curPage PageSize:(NSNumber *)pageSize successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;

@end
