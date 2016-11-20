//
//  WTCMineViewController.m
//  WTCar
//
//  Created by apple on 2016/10/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCMineViewController.h"
#import "SettingViewController.h"
#import "MoneyInfoTableViewCell.h"
#import "WTCProfileInfoTableViewCell.h"
#import "HeadTableViewCell.h"
#import "MoneyInfoTableViewCell.h"
#import "WTCMineDetailViewController.h"
#import "WTCNotGetPOSViewController.h"
#import "WTCCashToPasswordViewController.h"
#import "SettingPayCodeViewController.h"
#import "WTCChildAccountViewController.h"
#import "WTCCashRecordViewController.h"
#import "WTCMyDetailViewController.h"
#import "WTCGetUserWalletResult.h"
#import "WTCGetUserWalletRequest.h"
#import "MBProgressHUD.h"
#import "WTCIsBindCardResult.h"
#import "WTCIsBindCardRequest.h"
#import "WTCUserInfoRequest.h"
#import "WTCGetUserInfoResult.h"

@interface WTCMineViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *posInfoArr;
    NSArray *headIconArr;
}
@property(nonatomic,weak)IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSString *userName;
@property(nonatomic,strong)NSString *userPhoto;
@property(nonatomic,strong)NSString *merchantName;
@end

@implementation WTCMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor blueColor];
//    UIButton*testButton=[[UIButton alloc]initWithFrame:CGRectMake(160, 50, 70, 70)];
//    testButton.backgroundColor= [UIColor redColor];
//    [testButton addTarget:self action:@selector(clickTestButton) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:testButton];
    posInfoArr = @[@"pos收款",@"提现",@"账单",@"我的银行卡",@"子账户",@"推荐好友",@"设置"];
    headIconArr = @[@"mine_collectmoney",@"mine_wtihdrawCash",@"mine_bill",@"mine_bannkcard",@"mine_sub_account",@"mine_recommend",@"mine_seting"];
    
    self.title = @"我的";
    [self getUserBaseInfo];
    // Do any additional setup after loading the view from its nib.
}
//是否绑定银行卡
-(void)IsBindBankCardRequest
{
    NSString *IsBindBankToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCIsBindCardRequest *request = [[WTCIsBindCardRequest alloc]initWithToken:IsBindBankToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
        WTCIsBindCardResult *IsBindCardResult = [request getResponse].data;
        _IsBind = IsBindCardResult.isBind;
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];
}
//获取用户钱包信息
-(void)getUserWalletInfoRequest
{
    NSString *getWalletInfoToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCGetUserWalletRequest *request = [[WTCGetUserWalletRequest alloc]initWithToken:getWalletInfoToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
        WTCGetUserWalletResult *getUserWalletInfoResult = [request getResponse].data;

    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 100;
    }
    else if (indexPath.row == 1)
    {
        return 100;
    }
    else
    {
        return 50;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}
-(void)viewWillAppear:(BOOL)animated
{
    [[self WTCTabBarController] setTabBarHidden:NO animated:YES];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return [self getHeadInfo:tableView atIndex:indexPath];
    }
    else if (indexPath.row == 1)
    {
        return [self getMoneyInfo:tableView atIndex:indexPath];
    }
    else
    {
        return [self getProfileInfo:tableView atIndex:indexPath];
    }
}
-(UITableViewCell *)getProfileInfo:(UITableView *)tableView atIndex:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"profilecell";
    WTCProfileInfoTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        NSArray *cellArr = [[NSBundle mainBundle]loadNibNamed:@"WTCProfileInfoTableViewCell" owner:self options:nil];
        cell = [cellArr objectAtIndex:0];
    }
    NSInteger index = indexPath.row - 2;
    cell.headTitle.text = [posInfoArr objectAtIndex:index];
    NSString *imageName = [headIconArr objectAtIndex:index];
    cell.headIcon.image = [UIImage imageNamed:imageName];
    //    cell.headTitle.text = [posInfoArr objectAtIndex:indexPath.row];
    return cell;
}

