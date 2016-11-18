//
//  ChildLoginViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ChildLoginViewController.h"
#import "WTCHomeViewController.h"
#import "WTCChildLoginRequest.h"
#import "WTCChildLoginResult.h"
#import "WTCTabBarViewController.h"
@interface ChildLoginViewController ()

@end

@implementation ChildLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)LoginButtonClick:(id)sender {
    NSString *mainAccount = _MainTeleNumTextField.text;
    NSString *childAccount = _ChildTeleNumTextField.text;
    NSString *accountKey = _KeyTextField.text;
    
    if (self.MainTeleNumTextField.text.length == 0) {
        
    }
    else if(self.ChildTeleNumTextField.text.length == 0){
        
    }else if (self.KeyTextField.text.length == 0){
        
    }
    else
    {
        [self setBusyIndicatorVisible:YES];
        WTCChildLoginRequest *request = [[WTCChildLoginRequest alloc]initWithChildAccountKey:accountKey MainAccount:mainAccount childAccountTele:childAccount successCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            
            WTCChildLoginResult *childloginResult = [request getResponse].data;
            NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
            [userDefault setValue:childAccount forKey:@"childloginName"];
            [userDefault setValue:accountKey forKey:@"childaccountKey"];
            NSString *token=childloginResult.subToken;
            [userDefault setValue:token forKey:@"subtoken"];
            
            WTCTabBarViewController *wtcTabbar=[[WTCTabBarViewController alloc]init];
            [self.navigationController pushViewController:wtcTabbar animated:YES];
            //            UINavigationController *parentVc= (UINavigationController *)[self presentingViewController];
            //
            //            [parentVc popToRootViewControllerAnimated:NO];
            //            WTCTabBarViewController *wtcTabbar=[[WTCTabBarViewController alloc]init];
            //            [parentVc pushViewController:wtcTabbar animated:YES];
            
            
            
        } failureCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            [self handleResponseError:self request:request treatErrorAsUnknown:YES];
        }];
        [request start];
    }

}
@end
