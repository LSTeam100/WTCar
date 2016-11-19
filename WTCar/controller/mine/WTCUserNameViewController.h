//
//  WTCUserNameViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTCUserNameViewController : UIViewController
- (IBAction)SaveUserNameButtonClick:(id)sender;
- (IBAction)DeleTextFieldButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *NameTextField;
@property (nonatomic,strong)NSString *realName;
@end
