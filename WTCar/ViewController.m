//
//  ViewController.m
//  WTCar
//
//  Created by apple on 2016/10/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "WTCTabBarViewController.h"
#import "LoginViewController.h"
#import "GuideViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *myView = [[UIView alloc]init];
    myView.backgroundColor =[UIColor blackColor];
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    NSString *leadPage=[userDefault objectForKey:@"leadPage"];
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
    
    if (![leadPage isEqualToString:version]) {
        GuideViewController *guide = [[GuideViewController alloc]init];
        [self.navigationController pushViewController:guide animated:YES];
    }
    else
    {
        NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
        NSString *loginToken=[userDefault objectForKey:@"token"];
        if (loginToken == NULL) {
            LoginViewController *login = [[LoginViewController alloc]init];
            [self.navigationController pushViewController:login animated:YES];
        }
        else{
            WTCTabBarViewController *upmTabbar=[[WTCTabBarViewController alloc]init];
            [self.navigationController pushViewController:upmTabbar animated:YES];
        }
    }
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
