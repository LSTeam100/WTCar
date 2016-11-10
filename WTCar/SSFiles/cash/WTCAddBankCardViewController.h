//
//  WTCAddBankCardViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTCAddBankCardViewController : UIViewController
@property(nonatomic) BOOL CashHasNameAndPassword;
@property(nonatomic) BOOL CashNoNameNoPassword;
@property(nonatomic) BOOL CashHasNameNoPassword;
@property(nonatomic) BOOL CashHasPasswordNoName;

@property(nonatomic) BOOL AddBankHasNameAndPassword;
@property(nonatomic) BOOL AddBankNoNameNoPassword;
@property(nonatomic) BOOL AddBankHasNameNoPassword;
@property(nonatomic) BOOL AddBankHasPasswordNoName;
@property (weak, nonatomic) IBOutlet UIButton *ConfirmAddBankCardButton;

@end
