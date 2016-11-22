//
//  WTCPeoNameVerityViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBaseViewController.h"

@interface WTCPeoNameVerityViewController :WTCBaseViewController
- (IBAction)ConfirmNameButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *realNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *IdcardTextField;
@property(nonatomic,assign)BOOL isWithdraw;

@end
