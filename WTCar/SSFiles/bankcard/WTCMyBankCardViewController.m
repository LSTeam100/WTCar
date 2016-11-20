//
//  WTCMyBankCardViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCMyBankCardViewController.h"
#import "WTCDelBankCardRequest.h"
#import "MBProgressHUD.h"
#import "WTCGetBankCardInfoRequest.h"
#import "WTCGetBankCardInfoResult.h"
@interface WTCMyBankCardViewController ()

@end

@implementation WTCMyBankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:247/255.0f blue:245/255.0f alpha:1];
    
    self.navigationItem.title =@"我的银行卡";
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
        
        WTCGetBankCardInfoResult *Result = [request getResponse].data;
        NSString *bankStr = Result.bankNum;
        NSString *endStr = [bankStr substringFromIndex:bankStr.length - 4];

        _bankCardEndNumLabel.text = endStr;
        _BankNameLabel.text = Result.openedBank;
        
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];
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

- (IBAction)DeleBankCardButtonClick:(id)sender {
    NSString *receivePosToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCDelBankCardRequest *request = [[WTCDelBankCardRequest alloc]initWithToken:receivePosToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [[CommonVar sharedInstance] showMessage:@"删除银行卡成功" ShowController:self];
        [self performSelector:@selector(back) withObject:nil afterDelay:3.0];
        
//        NSObject *Result = [request getResponse].data;

    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
