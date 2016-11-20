//
//  WTCarUpdataCarInfo.h
//  WTCar
//
//  Created by apple on 2016/11/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarBaseRequest.h"

@interface WTCarUpdataCarInfo : WTCarBaseRequest
-(id)initWithToken:(NSString *)token CBrand:(NSString *)cbrand CModel:(NSString *)cModel Ctype:(NSString *)ctype City:(NSString *)city FirstUpTime:(NSString *)firstUptime HeaderPic:(NSString *)headerPic Miles:(NSNumber *)miles PicList:(NSMutableArray *)picList Price:(NSString *)price Product_descr:(NSString *)product_descr Province:(NSString *)province Sid:(NSNumber *)sid ModifyId:(NSNumber *)modifyId successCallback:(onSuccessCallback)success failureCallback:(onFailureCallback)failed;

@end
