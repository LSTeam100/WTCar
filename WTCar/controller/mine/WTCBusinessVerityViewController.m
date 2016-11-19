//
//  WTCBusinessVerityViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBusinessVerityViewController.h"
#import "WTCApplyBusinessLicenseResult.h"
#import "WTCApplyBusinessLicenseRequest.h"
#import "MBProgressHUD.h"
@interface WTCBusinessVerityViewController ()

@end

@implementation WTCBusinessVerityViewController

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

- (IBAction)ConfirmBusinessButtonClick:(id)sender {
    NSString *applyNameToken = [[CommonVar sharedInstance] getLoginToken];
    NSString *licencePath = @"";
    [self setBusyIndicatorVisible:YES];
    WTCApplyBusinessLicenseRequest *request = [[WTCApplyBusinessLicenseRequest alloc]initWithLicencePath:licencePath Token:applyNameToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
        WTCApplyBusinessLicenseResult *applyNameResult = [request getResponse].data;
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];

}

- (IBAction)VeritylicencePicButtonClick:(id)sender {
}
@end
