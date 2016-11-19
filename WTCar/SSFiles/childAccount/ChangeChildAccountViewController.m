//
//  ChangeChildAccountViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ChangeChildAccountViewController.h"
#import "WTCChildAccountViewController.h"
#import "WTCUpSubUserRequest.h"
#import "MBProgressHUD.h"
@interface ChangeChildAccountViewController ()

@end

@implementation ChangeChildAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_ChangeChildAccountButton addTarget:self action:@selector(changeChildAccountInfoClick) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}
//更新子账户信息请求
-(void)changeChildAccountRequest
{
    NSString *upname = _ChildNameTextField.text;
    NSString *upTele = _ChildTeleTextField.text;
    NSNumber * ID = @([_ButtonId integerValue]);
    [self setBusyIndicatorVisible:YES];
    WTCUpSubUserRequest *request = [[WTCUpSubUserRequest alloc]initWithUpSubUser:ID ChildAccountMobile:upTele ChildAccountName:upname successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        NSObject *result = [request getResponse].data;
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];

}
-(void)changeChildAccountInfoClick
{
    [self changeChildAccountRequest];
    WTCChildAccountViewController *childAccountViewcon = [WTCChildAccountViewController new];
    [self.navigationController pushViewController:childAccountViewcon animated:YES];
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
