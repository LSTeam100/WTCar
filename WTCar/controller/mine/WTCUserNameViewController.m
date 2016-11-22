//
//  WTCUserNameViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCUserNameViewController.h"

#import "WTCModifyStoreInfoRequest.h"

@interface WTCUserNameViewController ()<UITextFieldDelegate>

@end

@implementation WTCUserNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:247/255.0f blue:245/255.0f alpha:1];
    self.title = @"修改用户名";
    _NameTextField.text =_realName;

    _NameTextField.delegate = self;
    _NameTextField.returnKeyType = UIReturnKeyDone;
    
    // Do any additional setup after loading the view from its nib.
}
//-(void)viewDidAppear:(BOOL)animated
//{
//}
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
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)SaveUserNameButtonClick:(id)sender {
    NSString*upDataName = _NameTextField.text;
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];

    if ([upDataName isEqualToString:@""]) {
        [[CommonVar sharedInstance]showMessage:@"用户名不能为空" ShowController:self];
        return;
    }
    
    [self setBusyIndicatorVisible:YES];
    NSDictionary *dic = @{@"nick":upDataName};
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
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)DeleTextFieldButtonClick:(id)sender {
}
@end
