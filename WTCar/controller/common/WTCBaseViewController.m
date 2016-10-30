//
//  WTCBaseViewController.m
//  WTCar
//
//  Created by apple on 2016/10/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBaseViewController.h"
#import "WTCTabBarViewController.h"
@interface WTCBaseViewController ()

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
-(void)setupNavBar{
    [self.navigationController.navigationBar setTranslucent:NO];
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

@end
