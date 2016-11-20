//
//  WTCNotGetPOSViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCNotGetPOSViewController.h"
#import "WTCGetPOSNotOpenViewController.h"
#import "WTCReceivePOSResult.h"
#import "WTCReceivePOSRequest.h"
#import "MBProgressHUD.h"
#import "WTCPOSHasOpenedViewController.h"
#import "WTCPOSToOpenViewController.h"
@interface WTCNotGetPOSViewController ()

@end

@implementation WTCNotGetPOSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:247/255.0f blue:245/255.0f alpha:1];
    if (self.posFag == 0) {
        [self.posBtn setTitle:@"立即领取POS机" forState:UIControlStateNormal];
    }
    else if (self.posFag ==1)
    {
        [self.posBtn setTitle:@"审核中" forState:UIControlStateNormal];
    }
    else if (self.posFag ==2)
    {
        [self.posBtn setTitle:@"已领取POS机,点此开通" forState:UIControlStateNormal];

    }
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)getPos:(id)sender
{
    if (self.posFag == 0) {
        NSString *loginToken = [CommonVar sharedInstance].loginToken;
        [self setBusyIndicatorVisible:YES];
        WTCReceivePOSRequest *request = [[WTCReceivePOSRequest alloc]initWithToken:loginToken successCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            NSString *message = [request getResponse].data;
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            hud.label.text = message;
            // Move to bottm center.
            hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
            
            [hud hideAnimated:YES afterDelay:3.f];
            
            [self performSelector:@selector(back) withObject:nil afterDelay:3];
            
        } failureCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
        }];
        [request start];

    }
    else if (self.posFag == 2)
    {
        WTCPOSToOpenViewController * controller = [[WTCPOSToOpenViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)ToGetPOSButtonClick:(id)sender {
    NSString *receivePosToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCReceivePOSRequest *request = [[WTCReceivePOSRequest alloc]initWithToken:receivePosToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
        WTCReceivePOSResult *receivePosResult = [request getResponse].data;
        
        WTCGetPOSNotOpenViewController *GetPOSNotOpenViewCon = [WTCGetPOSNotOpenViewController new];
        [self.navigationController pushViewController:GetPOSNotOpenViewCon animated:YES];
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];

}

@end
