//
//  WTCAddBankCardViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCAddBankCardViewController.h"
#import "WTCCashWithCardNameViewController.h"
#import "WTCCashToPasswordViewController.h"
#import "WTCBindBankCardRequest.h"
#import "MBProgressHUD.h"
#import "WTCMyBankCardViewController.h"
#import "WTCMineViewController.h"
@interface WTCAddBankCardViewController ()

@end

@implementation WTCAddBankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"添加银行卡";
    self.naviGantionBar.titleLabel.text = @"添加银行卡";
    [self dataInit];
    [_ConfirmAddBankCardButton addTarget:self action:@selector(GotoCashViewCon) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.navigationController.navigationBar setTranslucent:YES];
    self.navigationController.navigationBarHidden=YES;
    self.naviGantionBar.hidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.naviGantionBar.hidden = YES;
//    [self.navigationController.navigationBar setTranslucent:YES];
    self.navigationController.navigationBarHidden=NO;
    
}
-(void)viewDidDisappear:(BOOL)animated
{
    _CashNoNameNoPassword = NO;
    _CashHasNameNoPassword = NO;
    _CashHasPasswordNoName = NO;
    _CashHasNameAndPassword = NO;
    
    _AddBankNoNameNoPassword = NO;
    _AddBankHasNameNoPassword = NO;
    _AddBankHasPasswordNoName = NO;
    _AddBankHasNameAndPassword = NO;
    self.navigationController.navigationBarHidden=NO;

}
//绑定银行卡
-(void)BindBankCardRequest
{
    NSString *bankCard = _BankCardTextField.text;
    NSString *openCardAddress = _openBankCardAddressTextField.text;
    [self setBusyIndicatorVisible:YES];
    NSString *token = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCBindBankCardRequest *request = [[WTCBindBankCardRequest alloc]initWithBindBankCard:token Bankcard:bankCard openedBank:openCardAddress successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        if (self.isWidthdraw == true) {
            WTCCashWithCardNameViewController *controler = [[WTCCashWithCardNameViewController alloc]init];
            controler.isWidhtdraw = self.isWidthdraw;
            [self.navigationController pushViewController:controler animated:YES];
        }
        else
        {
            WTCMyBankCardViewController *myBank = [[WTCMyBankCardViewController alloc]init];
            [self.navigationController pushViewController:myBank animated:YES];
        }
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];

    }];
  
    [request start];
}
-(void)GotoCashViewCon
{
    [self BindBankCardRequest];
//    if (_CashHasNameNoPassword == YES) {
//        WTCCashWithCardNameViewController *cashViewCon = [WTCCashWithCardNameViewController new];
//        cashViewCon.CashHasPasswordAndName = NO;
//        [self.navigationController pushViewController:cashViewCon animated:YES];
//    } else {
//        WTCCashToPasswordViewController *cashTopasswordViewCon = [WTCCashToPasswordViewController new];
//        cashTopasswordViewCon.CashHasCardLogpassword = YES;
//        [self.navigationController pushViewController:cashTopasswordViewCon animated:YES];
//    }
    
}
-(void)dataInit
{
    self.uesrIdNumLabel.text = self.userInfoResult.idcard;
    self.userNameLabel.text = self.userInfoResult.realName;
    self.userTeleNumTextField.text = self.userInfoResult.mobile;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)back
{
    if (self.isWidthdraw == true) {
        int index = 0;
        for (int i = 0; i < self.navigationController.viewControllers.count; i++) {
            id controller = [self.navigationController.viewControllers objectAtIndex:i];
            if ([controller isKindOfClass:[WTCMineViewController class]]) {
                index = i;
                [self.navigationController popToViewController:controller animated:YES];
                
            }
        }
        
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    //    NSLog(@"sssss");
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
