//
//  WTCCashWithCardNameViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBaseViewController.h"
#import "UPMBaseCustomNavBarViewController.h"
@interface WTCCashWithCardNameViewController : UPMBaseCustomNavBarViewController
@property (weak, nonatomic) IBOutlet UILabel *UserNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *UserCardLabel;
@property (weak, nonatomic) IBOutlet UILabel *CardAddressLabel;
@property (weak, nonatomic) IBOutlet UITextField *CashNumTextField;
@property (weak, nonatomic) IBOutlet UIButton *NextStepButton;
@property(assign,nonatomic) BOOL isWidhtdraw;
@property(nonatomic) BOOL CashHasPasswordAndName;

@end
