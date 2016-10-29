//
//  ForgetCodeSecondViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgetCodeSecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *verityCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *getVerityCodeButton;
- (IBAction)submitButtonClick:(id)sender;

@end
