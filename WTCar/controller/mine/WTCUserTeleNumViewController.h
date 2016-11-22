//
//  WTCUserTeleNumViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTCBaseViewController.h"
@interface WTCUserTeleNumViewController : WTCBaseViewController<UITextFieldDelegate>
- (IBAction)SaveUserTeleNumButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *TeleTextField;
@property(nonatomic,strong)NSString *telePhone;
- (IBAction)DeleTeleButtonClick:(id)sender;

@end
