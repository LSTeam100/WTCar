//
//  ChangeAccountCodeViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ChangeAccountCodeViewController.h"
#import "WTCChangeAccountKeyRequest.h"
#import "MBProgressHUD.h"
@interface ChangeAccountCodeViewController ()

@end

@implementation ChangeAccountCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//Key更新请求
-(void)UpSubAccountKeyRequest
{
    NSString *newKey = _AccountCodeTextField.text;
    [self setBusyIndicatorVisible:YES];
    WTCChangePayPasswdRequest *request = [[WTCChangePayPasswdRequest alloc]initChangeAccountKey:_oldAccountKey nwAccountKey:newKey successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
         NSObject*result = [request getResponse].data;
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];

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
