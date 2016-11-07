//
//  WTCPOSToOpenViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTCPOSToOpenViewController : UIViewController
//保存POS机密码
- (IBAction)savePOSOpenCodeButtonClick:(id)sender;
//POS机账号
@property (weak, nonatomic) IBOutlet UITextField *POSIDTextField;
//设置POS机密码
@property (weak, nonatomic) IBOutlet UITextField *SetPOSPasswordTextField;
//确认POS机密码
@property (weak, nonatomic) IBOutlet UITextField *ConfirmPOSPasswordTextField;

@end
