//
//  CommonVar.m
//  libObaby
//
//  Created by apple on 16/9/18.
//
//

#import "CommonVar.h"

@implementation CommonVar
+ (instancetype)sharedInstance {
    static CommonVar *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.loginToken = @"";
    
    });
    return sharedInstance;
}
-(NSString *)getLoginToken
{
    self.loginToken = [[NSUserDefaults standardUserDefaults]objectForKey:@"token"];
    return self.loginToken;
}
-(void)showMessage:(NSString *)message ShowController:(UIViewController *)showController
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:showController.view animated:YES];
    
    // Set the text mode to show only text.
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    // Move to bottm center.
    hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
    
    [hud hideAnimated:YES afterDelay:3.f];

}
@end
