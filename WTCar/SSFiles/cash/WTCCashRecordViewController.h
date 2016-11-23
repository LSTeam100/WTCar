//
//  WTCCashRecordViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBaseViewController.h"

@interface WTCCashRecordViewController : WTCBaseViewController
@property (weak, nonatomic) IBOutlet UILabel *CashDanHaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *CashMoneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *CashStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *CashTimeLabel;
@property(nonatomic,strong)NSMutableArray *itemArr;
@end
