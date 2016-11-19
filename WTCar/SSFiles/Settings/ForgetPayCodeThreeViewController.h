//
//  ForgetPayCodeThreeViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBaseViewController.h"
#import "define.h"
#import "TTPasswordView.h"
@interface ForgetPayCodeThreeViewController : WTCBaseViewController
@property(nonatomic,strong) NSString *verityCode;
@property (weak, nonatomic) IBOutlet UIButton *confirmNewCodeButton;
/**
 *   密码框
 */
@property(nonatomic,retain)TTPasswordView *password;
@property(nonatomic,retain)TTPasswordView *password2;
/**
 *  第一次输入的密码
 */
@property(nonatomic,copy)NSString *firstCode;

@end
