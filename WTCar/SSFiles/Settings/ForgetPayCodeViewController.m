//
//  ForgetPayCodeViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ForgetPayCodeViewController.h"
#import "ForgetPayCodeSecViewController.h"
@interface ForgetPayCodeViewController ()

@end

@implementation ForgetPayCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_NextStepButton addTarget:self action:@selector(nextStepClick) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}

-(void)nextStepClick
{
    ForgetPayCodeSecViewController *forgetPaySecViewCon = [ForgetPayCodeSecViewController new];
    [self.navigationController pushViewController:forgetPaySecViewCon animated:YES];
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

@end
