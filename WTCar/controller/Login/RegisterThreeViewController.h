//
//  RegisterThreeViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterThreeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *TeleNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@property (weak, nonatomic) IBOutlet UITextField *carTypeTextField;
- (IBAction)confirmButtonClick:(id)sender;

@end
