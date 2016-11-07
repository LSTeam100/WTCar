//
//  ForgetCodeThreeViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgetCodeThreeViewController : UIViewController
//手机号
@property (weak, nonatomic) IBOutlet UITextField *TeleNumTextField;
//设置登陆密码
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
//完成按钮
@property (weak, nonatomic) IBOutlet UIButton *completeButton;

@end
