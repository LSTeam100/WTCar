//
//  ForgetPayCodeSecViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ForgetPayCodeSecViewController.h"
#import "ForgetPayCodeThreeViewController.h"
@interface ForgetPayCodeSecViewController ()

@end

@implementation ForgetPayCodeSecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_NextToThreeButton addTarget:self action:@selector(ToThreeClick) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}

-(void)ToThreeClick
{
    ForgetPayCodeThreeViewController *forgetPayThreeViewCon = [ForgetPayCodeThreeViewController new];
    [self.navigationController pushViewController:forgetPayThreeViewCon animated:YES];
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
