//
//  ChangeAccountCodeViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import"WTCBaseViewController.h"

@interface ChangeAccountCodeViewController :WTCBaseViewController
@property (weak, nonatomic) IBOutlet UITextField *AccountCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *ChangeAccountCodeButton;
@property(nonatomic,strong) NSString *oldAccountKey;
@end
