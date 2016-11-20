//
//  ForgetCodeThreeViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBaseViewController.h"

@interface ForgetCodeThreeViewController :WTCBaseViewController
@property(nonatomic,strong)NSString *AccountTeleNumText;
//手机号
@property (weak, nonatomic) IBOutlet UITextField *TeleNumTextField;
//设置登陆密码
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
//完成按钮
@property (weak, nonatomic) IBOutlet UIButton *completeButton;
@property (weak, nonatomic) IBOutlet UITextField *verityPasswordTextField;

@property(nonatomic,strong)NSString *VerityCodeForget;
@end
