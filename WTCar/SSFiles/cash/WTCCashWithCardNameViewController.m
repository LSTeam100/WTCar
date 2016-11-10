//
//  WTCCashWithCardNameViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCashWithCardNameViewController.h"
#import "WTCCashToPasswordViewController.h"
#import "WTCCashRecordViewController.h"
@interface WTCCashWithCardNameViewController ()

@end

@implementation WTCCashWithCardNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_NextStepButton addTarget:self action:@selector(GotoLogPasswordOrCashRecord) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}

-(void)GotoLogPasswordOrCashRecord
{
    WTCCashToPasswordViewController *toPasswordViewCon = [WTCCashToPasswordViewController new];
    [self.navigationController pushViewController:toPasswordViewCon animated:YES];
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
