//
//  SettingPayCodeViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SettingPayCodeViewController.h"

@interface SettingPayCodeViewController ()

@end

@implementation SettingPayCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title =@"设置支付密码";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    [self addsubview];
    // Do any additional setup after loading the view from its nib.
}

-(void)addsubview
{
    self.password = [[TTPasswordView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-256.5)/2,193.5, 256.5, 39)];
    self.password.elementCount = 6;
    self.password.elementColor=UIColorFromRGB(0xd5d5d5);
    [self.view addSubview:self.password];
}

-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
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

- (IBAction)ConfirmButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
//    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
