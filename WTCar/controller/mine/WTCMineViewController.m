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
@interface WTCMineViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak)IBOutlet UITableView *tableView;
@end

@implementation WTCMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor blueColor];
//    UIButton*testButton=[[UIButton alloc]initWithFrame:CGRectMake(160, 50, 70, 70)];
//    testButton.backgroundColor= [UIColor redColor];
//    [testButton addTarget:self action:@selector(clickTestButton) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:testButton];
    self.title = @"我的";
    // Do any additional setup after loading the view from its nib.
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
        WTCMineDetailViewController *detail = [[WTCMineDetailViewController alloc]init];
        [self.navigationController pushViewController:detail animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
