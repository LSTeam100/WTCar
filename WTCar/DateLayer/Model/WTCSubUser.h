//
//  WTCSubUser.h
//  WTCar
//
//  Created by apple on 2016/11/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTCSubUser : NSObject

@property(nonatomic,strong)NSMutableArray *rows;
-(instancetype)initWithDictionary:(NSArray *)dataArr;
@end


@interface WTCASubUser : NSObject
//@property(nonatomic,strong)NSNumber *subUserId;
@property(nonatomic,strong)NSNumber *childAccountMobile;
@property(nonatomic,strong)NSString *childAccountName;

-(instancetype)initWithDictionary:(NSDictionary *)dataDic;

@end
