//
//  ChangeChildAccountViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import"WTCBaseViewController.h"

@interface ChangeChildAccountViewController :WTCBaseViewController
@property (weak, nonatomic) IBOutlet UIButton *ChangeChildAccountButton;
@property (weak, nonatomic) IBOutlet UITextField *ChildTeleTextField;
@property (weak, nonatomic) IBOutlet UITextField *ChildNameTextField;
@property(nonatomic,strong) NSString *ButtonId;
@end
