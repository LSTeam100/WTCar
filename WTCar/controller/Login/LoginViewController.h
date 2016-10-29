//
//  LoginViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *TeleNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
- (IBAction)LoginButtonClick:(id)sender;
- (IBAction)childAccountLoginButtonClick:(id)sender;
- (IBAction)RegisterButtonClick:(id)sender;
- (IBAction)ForgetCodeButtonClick:(id)sender;

@end
