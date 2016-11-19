//
//  WTCMyBankCardViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import"WTCBaseViewController.h"

@interface WTCMyBankCardViewController :WTCBaseViewController
@property (weak, nonatomic) IBOutlet UILabel *BankNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *BankCardTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *bankCardEndNumLabel;
- (IBAction)DeleBankCardButtonClick:(id)sender;

@end
