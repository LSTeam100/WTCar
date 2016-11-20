//
//  RegisterThreeViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTCBaseViewController.h"
@interface RegisterThreeViewController : WTCBaseViewController
//注册的手机号
@property (weak, nonatomic) IBOutlet UITextField *TeleNumTextField;
//设置注册密码
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
//设置车辆类型
@property (weak, nonatomic) IBOutlet UITextField *carTypeTextField;
@property (weak, nonatomic) IBOutlet UITextField *verityCodeTextfield;

//注册完成按钮
- (IBAction)confirmButtonClick:(id)sender;
//验证码
@property(nonatomic,strong)NSString *verityCode;
@property(nonatomic,strong)NSString *teleNum;
@end
