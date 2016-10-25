//
//  WTCMineViewController.m
//  WTCar
//
//  Created by apple on 2016/10/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCMineViewController.h"
#import "SettingViewController.h"
@interface WTCMineViewController ()

@end

@implementation WTCMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    UIButton*testButton=[[UIButton alloc]initWithFrame:CGRectMake(160, 50, 70, 70)];
    testButton.backgroundColor= [UIColor redColor];
    [testButton addTarget:self action:@selector(clickTestButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];
    // Do any additional setup after loading the view from its nib.
}
-(void)clickTestButton
{
    SettingViewController *settingViewController = [SettingViewController new];
    [self.navigationController pushViewController:settingViewController animated:YES];
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
