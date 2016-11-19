//
//  WTCUserTeleNumViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTCUserTeleNumViewController : UIViewController
- (IBAction)SaveUserTeleNumButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *TeleTextField;
- (IBAction)DeleTeleButtonClick:(id)sender;

@end
