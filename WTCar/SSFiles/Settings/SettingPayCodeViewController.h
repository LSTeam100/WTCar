//
//  SettingPayCodeViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBaseViewController.h"
#import "define.h"
#import "TTPasswordView.h"
#import "WTCGetUserInfoResult.h"
#import "UPMBaseCustomNavBarViewController.h"

@interface SettingPayCodeViewController : UPMBaseCustomNavBarViewController<UPMNavigationBarDelegate>
@property(nonatomic) BOOL OnlySetpassword;
@property(nonatomic) BOOL CashHasNameSetpassword;
@property(nonatomic) BOOL CashNoNameSetpassword;
@property(nonatomic) BOOL AddBankCardHasNameSetpassword;
@property(nonatomic) BOOL AddBankCardNoNameSetpassword;
/**
 *   密码框
 */
@property(nonatomic,retain)TTPasswordView *password;
@property(nonatomic,retain)TTPasswordView *password2;

@property(nonatomic,strong)WTCGetUserInfoResult *userInfoResult;
/**
 *  第一次输入的密码
 */
@property(nonatomic,copy)NSString *firstCode;
//第一次输入密码标题
@property (weak, nonatomic) IBOutlet UILabel *FirstCodeLabel;
//第二次输入密码标题
@property (weak, nonatomic) IBOutlet UILabel *SecCodeLabel;
//密码修改完成
- (IBAction)ConfirmButtonClick:(id)sender;
@property(nonatomic,assign)BOOL isWithdraw;
@property(nonatomic,assign)NSInteger isCheckPayCheckPassword;

@end
