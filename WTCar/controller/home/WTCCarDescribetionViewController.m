//
//  WTCCarDescribetionViewController.m
//  WTCar
//
//  Created by apple on 2016/11/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCarDescribetionViewController.h"
#import "BRPlaceholderTextView.h"
@interface WTCCarDescribetionViewController ()

@end

@implementation WTCCarDescribetionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"车辆信息描述";
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)save:(id)sender
{
    if (self.desDelegate && [self.desDelegate respondsToSelector:@selector(saveCarDescribtion:)] ) {
        [self.desDelegate saveCarDescribtion:self.textView.text];
        [self.navigationController popViewControllerAnimated:YES];
    }
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
