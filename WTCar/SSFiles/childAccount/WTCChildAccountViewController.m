//
//  WTCChildAccountViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCChildAccountViewController.h"

@interface WTCChildAccountViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *childAccountTableView;
@end

@implementation WTCChildAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:247/255.0f blue:245/255.0f alpha:1];
    UIBarButtonItem *addButtonItem = [self createBarButtonItemWithImage:[UIImage imageNamed:@"addloan_title"] action:@selector(addChildAccount:) target:self];
    self.navigationItem.rightBarButtonItem = addButtonItem;
    // Do any additional setup after loading the view from its nib.
}
- (void)addLoan:(id)sender
{
//    AddLoanViewController *addloanViewCon = [AddLoanViewController new];
//    [self.navigationController pushViewController:addloanViewCon animated:YES];
    //    [ProgressHUD dismiss];
    
}
- (UIBarButtonItem *)createBarButtonItemWithImage:(UIImage *)image action:(SEL)action target:(id)target
{
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:action];
    
    return barButtonItem;
    
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
