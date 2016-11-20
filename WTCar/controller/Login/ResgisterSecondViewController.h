//
//  ResgisterSecondViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTCBaseViewController.h"
@interface ResgisterSecondViewController : WTCBaseViewController
//输入验证码
@property (weak, nonatomic) IBOutlet UITextField *verityCodeTextField;
//获取验证码
@property (weak, nonatomic) IBOutlet UIButton *getVerityCodeButton;
//验证码提交
- (IBAction)SubmitButtonClick:(id)sender;
//手机号
@property(nonatomic,strong)NSString *teleNum;
@end
