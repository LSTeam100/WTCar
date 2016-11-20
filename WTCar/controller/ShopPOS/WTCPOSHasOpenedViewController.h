//
//  WTCPOSHasOpenedViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTCBaseViewController.h"
@interface WTCPOSHasOpenedViewController : WTCBaseViewController
//修改POS机登陆密码
- (IBAction)ChangePOSLogCodeButtonClick:(id)sender;
//POS机账号ID
@property (weak, nonatomic) IBOutlet UILabel *POSIDLabel;
//POS机SN序列号
@property (weak, nonatomic) IBOutlet UILabel *POSSNLabel;

@end
