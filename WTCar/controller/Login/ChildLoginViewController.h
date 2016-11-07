//
//  ChildLoginViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTCBaseViewController.h"
@interface ChildLoginViewController : WTCBaseViewController
//输入主账号手机号
@property (weak, nonatomic) IBOutlet UITextField *MainTeleNumTextField;
//输入密匙
@property (weak, nonatomic) IBOutlet UITextField *KeyTextField;
//输入子账户手机号
@property (weak, nonatomic) IBOutlet UITextField *ChildTeleNumTextField;
//子账户登录按钮
- (IBAction)LoginButtonClick:(id)sender;

@end
