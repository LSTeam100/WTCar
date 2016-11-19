//
//  WTCCashToPasswordViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBaseViewController.h"
#import "define.h"
#import "TTPasswordView.h"
@interface WTCCashToPasswordViewController : WTCBaseViewController
@property(nonatomic) BOOL CashHasCardLogpassword;
@property(nonatomic) BOOL CashNoCardLogpassword;
@property(nonatomic) BOOL CashNoNameNoCardLogpassword;
@property(nonatomic) BOOL AddBankCardHasCardLogpassword;
@property(nonatomic) BOOL AddBankCardNoCardLogpassword;
@property(nonatomic) BOOL AddBankCardNoCardNoNameLogpassword;

/**
 *   密码框
 */
@property(nonatomic,retain)TTPasswordView *password;
@property (weak, nonatomic) IBOutlet UIButton *ConfirmCashButton;
@property (nonatomic,strong)NSString *cashNum;
@end
