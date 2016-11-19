//
//  WTCCashierDeskViewController.m
//  WTCar
//
//  Created by apple on 2016/10/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCashierDeskViewController.h"
#import "CaiserTableViewCell.h"
#import "POSImageTableViewCell.h"
#import "POSHistoryTableViewCell.h"
#import "WTCToPayListRequest.h"
#import "WTCToPayList.h"
#import "WTCGetPayedList.h"
#import "WTCGetPayedListRequest.h"
#import "WTCPayDetailRequest.h"
#import "WTCPayDetail.h"
@interface WTCCashierDeskViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *titleArr;
    NSTimer *timer;
    BOOL paySuccess;
    
}
@property(nonatomic,weak)IBOutlet UITableView *tableView;
@property(nonatomic,strong)WTCToPayList *toPayList;
@property(nonatomic,strong)WTCGetPayedList *payedList;
@end

@implementation WTCCashierDeskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收银台";
    titleArr = @[@"待收款",@"已收款",@"收款总额"];
    timer =  [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(refreshOrder) userInfo:nil repeats:YES];

    paySuccess = false;
    // Do any additional setup after loading the view from its nib.
}
-(void)refreshOrder
{
    
//    [self getToPayList];
//    [self getPayedList];
    [self getPayDetail];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [timer invalidate];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return titleArr.count;
    }
    else if (section ==1)
    {
        return 1;
    }
    else
    {
        return 1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        return 80;
    }
    else
    {
        return 45;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [self getcaiserInfoCell:tableView AtIndex:indexPath];
    }
    else if (indexPath.section == 1)
    {
        return [self getImageCell:tableView AtIndex:indexPath];
    }
    else
    {
        return [self getPostHistoryCell:tableView AtIndex:indexPath];
    }
    
}
-(UITableViewCell *)getcaiserInfoCell:(UITableView *)tableView AtIndex:(NSIndexPath *)atIndex
{
    static NSString *idnetifer = @"caiserInfoCell";
    CaiserTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:idnetifer];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CaiserTableViewCell" owner:self options:nil]objectAtIndex:0];
        if (atIndex.row == 2) {
            cell.describetionLabel.text = [NSString stringWithFormat:@"%@",self.posPayModel.orderPrice];
        }
        else if (atIndex.row == 0)
        {
            cell.describetionLabel.text = [NSString stringWithFormat:@"%@",self.toPayList.orderPrice];
        }
        else if (atIndex.row == 1)
        {
            cell.describetionLabel.text = [NSString stringWithFormat:@"%@",self.payedList.orderPrice];

        }
    }
    cell.titleLabel.text = [titleArr objectAtIndex:atIndex.row];
    return cell;
    
}
-(UITableViewCell *)getImageCell:(UITableView *)tableView AtIndex:(NSIndexPath *)atIndex
{
    static NSString *idnetifer = @"caiserImageCell";
    POSImageTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:idnetifer];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"POSImageTableViewCell" owner:self options:nil]objectAtIndex:0];
    }
    
    if (paySuccess) {
        [cell.posImageView setImage:[UIImage imageNamed:@"share_select"]];
    }
    else
    {
        [cell.posImageView sd_setImageWithURL:[NSURL URLWithString:self.posPayModel.payBarCodePicPath] placeholderImage:[UIImage imageNamed:@"defaultImage"]];

    }
    
    return cell;
    
}
-(void)getToPayList
{
    [self setBusyIndicatorVisible:YES];
    NSString *loginToken = [CommonVar sharedInstance].loginToken;
    WTCToPayListRequest *request = [[WTCToPayListRequest alloc]initWithToken:loginToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        self.toPayList = [request getResponse].data;
        [self.tableView reloadData];
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
    }];
    [request start];
}
-(void)getPayedList
{
    [self setBusyIndicatorVisible:YES];
    NSString *loginToken = [CommonVar sharedInstance].loginToken;
    WTCGetPayedListRequest *request = [[WTCGetPayedListRequest alloc]initWithToken:loginToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        self.payedList = [request getResponse].data;
        if (self.payedList.orderPrice == self.posPayModel.orderPrice && self.toPayList.orderPrice == 0) {
            paySuccess = true;
            [timer invalidate];
        }
        [self.tableView reloadData];
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
    }];
    [request start];
}
-(UITableViewCell *)getPostHistoryCell:(UITableView *)tableView AtIndex:(NSIndexPath *)atIndex
{
    static NSString *idnetifer = @"caiserImageCell";
    POSHistoryTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:idnetifer];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"POSHistoryTableViewCell" owner:self options:nil]objectAtIndex:0];
    }
    return cell;
    
}
-(void)getPayDetail
{
    NSString *loginToken = [CommonVar sharedInstance].loginToken;
    
    int posid = [self.posPayModel.posId intValue];
    [self setBusyIndicatorVisible:YES];
    WTCPayDetailRequest *request = [[WTCPayDetailRequest alloc]initWithToken:loginToken POSId:[NSNumber numberWithInt:posid] successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
    }];
    [request start];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
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
