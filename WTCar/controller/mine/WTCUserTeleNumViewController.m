//
//  WTCUserTeleNumViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCUserTeleNumViewController.h"
#import "WTCModifyStoreInfoRequest.h"
@interface WTCUserTeleNumViewController ()

@end

@implementation WTCUserTeleNumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:247/255.0f blue:245/255.0f alpha:1];
    self.title = @"修改店铺电话";
    self.TeleTextField.text = self.telePhone;
    self.TeleTextField.delegate = self;
    self.TeleTextField.returnKeyType = UIReturnKeyDone;
    
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)SaveUserNameButtonClick:(id)sender {
    
    
    
}
-(void)back{
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

- (IBAction)SaveUserTeleNumButtonClick:(id)sender {
    NSString*upDataName = self.TeleTextField.text;
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    
    if (upDataName.length != 11) {
        [[CommonVar sharedInstance]showMessage:@"请输入正确的手机号" ShowController:self];
        return;
    }
    
    [self setBusyIndicatorVisible:YES];
    NSDictionary *dic = @{@"mobile":upDataName};
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
- (IBAction)DeleTeleButtonClick:(id)sender {
}
@end
