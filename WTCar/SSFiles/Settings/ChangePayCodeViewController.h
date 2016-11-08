//
//  ChangePayCodeViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import"WTCBaseViewController.h"
#import "TTPasswordView.h"
#import "define.h"
@interface ChangePayCodeViewController : WTCBaseViewController
@property (weak, nonatomic) IBOutlet UILabel *FirCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *SecCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ThreeCodeLabel;
@property (weak, nonatomic) IBOutlet UIButton *ConfirmButton;
@property (weak, nonatomic) IBOutlet UIView *contentView;


/**
 *   密码框
 */
@property(nonatomic,retain)TTPasswordView *password;
@property(nonatomic,retain)TTPasswordView *password2;
@property(nonatomic,retain)TTPasswordView *password3;
@end
