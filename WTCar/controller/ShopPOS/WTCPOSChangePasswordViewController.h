//
//  WTCPOSChangePasswordViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import"WTCBaseViewController.h"
#import "TTPasswordView.h"
#import "define.h"

@interface WTCPOSChangePasswordViewController :WTCBaseViewController
- (IBAction)ConfirmPOSCodeButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *ChangeCodeContentView;

/**
 *   密码框
 */
@property(nonatomic,assign)BOOL flag;
@property(nonatomic,retain)TTPasswordView *password;
@property(nonatomic,retain)TTPasswordView *password2;
@property(nonatomic,retain)TTPasswordView *password3;
@end