-(UITableViewCell *)getMoneyInfo:(UITableView *)tableView atIndex:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"moneycell";
    MoneyInfoTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        NSArray *cellArr = [[NSBundle mainBundle]loadNibNamed:@"MoneyInfoTableViewCell" owner:self options:nil];
        cell = [cellArr objectAtIndex:0];
    }
    return cell;
}
-(UITableViewCell *)getHeadInfo:(UITableView *)tableView atIndex:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"headcell";
    HeadTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        NSArray *cellArr = [[NSBundle mainBundle]loadNibNamed:@"HeadTableViewCell" owner:self options:nil];
        cell = [cellArr objectAtIndex:0];
    }
    
//    @property(nonatomic,weak)IBOutlet UIImageView *profileImageView;
//    @property(nonatomic,weak)IBOutlet UILabel *shopNameLabel;
//    @property(nonatomic,weak)IBOutlet UILabel *shopOwnerLabel;
//    @property(nonatomic,weak)IBOutlet UIImageView *vIdtiferImageview;
//    @property(nonatomic,weak)IBOutlet UIImageView *bodyIndeiferImageView;

    if (self.userName) {
        cell.shopOwnerLabel.text = self.userName;
    }
    if (self.userPhoto) {
        [cell.profileImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.userPhoto]] placeholderImage:[UIImage imageNamed:@"mine_user"]];
    }
    if (self.merchantName) {
        cell.shopNameLabel.text = self.merchantName;
    }
    
    
    return cell;
}
-(void)clickTestButton
{
    SettingViewController *settingViewController = [SettingViewController new];
    [self.navigationController pushViewController:settingViewController animated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        WTCMyDetailViewController *detail = [[WTCMyDetailViewController alloc]init];
        
//        WTCMineDetailViewController *detail = [[WTCMineDetailViewController alloc]init];
        [self.navigationController pushViewController:detail animated:YES];
    }
    else if(indexPath.row == 2)
    {
        WTCNotGetPOSViewController *posViewController = [[WTCNotGetPOSViewController alloc]init];
        [self.navigationController pushViewController:posViewController animated:YES];
    }
    else if (indexPath.row == 3)
    {
        if (_IsBind==0) {
            SettingPayCodeViewController *setPayCodeViewcon = [SettingPayCodeViewController new];
            
            setPayCodeViewcon.CashHasNameSetpassword = YES;
            [self.navigationController pushViewController:setPayCodeViewcon animated:YES];
        } else {
            
        }
        
    }
    else if (indexPath.row == 4)
    {
        if (_IsBind==0) {
            WTCCashRecordViewController *CashRecordViewCon = [WTCCashRecordViewController new];
            [self.navigationController pushViewController:CashRecordViewCon animated:YES];
        } else {
            
        }

    }
    else if (indexPath.row == 5)
    {
        if (_IsBind == 0) {
            WTCCashToPasswordViewController *cashToPasswordViewCon = [WTCCashToPasswordViewController new];
            cashToPasswordViewCon.AddBankCardHasCardLogpassword = YES;
            [self.navigationController pushViewController:cashToPasswordViewCon animated:YES];
        } else {
            
        }

    }
    else if (indexPath.row == 6)
    {
        WTCChildAccountViewController *childAccountViewCon = [WTCChildAccountViewController new];
        [self.navigationController pushViewController:childAccountViewCon animated:YES];
    }
    else if (indexPath.row == 7)
    {
        
    }
    else if (indexPath.row == 8)
    {
        SettingViewController *settingViewCon = [SettingViewController new];
        [self.navigationController pushViewController:settingViewCon animated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-获取用户基本信息
-(void)getUserBaseInfo
{
    NSString *loginToken = [CommonVar sharedInstance].loginToken;
    [self setBusyIndicatorVisible:YES];
    WTCUserInfoRequest *request = [[WTCUserInfoRequest alloc]initWithToken:loginToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        WTCGetUserInfoResult *result = [request getResponse].data;
        
        self.userName = result.realName;
        self.userPhoto = result.headPortraitPath;
        self.merchantName = result.merchantName;
        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];

        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:NO];
    }];
    [request start];
    
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
