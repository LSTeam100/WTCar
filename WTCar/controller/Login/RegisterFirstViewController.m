//
//  RegisterFirstViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RegisterFirstViewController.h"
#import "ResgisterSecondViewController.h"
#import "WTCIsAccountExistResult.h"
#import "WTCIsAccountExistRequest.h"

@interface RegisterFirstViewController ()<UITextFieldDelegate>

@end

@implementation RegisterFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _ReTeleImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_ReTeleImageView];
    //电话输入
    _TeleNumTextField.borderStyle = UITextBorderStyleNone;
    _TeleNumTextField.adjustsFontSizeToFitWidth = YES;
    _TeleNumTextField.keyboardType = UIKeyboardTypeDefault;
    _TeleNumTextField.delegate = self;
//    _TeleNumTextField.leftView = _ReTeleImageView;
    _TeleNumTextField.leftViewMode = UITextFieldViewModeAlways;
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [_TeleNumTextField resignFirstResponder];
}
//当用户按下return键或者按回车键，keyboard消失
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
//验证账号
-(void)IsAccountExist
{
    NSString *teleAccount = _TeleNumTextField.text;
    [self setBusyIndicatorVisible:YES];
    WTCIsAccountExistRequest *request = [[WTCIsAccountExistRequest alloc]initWithLoginName:teleAccount successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
        WTCIsAccountExistResult *result = [request getResponse].data;
        NSLog(@"成功");
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];

}
- (IBAction)NextStepButtonClick:(id)sender {
    [self IsAccountExist];
    ResgisterSecondViewController *registerSecondViewCon = [ResgisterSecondViewController new];
    registerSecondViewCon.teleNum = _TeleNumTextField.text;
    [self.navigationController pushViewController:registerSecondViewCon animated:YES];
}
@end
