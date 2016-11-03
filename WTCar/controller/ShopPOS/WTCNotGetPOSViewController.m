//
//  WTCNotGetPOSViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCNotGetPOSViewController.h"
#import "WTCPOSToOpenViewController.h"
@interface WTCNotGetPOSViewController ()

@end

@implementation WTCNotGetPOSViewController

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

- (IBAction)ToGetPOSButtonClick:(id)sender {
    WTCPOSToOpenViewController *POSToOpenViewCon = [WTCPOSToOpenViewController new];
    [self.navigationController pushViewController:POSToOpenViewCon animated:YES];
}
@end
