//
//  WTCarResponse.h
//  WTCar
//
//  Created by apple on 2016/10/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTCarResponse : NSObject
@property (nonatomic)int statusCode;

@property (strong, nonatomic) NSString* errorMessage;

@property (strong, nonatomic) id data;

-(BOOL) isSucceed;
@end
