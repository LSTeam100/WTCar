//
//  WTCPOSToOpenViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCPOSToOpenViewController.h"
#import "WTCPOSHasOpenedViewController.h"
@interface WTCPOSToOpenViewController ()

@end

@implementation WTCPOSToOpenViewController

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

- (IBAction)savePOSOpenCodeButtonClick:(id)sender {
    WTCPOSHasOpenedViewController *POSHasOpenViewCon = [WTCPOSHasOpenedViewController new];
    [self.navigationController pushViewController:POSHasOpenViewCon animated:YES];
}
@end
