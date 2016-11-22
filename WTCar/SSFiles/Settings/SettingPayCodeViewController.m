//
//  SettingPayCodeViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SettingPayCodeViewController.h"
#import "WTCAddBankCardViewController.h"
#import "WTCSetPayPasswdRequest.h"
#import "WTCSetPayPasswdResult.h"
#import "WTCMineViewController.h"
#import "WTCCheckPayPwdRequest.h"
#import "WTCCashWithCardNameViewController.h"
@interface SettingPayCodeViewController ()
{
    
}

@end

@implementation SettingPayCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
//    self.navigationItem.title =@"设置支付密码";
    if (self.isCheckPayCheckPassword == 1) {
        self.naviGantionBar.titleLabel.text = @"请输入支付密码";
//        self.password2.hidden = YES;
//        self.SecCodeLabel.hidden = YES;
    }
    else{
        self.naviGantionBar.titleLabel.text = @"设置支付密码";
    }
    
    [self dataInit];
    [self addsubview];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidDisappear:(BOOL)animated
{
        _CashNoNameSetpassword = NO;
        _CashHasNameSetpassword = NO;
    
        _AddBankCardNoNameSetpassword = NO;
        _AddBankCardHasNameSetpassword = NO;
}
-(void)dataInit
{
//    _CashNoNameSetpassword = NO;
//    _CashHasNameSetpassword = NO;
//    
//    _AddBankCardNoNameSetpassword = NO;
//    _AddBankCardHasNameSetpassword = NO;
}
//加载密码输入框
-(void)addsubview
{
    self.password = [[TTPasswordView alloc] initWithFrame:CGRectMake(60, 90+30, SCREEN_WIDTH-120, (SCREEN_WIDTH-120)/6)];
    self.password.elementCount = 6;
    self.password.elementColor=UIColorFromRGB(0xd5d5d5);
    [self.view addSubview:self.password];
    self.password2 = [[TTPasswordView alloc] initWithFrame:CGRectMake(60, 195+30, SCREEN_WIDTH-120,(SCREEN_WIDTH-120)/6)];
    self.password2.elementCount = 6;
    self.password2.elementColor=UIColorFromRGB(0xd5d5d5);
    [self.view addSubview:self.password2];
    if (self.isCheckPayCheckPassword == 1) {
        self.password2.hidden = YES;
        self.SecCodeLabel.hidden = YES;
    }
    else{
        self.naviGantionBar.titleLabel.text = @"设置支付密码";
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

- (IBAction)ConfirmButtonClick:(id)sender {
    NSString *payPasswd = _password.textField.text;
    NSString *setPasswdToken = [[CommonVar sharedInstance] getLoginToken];
    if (payPasswd.length == 0) {
        [[CommonVar sharedInstance] showMessage:@"密码不能为空" ShowController:self];
        return;
    }
    [self setBusyIndicatorVisible:YES];
    if (self.isCheckPayCheckPassword == 1) {
        NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
        WTCCheckPayPwdRequest *request = [[WTCCheckPayPwdRequest alloc]initWithPayPasswd:loginToken PayPassword:_password.textField.text successCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            WTCCashWithCardNameViewController *card = [[WTCCashWithCardNameViewController alloc]init];
            card.isWidhtdraw = YES;
            [self.navigationController pushViewController:card animated:YES];
        } failureCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            [self handleResponseError:self request:request treatErrorAsUnknown:NO];
        }];
        [request start];

    }
    else
    {
        if (![_password.textField.text isEqualToString:_password2.textField.text]) {
            [[CommonVar sharedInstance] showMessage:@"两次密码输入不一致" ShowController:self];
            return;
            
        }

        [self setBusyIndicatorVisible:YES];
        WTCSetPayPasswdRequest*request = [[WTCSetPayPasswdRequest alloc]initSetPayPasswd:payPasswd Token:setPasswdToken successCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            
            if (self.isWithdraw == true) {
                WTCAddBankCardViewController *addCard = [[WTCAddBankCardViewController alloc]init];
                addCard.isWidthdraw = YES;
                addCard.idcard = self.userInfoResult.idcard;
                addCard.userInfoResult = self.userInfoResult;
                [self.navigationController pushViewController:addCard animated:YES];
            }
            else
            {
                [[CommonVar sharedInstance] showMessage:@"设置支付密码成功" ShowController:self];
                
            }
            
        } failureCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            [self handleResponseError:self request:request treatErrorAsUnknown:YES];
        }];
        [request start];

    }
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTranslucent:YES];
    self.navigationController.navigationBarHidden=YES;
    self.naviGantionBar.hidden = NO;

}
-(void)back
{
    if (self.isWithdraw == true) {
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
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setTranslucent:YES];
    self.navigationController.navigationBarHidden=NO;
    self.naviGantionBar.hidden = YES;
}

@end
