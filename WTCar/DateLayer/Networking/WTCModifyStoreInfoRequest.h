//
//  WTCModifyStoreInfoRequest.h
//  WTCar
//
//  Created by apple on 2016/11/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCModifyStoreInfoRequest : WTCarBaseRequest
//-(id)initModifyStoreInfo:(NSString *)token UpdataKey:(NSString *)updataKey UpdataValue:(NSString *)updataValue successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;
-(id)initModifyStoreInfo:(NSString *)token DataDic:(NSDictionary *)dataDic   successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;

@end
