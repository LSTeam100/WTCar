//
//  WTCarResponse.m
//  WTCar
//
//  Created by apple on 2016/10/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCarResponse.h"

@implementation WTCarResponse
-(BOOL) isSucceed{
    return self.statusCode==0000;
}
@end
