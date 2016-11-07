//
//  ForgetCodeFirstViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgetCodeFirstViewController : UIViewController
//手机号输入栏
@property (weak, nonatomic) IBOutlet UITextField *TeleNumTextField;
//下一步
- (IBAction)NextStepButtonClick:(id)sender;

@end
