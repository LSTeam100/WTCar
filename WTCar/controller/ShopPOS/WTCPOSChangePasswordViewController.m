//
//  WTCPOSChangePasswordViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCPOSChangePasswordViewController.h"

@interface WTCPOSChangePasswordViewController ()

@end

@implementation WTCPOSChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title =@"修改支付密码";
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
}
@end
