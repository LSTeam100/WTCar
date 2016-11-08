//
//  RegisterFirstViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTCBaseViewController.h"
@interface RegisterFirstViewController : WTCBaseViewController
//输入注册手机号
@property (weak, nonatomic) IBOutlet UITextField *TeleNumTextField;
//下一步
- (IBAction)NextStepButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *ReTeleImageView;

@end
