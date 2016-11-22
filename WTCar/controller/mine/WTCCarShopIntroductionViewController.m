//
//  WTCCarShopIntroductionViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCarShopIntroductionViewController.h"
#import "WTCModifyStoreInfoRequest.h"
@interface WTCCarShopIntroductionViewController ()

@end

@implementation WTCCarShopIntroductionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.text = self.shopDes;
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

- (IBAction)SaveCarShopIntroButtonClick:(id)sender {
    
    NSString*upDataName = self.textView.text;
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    
    if (upDataName.length == 0) {
        [[CommonVar sharedInstance]showMessage:@"车辆描述不能为空" ShowController:self];
        return;
    }
    
    [self setBusyIndicatorVisible:YES];
    NSDictionary *dic = @{@"merchantDescr":upDataName};
    WTCModifyStoreInfoRequest *request = [[WTCModifyStoreInfoRequest alloc]initModifyStoreInfo:loginToken DataDic:dic successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [[CommonVar sharedInstance]showMessage:@"修改成功" ShowController:self];
        [self performSelector:@selector(back) withObject:nil afterDelay:3.0];
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:NO];
    }];
    [request start];

    
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
