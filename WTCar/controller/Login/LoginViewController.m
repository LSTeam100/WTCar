//
//  LoginViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterFirstViewController.h"
#import "WTCHomeViewController.h"
#import "ChildLoginViewController.h"
#import "ForgetCodeFirstViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)LoginButtonClick:(id)sender {
    WTCHomeViewController *homeViewController = [WTCHomeViewController new];
    [self.navigationController pushViewController:homeViewController animated:YES];
}

- (IBAction)childAccountLoginButtonClick:(id)sender {
    ChildLoginViewController *childLoginViewCon = [ChildLoginViewController new];
    [self.navigationController pushViewController:childLoginViewCon animated:YES];
}

- (IBAction)RegisterButtonClick:(id)sender {
    RegisterFirstViewController *registerFirViewCon = [RegisterFirstViewController new];
    [self.navigationController pushViewController:registerFirViewCon animated:YES];
}

- (IBAction)ForgetCodeButtonClick:(id)sender {
    ForgetCodeFirstViewController *forgetCodefirViewCon = [ForgetCodeFirstViewController new];
    [self.navigationController pushViewController:forgetCodefirViewCon animated:YES];
}
@end
