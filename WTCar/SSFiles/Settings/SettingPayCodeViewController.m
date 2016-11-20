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
@interface SettingPayCodeViewController ()
{
    
}

@end

@implementation SettingPayCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title =@"设置支付密码";
    [self dataInit];
    [self addsubview];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated
{
    
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
    [self setBusyIndicatorVisible:YES];
     WTCSetPayPasswdRequest*request = [[WTCSetPayPasswdRequest alloc]initSetPayPasswd:payPasswd Token:setPasswdToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
         if (self.isWithdraw == true) {
             
         }
         else
         {
             [[CommonVar sharedInstance] showMessage:@"设置支付密码成功" ShowController:self];
         }
//        WTCSetPayPasswdResult *setPayPasswdResult = [request getResponse].data;

    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];

    if (_CashHasNameSetpassword == YES) {
        WTCAddBankCardViewController *addCardViewCon = [WTCAddBankCardViewController new];
        addCardViewCon.CashHasNameNoPassword = YES;
        [self.navigationController pushViewController:addCardViewCon animated:YES];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
//    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
