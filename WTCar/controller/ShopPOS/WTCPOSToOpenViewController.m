//
//  WTCPOSToOpenViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCPOSToOpenViewController.h"
#import "WTCPOSHasOpenedViewController.h"
#import "WTCOpenPOSRequest.h"
#import "WTCOpenPOSResult.h"
#import "MBProgressHUD.h"
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
    NSString*posLoginPasswd = _SetPOSPasswordTextField.text;
    NSString *receivePosToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCOpenPOSRequest *request = [[WTCOpenPOSRequest alloc]initWithPosLoginPasswd:posLoginPasswd Token:receivePosToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
        WTCOpenPOSRequest *openPosResult = [request getResponse].data;
        
        WTCPOSHasOpenedViewController *POSHasOpenViewCon = [WTCPOSHasOpenedViewController new];
        [self.navigationController pushViewController:POSHasOpenViewCon animated:YES];
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];

}
@end
