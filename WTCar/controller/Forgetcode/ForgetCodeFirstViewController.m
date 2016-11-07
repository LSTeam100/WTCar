//
//  ForgetCodeFirstViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ForgetCodeFirstViewController.h"
#import "ForgetCodeSecondViewController.h"
@interface ForgetCodeFirstViewController ()

@end

@implementation ForgetCodeFirstViewController

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

- (IBAction)NextStepButtonClick:(id)sender {
    ForgetCodeSecondViewController *forgetCOdeSecViewCon = [ForgetCodeSecondViewController new];
    [self.navigationController pushViewController:forgetCOdeSecViewCon animated:YES];
}
@end
