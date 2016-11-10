//
//  WTCAddBankCardViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCAddBankCardViewController.h"
#import "WTCCashWithCardNameViewController.h"
@interface WTCAddBankCardViewController ()

@end

@implementation WTCAddBankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataInit];
    [_ConfirmAddBankCardButton addTarget:self action:@selector(GotoCashViewCon) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}
-(void)GotoCashViewCon
{
    WTCCashWithCardNameViewController *cashViewCon = [WTCCashWithCardNameViewController new];
    [self.navigationController pushViewController:cashViewCon animated:YES];
}
-(void)dataInit
{
    _CashNoNameNoPassword = NO;
    _CashHasNameNoPassword = NO;
    _CashHasPasswordNoName = NO;
    _CashHasNameAndPassword = NO;
    
    _AddBankNoNameNoPassword = NO;
    _AddBankHasNameNoPassword = NO;
    _AddBankHasPasswordNoName = NO;
    _AddBankHasNameAndPassword = NO;
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
