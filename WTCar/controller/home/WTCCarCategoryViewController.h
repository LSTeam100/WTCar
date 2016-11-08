//
//  WTCCarCategoryViewController.h
//  WTCar
//
//  Created by apple on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBaseViewController.h"
#import "WTCCarModel.h"
#import "WTCCarType.h"
#import "WTCCarBrand.h"

@protocol carCategoryDelegate <NSObject>

-(void)selectBrand:(WTCCarBrand *)brand type:(WTCCarType *)type Model:(WTCCarModel *)model;

@end

@interface WTCCarCategoryViewController : WTCBaseViewController
@property(nonatomic,weak)id delegate;

@end
