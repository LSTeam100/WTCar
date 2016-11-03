//
//  WTCBaseViewController.m
//  WTCar
//
//  Created by apple on 2016/10/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBaseViewController.h"
#import "WTCTabBarViewController.h"
#import "MBProgressHUD.h"
#import "WTCLoginRequest.h"
#import "WTCLoginResult.h"
#import "LoginViewController.h"
@interface WTCBaseViewController ()
{
    int _busyCount;

}
@property (strong, nonatomic)MBProgressHUD *busyIndicator;
@end

@implementation WTCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setupNavBar];
    [self setupTabar];
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self WTCTabBarController] setTabBarHidden:YES animated:YES];


}
-(void)setupTabar
{
    self.tabBarController.hidesBottomBarWhenPushed = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setBusyIndicatorVisible:(BOOL)visible{
    if(visible){
        _busyCount++;
        if(self.busyIndicator==nil){
            self.busyIndicator=[MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].windows lastObject] animated:YES];
            self.busyIndicator.dimBackground=YES;
        }
    }else{
        _busyCount--;
        if(_busyCount==0 || _busyCount<0){
            _busyCount=0;
            [self.busyIndicator hide:YES];
            [self.busyIndicator removeFromSuperview];
            self.busyIndicator=nil;
        }
    }
}

-(BOOL)handleResponseError:(WTCBaseViewController *)currentController
                   request:(WTCarBaseRequest *)request
       treatErrorAsUnknown:(BOOL) treated{
    int statusCode=[request getResponse].statusCode;
    if(statusCode==430||statusCode==431){
        [self handleSessionTimeout:currentController request:request];
        return YES;
    }else if(statusCode==-100){
        [self showMessage:[request getResponse].errorMessage];
        return YES;
    }
    else if (statusCode==502)
    {
        [self showMessage:@"没有权限"];
        return YES;
    }
    else if (statusCode==503)
    {
        [self showMessage:@"已存在该数据"];
    }
    else if(statusCode==504)
    {
        [self showMessage:@"数据库错误"];
    }
    else if (statusCode==1002)
    {
        [self showMessage:@"用户不存在或密码错误"];
    }
    else if (statusCode==506)
    {
        [self showMessage:@"更新失败"];
    }
    else if (statusCode==516)
    {
        [self showMessage:@"库存不够"];
    }
    else if (statusCode==507)
    {
        [self showMessage:@"验证码错误"];
    }
    else if (statusCode==508)
    {
        [self showMessage:@"无权限"];
    }
    else if (statusCode==404)
    {
        
    }
    else if (statusCode==450)
    {
        [self showMessage:@"该用户已存在"];
    }
    else if (statusCode==510)
    {
        [self showMessage:@"商铺歇业中"];
    }
    else if (statusCode==511)
    {
        [self showMessage:@"当前城市不支持"];
    }
    else{
        if(treated){
            [self showDefaultFailureMessage];
            return YES;
        }
    }
    return NO;
}

-(void)handleSessionTimeout:(WTCBaseViewController *)currentController
                    request:(WTCarBaseRequest *)orginalRequest{
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    NSString *mobilePhone=[userDefault stringForKey:@"loginName"];
    NSString *password=[userDefault stringForKey:@"password"];
    
    if(mobilePhone!=nil && mobilePhone.length>0 &&password!=nil && password.length>0){
        WTCLoginRequest *request = [[WTCLoginRequest alloc]initWithLoginName:mobilePhone password:password successCallback:^(WTCarBaseRequest *request) {
            WTCLoginResult *loginResult = [request getResponse].data;
            NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
            [userDefault setValue:mobilePhone forKey:@"loginName"];
            [userDefault setValue:password forKey:@"password"];
            NSString *token=loginResult.token;
            [userDefault setValue:token forKey:@"token"];
            [orginalRequest updateToken:token];
            
        } failureCallback:^(WTCarBaseRequest *request) {
            if(orginalRequest!=nil ){
                onFailureCallback failure=[orginalRequest failCallback];
                failure(request);
            }
        }];
        [request start];
    }
    else
    {
        LoginViewController *login=[[LoginViewController alloc]init];
        UINavigationController *navi=[[UINavigationController alloc]initWithRootViewController:login];
        [self presentViewController:navi animated:YES completion:nil];
    }
}

-(void)setSigleButtonBg:(UIButton *)button{
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    button.backgroundColor=[UIColor clearColor];
    
    UIColor *normalColor=colorWithHexString(@"#0ABC80", 1.0f);
    UIColor *clickedColor=colorWithHexString(@"#08A370", 1.0f);
    CGRect rect=CGRectMake(0, 0, button.frame.size.width, button.frame.size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [clickedColor CGColor]);
    CGContextFillRect(context, rect);
    UIImage *pressedImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(rect.size);
    context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [normalColor CGColor]);
    CGContextFillRect(context, rect);
    UIImage *normalBg=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [button setBackgroundImage:normalBg forState:UIControlStateNormal];
    [button setBackgroundImage:pressedImage forState:UIControlStateHighlighted];
    
    button.layer.cornerRadius=10.0f;
    button.layer.masksToBounds=YES;
}

-(void)showDefaultFailureMessage{
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@""
                                                     message:@"操作失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
}

-(void)showMessage:(NSString *)message{
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@""
                                                     message:message
                                                    delegate:nil
                                           cancelButtonTitle:@"确定"
                                           otherButtonTitles:nil];
    [alertView show];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
