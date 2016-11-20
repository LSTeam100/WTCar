//
//  ChangePayCodeViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ChangePayCodeViewController.h"
#import "WTCChangePayPwdRequest.h"
#import "WTCChangePayPasswdResult.h"
#import "MBProgressHUD.h"
@interface ChangePayCodeViewController ()

@end

@implementation ChangePayCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title =@"修改支付密码";
    [self addsubview];
    [_ConfirmButton addTarget:self action:@selector(changePayPasswdButtonClick) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}

-(void)changePayPasswdButtonClick{
    NSString *nwPayPasswd = _password2.textField.text;
    NSString *oldPayPasswd = _password.textField.text;
    [self setBusyIndicatorVisible:YES];
    WTCChangePayPwdRequest*request = [[WTCChangePayPwdRequest alloc]initChangePayPasswd:nwPayPasswd payPassword:oldPayPasswd successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
        WTCChangePayPasswdResult *setPayPasswdResult = [request getResponse].data;
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];

}

//加载密码输入框
-(void)addsubview
{
    self.password = [[TTPasswordView alloc] initWithFrame:CGRectMake(156+10, 64+3, SCREEN_WIDTH-200, (SCREEN_WIDTH-200)/6)];
    self.password.elementCount = 6;
    self.password.elementColor=UIColorFromRGB(0xd5d5d5);
    [_contentView addSubview:self.password];
    self.password2 = [[TTPasswordView alloc] initWithFrame:CGRectMake(166, 97+3, SCREEN_WIDTH-200,(SCREEN_WIDTH-200)/6)];
    self.password2.elementCount = 6;
    self.password2.elementColor=UIColorFromRGB(0xd5d5d5);
    [_contentView addSubview:self.password2];
    self.password3 = [[TTPasswordView alloc] initWithFrame:CGRectMake(166, 130+3, SCREEN_WIDTH-200,(SCREEN_WIDTH-200)/6)];
    self.password3.elementCount = 6;
    self.password3.elementColor=UIColorFromRGB(0xd5d5d5);
    [_contentView addSubview:self.password3];
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
