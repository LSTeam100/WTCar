//
//  WTCPOSHasOpenedViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCPOSHasOpenedViewController.h"
#import "WTCPOSChangePasswordViewController.h"
#import "WTCGetPOSInfoResult.h"
#import "WTCGetPOSInfoRequest.h"
@interface WTCPOSHasOpenedViewController ()

@end

@implementation WTCPOSHasOpenedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"商家POS";
    [self getPOSInfo];
    // Do any additional setup after loading the view from its nib.
}
-(void)getPOSInfo
{
    NSString *getPosToken = [[CommonVar sharedInstance]getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCGetPOSInfoRequest *request = [[WTCGetPOSInfoRequest alloc]initWithToken:getPosToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
        WTCGetPOSInfoResult *getPosResult = [request getResponse].data;
        if (getPosResult == NULL || getPosResult == nil) {
        }
        else
        {
            
            self.POSIDLabel.text = getPosResult.posloginAccount;
            self.POSSNLabel.text = getPosResult.possSn;
        }
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];
    
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

- (IBAction)ChangePOSLogCodeButtonClick:(id)sender {
    WTCPOSChangePasswordViewController *POSChangeCodeViewCon = [WTCPOSChangePasswordViewController new];
    [self.navigationController pushViewController:POSChangeCodeViewCon animated:YES];
}
@end
