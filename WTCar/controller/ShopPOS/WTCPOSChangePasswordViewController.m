//
//  WTCPOSChangePasswordViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCPOSChangePasswordViewController.h"
#import "WTCChangePOSPassWordRequest.h"
#import "WTCChangePOSPassWordResult.h"
#import "MBProgressHUD.h"
#import "WTCHomeViewController.h"
@interface WTCPOSChangePasswordViewController ()

@end

@implementation WTCPOSChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.flag == 1) {
        self.navigationItem.title =@"修改POS登录密码";
    }
    else
    {
        self.navigationItem.title =@"修改支付密码";

    }
    [self addsubview];
    // Do any additional setup after loading the view from its nib.
}

//加载密码输入框
-(void)addsubview
{
    self.password = [[TTPasswordView alloc] initWithFrame:CGRectMake(156+10, 64+3, SCREEN_WIDTH-200, (SCREEN_WIDTH-200)/6)];
    self.password.elementCount = 6;
    self.password.elementColor=UIColorFromRGB(0xd5d5d5);
    [_ChangeCodeContentView addSubview:self.password];
    self.password2 = [[TTPasswordView alloc] initWithFrame:CGRectMake(166, 97+3, SCREEN_WIDTH-200,(SCREEN_WIDTH-200)/6)];
    self.password2.elementCount = 6;
    self.password2.elementColor=UIColorFromRGB(0xd5d5d5);
    [_ChangeCodeContentView addSubview:self.password2];
    self.password3 = [[TTPasswordView alloc] initWithFrame:CGRectMake(166, 130+3, SCREEN_WIDTH-200,(SCREEN_WIDTH-200)/6)];
    self.password3.elementCount = 6;
    self.password3.elementColor=UIColorFromRGB(0xd5d5d5);
    [_ChangeCodeContentView addSubview:self.password3];
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

- (IBAction)ConfirmPOSCodeButtonClick:(id)sender {
    NSString *congfirmPosLoginPasswd = _password3.textField.text;
    NSString *newPosLoginPasswd = _password2.textField.text;
    NSString *posLoginPasswd = _password.textField.text;
    
    if ([newPosLoginPasswd isEqualToString:congfirmPosLoginPasswd]) {
        
        [self setBusyIndicatorVisible:YES];
        NSString *changePasswdToken = [[CommonVar sharedInstance] getLoginToken];

        WTCChangePOSPassWordRequest *request = [[WTCChangePOSPassWordRequest alloc] initWithNewPosLoginPasswd:newPosLoginPasswd PosLoginPasswd:posLoginPasswd Token:changePasswdToken successCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            
            int index = 0;
            for (int i = 0; i < self.navigationController.viewControllers.count; i++) {
                id controller = [self.navigationController.viewControllers objectAtIndex:i];
                NSLog(@"controller=%@",controller);
                if ([controller isKindOfClass:[WTCHomeViewController class]]) {
                    index = i;
                    [self.navigationController popToViewController:controller animated:YES];
                    
                }
            }
        } failureCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            [self handleResponseError:self request:request treatErrorAsUnknown:YES];
        }];
        [request start];

        
    }
    else
    {
        [[CommonVar sharedInstance]showMessage:@"输入密码不一致" ShowController:self.navigationController];
    }
    
    
    
}
@end
