//
//  WTCCarShopNameViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCarShopNameViewController.h"
#import "WTCModifyStoreInfoRequest.h"
@interface WTCCarShopNameViewController ()

@end

@implementation WTCCarShopNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改车行名称";
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:247/255.0f blue:245/255.0f alpha:1];
    self.ShopNameTextField.text = self.shopName;
    self.ShopNameTextField.delegate = self;
    self.ShopNameTextField.returnKeyType = UIReturnKeyDone;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)SaveCarShopNameButtonClick:(id)sender {
    NSString*upDataName = self.ShopNameTextField.text;
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    
    if (upDataName.length == 0) {
        [[CommonVar sharedInstance]showMessage:@"车行名称不能为空" ShowController:self];
        return;
    }
    
    [self setBusyIndicatorVisible:YES];
    NSDictionary *dic = @{@"merchantName":upDataName};
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
- (IBAction)DeleShopNameButtonClick:(id)sender {
}
@end
