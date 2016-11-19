//
//  ForgetPayCodeThreeViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ForgetPayCodeThreeViewController.h"
#import "WTCForgetPayPasswdResult.h"
#import "WTCForgetPayPasswdRequest.h"
#import "MBProgressHUD.h"
@interface ForgetPayCodeThreeViewController ()

@end

@implementation ForgetPayCodeThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title =@"忘记支付密码";
    [_confirmNewCodeButton addTarget:self action:@selector(confirmNewCode) forControlEvents:UIControlEventTouchUpInside];
    [self addsubview];
    // Do any additional setup after loading the view from its nib.
}

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

-(void)confirmNewCode
{
    NSString *payPasswd = _password2.textField.text;
    [self setBusyIndicatorVisible:YES];
    WTCForgetPayPasswdRequest*request = [[WTCForgetPayPasswdRequest alloc]initWithCode:_verityCode payPassword:payPasswd  successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
        WTCForgetPayPasswdResult *forgetPayPasswdResult = [request getResponse].data;
        
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

@end
