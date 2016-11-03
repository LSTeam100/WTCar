//
//  ForgetCodeThreeViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ForgetCodeThreeViewController.h"
#import "LoginViewController.h"
@interface ForgetCodeThreeViewController ()

@end

@implementation ForgetCodeThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_completeButton addTarget:self action:@selector(compeleteToLogin) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)compeleToLogin
{
    LoginViewController *loginViewController = [LoginViewController new];
    [self.navigationController pushViewController:loginViewController animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
