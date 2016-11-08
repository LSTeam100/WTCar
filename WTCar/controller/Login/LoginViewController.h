//
//  LoginViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTCBaseViewController.h"
@interface LoginViewController : WTCBaseViewController
@property (weak, nonatomic) IBOutlet UITextField *TeleNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
- (IBAction)LoginButtonClick:(id)sender;
- (IBAction)childAccountLoginButtonClick:(id)sender;
- (IBAction)RegisterButtonClick:(id)sender;
- (IBAction)ForgetCodeButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *TeleImageView;
@property (weak, nonatomic) IBOutlet UIImageView *PasswordImageView;

@end
