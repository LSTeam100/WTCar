//
//  RegisterThreeViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RegisterThreeViewController.h"
#import "WTCHomeViewController.h"
#import "WTCTabBarViewController.h"
#import "WTCRegisterRequest.h"
#import "WTCRegisterResult.h"
#import "MBProgressHUD.h"
@interface RegisterThreeViewController ()

@end

@implementation RegisterThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [_passWordTextField resignFirstResponder];
    [_TeleNumTextField resignFirstResponder];
    [_carTypeTextField resignFirstResponder];
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

- (IBAction)confirmButtonClick:(id)sender {
    
    NSString *mobilePhone = self.TeleNumTextField.text;
    NSString *password = self.passWordTextField.text;
    NSString *VerityCode = self.verityCodeTextfield.text;
    NSString *carType = self.carTypeTextField.text;
    if (self.TeleNumTextField.text.length == 0) {
        
    }
    else if(self.passWordTextField.text.length == 0){
        
    }
    else
    {
        [self setBusyIndicatorVisible:YES];
        WTCRegisterRequest *request = [[WTCRegisterRequest alloc]initWithLoginName:mobilePhone password:password AccountType:carType VerityCode:VerityCode successCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            
            WTCRegisterResult *registerResult = [request getResponse].data;
            NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
            [userDefault setValue:mobilePhone forKey:@"loginName"];
            [userDefault setValue:password forKey:@"password"];
            [userDefault setValue:carType forKey:@"carType"];
            NSString *token=registerResult.token;
            [userDefault setValue:token forKey:@"token"];
            
            WTCTabBarViewController *wtcTabbar=[[WTCTabBarViewController alloc]init];
            [self.navigationController pushViewController:wtcTabbar animated:YES];

        } failureCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            [self handleResponseError:self request:request treatErrorAsUnknown:YES];
        }];
        [request start];
    }
}
@end
