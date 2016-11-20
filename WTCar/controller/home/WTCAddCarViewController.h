//
//  WTCAddCarViewController.h
//  WTCar
//
//  Created by apple on 2016/10/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBaseViewController.h"
#import "WTCCarDescribetionViewController.h"
#import "WTCCarCategoryViewController.h"
@interface WTCAddCarViewController : WTCBaseViewController<DescribetionControllerDelegate,carCategoryDelegate>

@property(nonatomic,assign)NSInteger editeStatus;
@property(nonatomic,strong)NSNumber *carDetailId;

@end
