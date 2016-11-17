//
//  WTCShopSettingViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCShopSettingViewController.h"
#import "WTCMyDetailViewController.h"
#import "ShopSettingTableViewCell.h"
#import "ShopSettingView.h"
@interface WTCShopSettingViewController ()
@property(strong,nonatomic)ShopSettingView *shopsettingView;
@end

@implementation WTCShopSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:247/255.0f blue:245/255.0f alpha:1];
    self.title = @"店铺设置";
    [self makeShopSettingView];
    // Do any additional setup after loading the view from its nib.
}
-(void)dataInit{
   
}

-(void)makeShopSettingView
{
    _shopsettingView = [[NSBundle mainBundle]loadNibNamed:@"ShopSettingView" owner:nil options:nil][0];
    _shopsettingView.frame = CGRectMake(0,251, SCREEN_WIDTH, 200);
    [_shopSettingContentView addSubview:_shopsettingView];
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

- (IBAction)editeShopInfoButtonClick:(id)sender {
    WTCMyDetailViewController *myDetailViewController = [WTCMyDetailViewController new];
    [self.navigationController pushViewController:myDetailViewController animated:YES];
}
@end
