//
//  LoginViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
//输入手机号
@property (weak, nonatomic) IBOutlet UITextField *TeleNumTextField;
//输入密码
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
//登陆按钮
- (IBAction)LoginButtonClick:(id)sender;
//子账户登陆
- (IBAction)childAccountLoginButtonClick:(id)sender;
//注册按钮
- (IBAction)RegisterButtonClick:(id)sender;
//忘记密码
- (IBAction)ForgetCodeButtonClick:(id)sender;

@end
