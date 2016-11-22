//
//  UPMBaseCustomNavBarViewController.m
//  UPMeilin
//
//  Created by 曾宏亮 on 15/7/23.
//  Copyright (c) 2015年 duanran. All rights reserved.
//

#import "UPMBaseCustomNavBarViewController.h"
#import "define.h"

@interface UPMBaseCustomNavBarViewController ()

@end

@implementation UPMBaseCustomNavBarViewController

@synthesize naviGantionBar;

- (void)viewDidLoad {
    [super viewDidLoad];
       // Do any additional setup after loading the view.
    naviGantionBar=[[UPMNavigatinBar alloc]initWithFrame:CGRectMake(self.navigationController.navigationBar.frame.origin.x,-20, self.navigationController.navigationBar.frame.size.width, self.navigationController.navigationBar.frame.size.height+40)];
    naviGantionBar.delegate=self;
    [self.navigationController.view addSubview:naviGantionBar];
    
    self.naviGantionBar.backBtn.hidden=NO;
//    naviGantionBar.backgroundColor=colorWithHexString(@"0ABC80", 1.0);
    naviGantionBar.backgroundColor=[UIColor clearColor];
    self.navigationController.view.backgroundColor=[UIColor whiteColor];
//self.navigationController.view.backgroundColor=colorWithHexString(@"0ABC80", 1.0);

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTranslucent:YES];
    self.navigationController.navigationBarHidden=NO;
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
