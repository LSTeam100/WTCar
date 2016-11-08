//
//  LoginViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LoginViewController.h"
#import "WTCLoginRequest.h"
#import "WTCLoginResult.h"
#import "MBProgressHUD.h"
#import "WTCTabBarViewController.h"
#import "RegisterFirstViewController.h"
#import "WTCHomeViewController.h"
#import "ChildLoginViewController.h"
#import "ForgetCodeFirstViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBar.hidden = YES;
    self.TeleNumTextField.text = @"15102373847";
    self.passWordTextField.text = @"123456";
    
    _TeleImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_TeleImageView];
    _PasswordImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_PasswordImageView];
    //电话输入
    _TeleNumTextField.borderStyle = UITextBorderStyleNone;
    _TeleNumTextField.adjustsFontSizeToFitWidth = YES;
    _TeleNumTextField.keyboardType = UIKeyboardTypeDefault;
    _TeleNumTextField.delegate = self;

  //密码输入
    _passWordTextField.borderStyle = UITextBorderStyleNone;
    _passWordTextField.adjustsFontSizeToFitWidth = YES;
    _passWordTextField.keyboardType = UIKeyboardTypeDefault;
    _passWordTextField.delegate = self;

    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
}
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [_passWordTextField resignFirstResponder];
    [_TeleNumTextField resignFirstResponder];
}
//当用户按下return键或者按回车键，keyboard消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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

- (IBAction)LoginButtonClick:(id)sender {
    NSString *mobilePhone = self.TeleNumTextField.text;
    NSString *password = self.passWordTextField.text;
    if (self.TeleNumTextField.text.length == 0) {
        
    }
    else if(self.passWordTextField.text.length == 0){
        
    }
    else
    {
        WTCLoginRequest *request = [[WTCLoginRequest alloc]initWithLoginName:mobilePhone password:password successCallback:^(WTCarBaseRequest *request) {
            WTCLoginResult *loginResult = [request getResponse].data;
            NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
            [userDefault setValue:mobilePhone forKey:@"loginName"];
            [userDefault setValue:password forKey:@"password"];
            NSString *token=loginResult.token;
            [userDefault setValue:token forKey:@"token"];
            
            WTCTabBarViewController *wtcTabbar=[[WTCTabBarViewController alloc]init];
            [self.navigationController pushViewController:wtcTabbar animated:YES];
//            UINavigationController *parentVc= (UINavigationController *)[self presentingViewController];
//            
//            [parentVc popToRootViewControllerAnimated:NO];
//            WTCTabBarViewController *wtcTabbar=[[WTCTabBarViewController alloc]init];
//            [parentVc pushViewController:wtcTabbar animated:YES];
            
            
            
        } failureCallback:^(WTCarBaseRequest *request) {
            [self handleResponseError:self request:request treatErrorAsUnknown:YES];
        }];
        [request start];
    }
    
    
    
//    WTCHomeViewController *homeViewController = [WTCHomeViewController new];
//    [self.navigationController pushViewController:homeViewController animated:YES];
}

- (IBAction)childAccountLoginButtonClick:(id)sender {
    ChildLoginViewController *childLoginViewCon = [ChildLoginViewController new];
    [self.navigationController pushViewController:childLoginViewCon animated:YES];
}

- (IBAction)RegisterButtonClick:(id)sender {
    RegisterFirstViewController *registerFirViewCon = [RegisterFirstViewController new];
    [self.navigationController pushViewController:registerFirViewCon animated:YES];
}

- (IBAction)ForgetCodeButtonClick:(id)sender {
    ForgetCodeFirstViewController *forgetCodefirViewCon = [ForgetCodeFirstViewController new];
    [self.navigationController pushViewController:forgetCodefirViewCon animated:YES];
}
@end
