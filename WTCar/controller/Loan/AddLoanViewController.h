//
//  AddLoanViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBaseViewController.h"

@interface AddLoanViewController : WTCBaseViewController
//提交配资申请
- (IBAction)confirmLoanButtonClick:(id)sender;
//输入配资金额文本框
@property (weak, nonatomic) IBOutlet UITextField *loanMoneyNumTextField;

@end
