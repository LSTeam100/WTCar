//
//  WTCMineDetailViewController.m
//  WTCar
//
//  Created by apple on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCMineDetailViewController.h"
#import "HeadTableViewCell.h"
#import "AuthenticationTableViewCell.h"
#import "WTCUserInfoRequest.h"
#import "WTCGetUserInfoResult.h"
@interface WTCMineDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)WTCGetUserInfoResult *userResult;
@property(nonatomic,weak)IBOutlet UITableView *tableView;
@end

@implementation WTCMineDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的资料";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self getUserBaseInfo];
    
}
-(void)getUserBaseInfo
{
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCUserInfoRequest *request = [[WTCUserInfoRequest alloc]initWithToken:loginToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        WTCGetUserInfoResult *result = [request getResponse].data;
        self.userResult = result;
        //        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
        //        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
        [self.tableView reloadData];
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:NO];
    }];
    [request start];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100;
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            return 60;
        }
        else
        {
            return 40;
        }

    }
    else
    {
        return 40;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else {
        return 3;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return  [self getAuthenInfo:tableView AtIndex:indexPath];
    }
    else  {
        return [self getHeadInfo:tableView AtIndex:indexPath];
    }

}
-(UITableViewCell *)getHeadInfo:(UITableView *)tableView AtIndex:(NSIndexPath *)indexPath{
    static NSString *identifer = @"headCell";
    HeadTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        NSArray *cellArr = [[NSBundle mainBundle]loadNibNamed:@"HeadTableViewCell" owner:self options:nil];
        cell = [cellArr objectAtIndex:0];
    }
    [cell.profileImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.userResult.headPortraitPath]] placeholderImage:[UIImage imageNamed:@"mine_user"]];
    return cell;
}

-(UITableViewCell *)getAuthenInfo:(UITableView *)tableView AtIndex:(NSIndexPath *)indexPath{
    static NSString *identifer = @"authenCell";
    AuthenticationTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        NSArray *cellArr = [[NSBundle mainBundle]loadNibNamed:@"AuthenticationTableViewCell" owner:self options:nil];
        cell = [cellArr objectAtIndex:0];
    }
    return cell;
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
