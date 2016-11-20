//
//  ForgetCodeSecondViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ForgetCodeSecondViewController.h"
#import "ForgetCodeThreeViewController.h"
@interface ForgetCodeSecondViewController ()

@end

@implementation ForgetCodeSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_getVerityCodeButton addTarget:self action:@selector(getVerityCodeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}
-(void)getVerityCodeButtonClick
{
    
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

- (IBAction)submitButtonClick:(id)sender {
    ForgetCodeThreeViewController *forgetCodeThreeViewCon = [ForgetCodeThreeViewController new];
    forgetCodeThreeViewCon.AccountTeleNumText = self.teleNumText;
    forgetCodeThreeViewCon.VerityCodeForget = _verityCodeTextField.text;
    [self.navigationController pushViewController:forgetCodeThreeViewCon animated:YES];
}
@end
