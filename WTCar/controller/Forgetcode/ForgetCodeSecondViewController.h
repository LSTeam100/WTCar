//
//  ForgetCodeSecondViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgetCodeSecondViewController : UIViewController
@property(nonatomic,strong) NSString*teleNumText;
//验证码输入栏
@property (weak, nonatomic) IBOutlet UITextField *verityCodeTextField;
//获取验证码按钮
@property (weak, nonatomic) IBOutlet UIButton *getVerityCodeButton;
//提交验证码按钮
- (IBAction)submitButtonClick:(id)sender;

@end
