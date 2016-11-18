//
//  ForgetCodeThreeViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ForgetCodeThreeViewController.h"
#import "LoginViewController.h"
#import "WTCForgetLoginPasswordResult.h"
#import "WTCForgetLoginPasswordRequest.h"
#import "MBProgressHUD.h"
@interface ForgetCodeThreeViewController ()

@end

@implementation ForgetCodeThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_completeButton addTarget:self action:@selector(compeleteToLogin) forControlEvents:UIControlEventTouchUpInside];
}
-(void)viewDidAppear:(BOOL)animated
{
    _TeleNumTextField.text = self.AccountTeleNumText;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)compeleToLogin
{
    NSString *password = _passWordTextField.text;
    NSString *accountTeleNum = _TeleNumTextField.text;
    NSString *veritypassword = _verityPasswordTextField.text;
    if (self.TeleNumTextField.text.length == 0) {
        
    }
    else if(self.passWordTextField.text.length == 0){
        
    } else if (self.verityPasswordTextField.text.length == 0)
    {
        
    }
    else
    {
        [self setBusyIndicatorVisible:YES];
        WTCForgetLoginPasswordRequest *request = [[WTCForgetLoginPasswordRequest alloc]initWithLoginName:accountTeleNum password:password VerityCode:veritypassword successCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            
            WTCForgetLoginPasswordResult *forgetloginpwdResult = [request getResponse].data;
            NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
            [userDefault setValue:accountTeleNum forKey:@"loginName"];
            [userDefault setValue:password forKey:@"password"];

            
            LoginViewController *loginViewController = [LoginViewController new];
            [self.navigationController pushViewController:loginViewController animated:YES];

        } failureCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            [self handleResponseError:self request:request treatErrorAsUnknown:YES];
        }];
        [request start];
    }

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
