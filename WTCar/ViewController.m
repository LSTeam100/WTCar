//
//  ViewController.m
//  WTCar
//
//  Created by apple on 2016/10/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "WTCTabBarViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *myView = [[UIView alloc]init];
    myView.backgroundColor =[UIColor blackColor];
    WTCTabBarViewController *upmTabbar=[[WTCTabBarViewController alloc]init];
    [self.navigationController pushViewController:upmTabbar animated:YES];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
