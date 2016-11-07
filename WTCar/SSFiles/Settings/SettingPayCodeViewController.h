//
//  SettingPayCodeViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "define.h"
#import "TTPasswordView.h"
@interface SettingPayCodeViewController : UIViewController
/**
 *   密码框
 */
@property(nonatomic,retain)TTPasswordView *password;
/**
 *  第一次输入的密码
 */
@property(nonatomic,copy)NSString *firstCode;
//第一次输入密码标题
@property (weak, nonatomic) IBOutlet UILabel *FirstCodeLabel;
//第二次输入密码标题
@property (weak, nonatomic) IBOutlet UILabel *SecCodeLabel;
//密码修改完成
- (IBAction)ConfirmButtonClick:(id)sender;

@end
