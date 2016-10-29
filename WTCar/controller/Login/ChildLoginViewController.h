//
//  ChildLoginViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChildLoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *MainTeleNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *KeyTextField;
@property (weak, nonatomic) IBOutlet UITextField *ChildTeleNumTextField;
- (IBAction)LoginButtonClick:(id)sender;

@end
