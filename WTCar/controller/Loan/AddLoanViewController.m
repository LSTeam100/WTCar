//
//  AddLoanViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AddLoanViewController.h"
#import "AddLoanSuccessViewController.h"
#import "WTCApplyLoanRequest.h"
#import "WTCApplyLoanResult.h"
#import "MBProgressHUD.h"
@interface AddLoanViewController ()

@end

@implementation AddLoanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:247/255.0f blue:245/255.0f alpha:1];
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

- (IBAction)confirmLoanButtonClick:(id)sender {
    NSString *loanNum = _loanMoneyNumTextField.text;
    NSString *receivePosToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCApplyLoanRequest *request = [[WTCApplyLoanRequest alloc]initWithAmount:loanNum Token:receivePosToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
        WTCApplyLoanResult *applyLoanResult = [request getResponse].data;
        
        AddLoanSuccessViewController *addloanSuccessViewCon= [AddLoanSuccessViewController new];
        [self.navigationController pushViewController:addloanSuccessViewCon animated:YES];
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];

}
@end
