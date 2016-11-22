//
//  WTCPeoNameVerityViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCPeoNameVerityViewController.h"
#import "WTCApplyNameVerifiedRequest.h"
#import "WTCApplyNameVerifiedResult.h"
#import "MBProgressHUD.h"
#import "SettingPayCodeViewController.h"
@interface WTCPeoNameVerityViewController ()

@end

@implementation WTCPeoNameVerityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:247/255.0f blue:245/255.0f alpha:1];
    self.title = @"实名认证";
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

- (IBAction)ConfirmNameButtonClick:(id)sender {
    NSString *applyNameToken = [[CommonVar sharedInstance] getLoginToken];
    NSString *realname = _realNameTextField.text;
    NSString *Idcard = _IdcardTextField.text;
    [self setBusyIndicatorVisible:YES];
    WTCApplyNameVerifiedRequest *request = [[WTCApplyNameVerifiedRequest alloc]initWithIdcard:Idcard realName:realname Token:applyNameToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
        if (self.isWithdraw == true) {
            SettingPayCodeViewController *controller = [SettingPayCodeViewController new];
            controller.isWithdraw = self.isWithdraw;
            [self.navigationController pushViewController:controller animated:YES];
        }
        else
        {
            [[CommonVar sharedInstance]showMessage:@"认证成功" ShowController:self];
            [self performSelector:@selector(back) withObject:nil afterDelay:3.0];
        }
//        WTCApplyNameVerifiedResult *applyNameResult = [request getResponse].data;

    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
