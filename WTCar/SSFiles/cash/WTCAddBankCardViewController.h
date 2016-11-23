//
//  WTCAddBankCardViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import"WTCBaseViewController.h"
#import "WTCGetUserInfoResult.h"
#import "UPMBaseCustomNavBarViewController.h"
@interface WTCAddBankCardViewController :UPMBaseCustomNavBarViewController
@property(nonatomic) BOOL CashHasNameAndPassword;
@property(nonatomic) BOOL CashNoNameNoPassword;
@property(nonatomic) BOOL CashHasNameNoPassword;
@property(nonatomic) BOOL CashHasPasswordNoName;

@property(nonatomic) BOOL AddBankHasNameAndPassword;
@property(nonatomic) BOOL AddBankNoNameNoPassword;
@property(nonatomic) BOOL AddBankHasNameNoPassword;
@property(nonatomic) BOOL AddBankHasPasswordNoName;
@property (weak, nonatomic) IBOutlet UIButton *ConfirmAddBankCardButton;
@property (weak, nonatomic) IBOutlet UITextField *BankCardTextField;
@property (weak, nonatomic) IBOutlet UITextField *userTeleNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *openBankCardAddressTextField;
@property (weak, nonatomic) IBOutlet UILabel *uesrIdNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property(nonatomic,assign)BOOL isWidthdraw;
@property(nonatomic,strong)NSString *idcard;
@property(nonatomic,strong)WTCGetUserInfoResult *userInfoResult;

@end
