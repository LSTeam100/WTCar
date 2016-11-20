//
//  ResgisterSecondViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ResgisterSecondViewController.h"
#import "RegisterThreeViewController.h"
#import "WTCVerfiyCodeRequest.h"
#import "WTCVerifyCode.h"
#import "MBProgressHUD.h"
#import "WTCChekVerityCodeRequest.h"
@interface ResgisterSecondViewController ()
{
    NSTimer *countDownTimer;
    NSInteger countTime;
}

@end

@implementation ResgisterSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.getVerityCodeButton setEnabled:YES];

    [_getVerityCodeButton addTarget:self action:@selector(getVerityCodeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)getVerityCodeButtonClick{
    countTime = 60;

    NSString *account =_teleNum;
    [self setBusyIndicatorVisible:YES];
    WTCVerfiyCodeRequest *request = [[WTCVerfiyCodeRequest alloc]initWithLoginName:account successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
        countDownTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:countDownTimer forMode:NSRunLoopCommonModes];
        
        WTCVerifyCode *result = [request getResponse].data;
        _verityCodeTextField.text = result.validationCode;
        [_verityCodeTextField reloadInputViews];
        
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
        
    }];
    [request start];
}
-(void)countDown
{
    NSLog(@"进入倒计时方法");
    countTime--;
    if (countTime == 0) {
        [countDownTimer invalidate];
        [self.getVerityCodeButton setTitle:[NSString stringWithFormat:@"获取验证码"] forState:UIControlStateNormal];
        
        [self.getVerityCodeButton setEnabled:YES];

    }
    else
    {
        [self.getVerityCodeButton setTitle:[NSString stringWithFormat:@"倒计时%ld",countTime] forState:UIControlStateNormal];
        [self.getVerityCodeButton setEnabled:NO];
        
    }
    
    
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [countDownTimer invalidate];
}

//检验验证码
-(void)checkCodeRequest
{
    NSString *code = _verityCodeTextField.text;
    
    NSString *account = _teleNum;
    [self setBusyIndicatorVisible:YES];
     WTCChekVerityCodeRequest*request = [[WTCChekVerityCodeRequest alloc]initWithLoginName:account Code:code  successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
        NSObject *result = [request getResponse].data;
        
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

- (IBAction)SubmitButtonClick:(id)sender {
    [self checkCodeRequest];
    RegisterThreeViewController *regisThreeViewCon = [RegisterThreeViewController new];
    regisThreeViewCon.verityCode = _verityCodeTextField.text;
    regisThreeViewCon.teleNum = _teleNum;
    [self.navigationController pushViewController:regisThreeViewCon animated:YES];
}
@end
