//
//  WTCCashToPasswordViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCashToPasswordViewController.h"
#import "WTCCashRecordViewController.h"
#import "WTCMyBankCardViewController.h"
#import "WTCApplyCashRequest.h"
#import "MBProgressHUD.h"
@interface WTCCashToPasswordViewController ()

@end

@implementation WTCCashToPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title =@"请输入支付密码";
    [self dataInit];
    [self addsubview];
    [_ConfirmCashButton addTarget:self action:@selector(ConfirmCashClick) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}
//申请提现请求
-(void)applyCashRequest
{
    NSString *amount = _cashNum;
    [self setBusyIndicatorVisible:YES];
    
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    WTCApplyCashRequest *request = [[WTCApplyCashRequest alloc]initWithApplyCash:amount Token:loginToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        WTCCashRecordViewController *controller = [[WTCCashRecordViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
    }];
    [request start];
}

-(void)dataInit
{

}
-(void)ConfirmCashClick
{
    if (_AddBankCardHasCardLogpassword==YES) {
        WTCMyBankCardViewController *mybankCardViewCon = [WTCMyBankCardViewController new];
        [self.navigationController pushViewController:mybankCardViewCon animated:YES];
    } else if (_CashHasCardLogpassword==YES){
    WTCCashRecordViewController *cashRecordViewCon = [WTCCashRecordViewController new];
        [self applyCashRequest];
    [self.navigationController pushViewController:cashRecordViewCon animated:YES];
    }
}
-(void)addsubview
{
    self.password = [[TTPasswordView alloc] initWithFrame:CGRectMake(60, 125+30, SCREEN_WIDTH-120, (SCREEN_WIDTH-120)/6)];
    self.password.elementCount = 6;
    self.password.elementColor=UIColorFromRGB(0xd5d5d5);
    [self.view addSubview:self.password];

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
