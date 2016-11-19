//
//  WTCBanner.h
//  WTCar
//
//  Created by apple on 2016/11/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTCBanner : NSObject

@property(nonatomic,strong)NSMutableArray *bannerArr;
-(instancetype)initWithDictionary:(NSArray *)dataArr;

@end

@interface WTCOneBanner : NSObject
@property(nonatomic,strong)NSString *clickurl;
@property(nonatomic,strong)NSString *createTime;
@property(nonatomic,strong)NSString *bannerId;
@property(nonatomic,strong)NSString *picUrl;
@property(nonatomic,strong)NSString *postype;
@property(nonatomic,strong)NSString *sortnum;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *updateTime;
-(instancetype)initWithDictionary:(NSDictionary *)dataDic;
@end
