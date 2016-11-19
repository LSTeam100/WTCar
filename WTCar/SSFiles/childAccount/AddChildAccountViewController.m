//
//  AddChildAccountViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AddChildAccountViewController.h"
#import "WTCAddSubUserRequest.h"
#import "MBProgressHUD.h"
@interface AddChildAccountViewController ()

@end

@implementation AddChildAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_AddChildAccountButton addTarget:self action:@selector(addChildAccountRequest) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}
-(void)addChildAccountRequest
{
    NSString *mobile = _TeleNumTextField.text;
    NSString *name = _ChildAccountNameTextField.text;
    [self setBusyIndicatorVisible:YES];
    WTCAddSubUserRequest *request = [[WTCAddSubUserRequest alloc]initWithAddSubUser:name childAccountMobile:mobile  successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
        NSObject *result = [request getResponse].data;

    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];}
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
