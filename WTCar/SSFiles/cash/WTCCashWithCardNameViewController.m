//
//  WTCCashWithCardNameViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCashWithCardNameViewController.h"
#import "WTCCashToPasswordViewController.h"
#import "WTCCashRecordViewController.h"
#import "WTCApplyCashRequest.h"
#import "MBProgressHUD.h"
#import "WTCGetBankCardInfoResult.h"
#import "WTCGetBankCardInfoRequest.h"

@interface WTCCashWithCardNameViewController ()

@end

@implementation WTCCashWithCardNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_NextStepButton addTarget:self action:@selector(GotoLogPasswordOrCashRecord) forControlEvents:UIControlEventTouchUpInside];
    self.title = @"提现";
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated
{
    [self getBankInfoRequest];
}
//获取银行卡信息
-(void)getBankInfoRequest
{
    NSString *getbankInfoToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCGetBankCardInfoRequest *request = [[WTCGetBankCardInfoRequest alloc]initWithToken:getbankInfoToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
        WTCGetBankCardInfoResult *receivePosResult = [request getResponse].data;
        
        self.UserNameLabel.text = receivePosResult.realName;
        self.UserCardLabel.text = receivePosResult.bankNum;
        self.CardAddressLabel.text = receivePosResult.openedBank;
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];
}

//申请提现请求
-(void)applyCashRequest
{
    NSString *amount = _CashNumTextField.text;
    [self setBusyIndicatorVisible:YES];
    WTCApplyCashRequest *request = [[WTCApplyCashRequest alloc]initWithApplyCash:amount successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];
}
-(void)GotoLogPasswordOrCashRecord
{
    if (_CashHasPasswordAndName==YES) {
        
        WTCCashToPasswordViewController *toPasswordViewCon = [WTCCashToPasswordViewController new];
        toPasswordViewCon.cashNum = _CashNumTextField.text;
        [self.navigationController pushViewController:toPasswordViewCon animated:YES];
    } else {
        WTCCashRecordViewController *cashRecordViewCon = [WTCCashRecordViewController new];
        [self applyCashRequest];
        [self.navigationController pushViewController:cashRecordViewCon animated:YES];
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
