//
//  WTCCarManageController.m
//  WTCar
//
//  Created by apple on 2016/10/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCarManageController.h"
#import "WTCCarManageTableViewCell.h"
#import "WTCCarShareViewController.h"
#import "WTCOnSaleListRequest.h"
#import "WTCSaledListRequest.h"
#import "WTCOffShelfList.h"
#import "CommonVar.h"
#import "WTCOnSaleList.h"
#import "WTCarOffShelfListRequest.h"
#import "WTCSaledLIST.h"
#import "WTCOffShelfList.h"
#import "WTCCollectMoneyViewController.h"
#import "WTCAddCarViewController.h"
#import "WTCOffShelfRequest.h"
typedef enum
{
    CarMangeTypeOnSale               = 0,
    CarMangeTypeSaled                = 1,
    CarMangeTypeOffShelf             = 2
}
CarMangeType;

@interface WTCCarManageController ()
{
    NSArray *carInfoArr;
    CarMangeType carMangeType;
    NSMutableArray *onsaleArr;
    NSMutableArray *saledArr;
    NSMutableArray *offShelfArr;
    NSArray *tempArr;
    
    
}

@end

@implementation WTCCarManageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"车辆管理";
    carInfoArr = [[NSArray alloc]init];
    onsaleArr = [[NSMutableArray alloc]init];
    saledArr = [[NSMutableArray alloc]init];
    offShelfArr = [[NSMutableArray alloc]init];
    [self configureUI];
    
    [self requestSteup];
    
    
}
#pragma mark-UI 相关
-(void)configureUI
{
    self.onSaleBtn.selected = YES;
    [self.onSaleBtn setBackgroundImage:[UIImage imageNamed:@"btn_unselectsate"] forState:UIControlStateNormal];
    [self.onSaleBtn setBackgroundImage:[UIImage imageNamed:@"btn_selectstate"] forState:UIControlStateSelected];
    
    
    
    [self.saledBtn setBackgroundImage:[UIImage imageNamed:@"btn_unselectsate"] forState:UIControlStateNormal];
    [self.saledBtn setBackgroundImage:[UIImage imageNamed:@"btn_selectstate"] forState:UIControlStateSelected];
    
    
    [self.offShelfBtn setBackgroundImage:[UIImage imageNamed:@"btn_unselectsate"] forState:UIControlStateNormal];
    [self.offShelfBtn setBackgroundImage:[UIImage imageNamed:@"btn_selectstate"] forState:UIControlStateSelected];
    
    
    self.bottomViewConstraint.constant = -100;
    
    //    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
}
-(void)headerRereshing
{
    [self requestSteup];
}

-(void)requestSteup
{
    [self getOnSaleList];
}

-(IBAction)selectChanged:(id)sender
{
    UIButton *selectdBtn = (UIButton *)sender;
    
    if (selectdBtn.tag == CarMangeTypeOnSale) {
        carMangeType = CarMangeTypeOnSale;
        
        self.onSaleBtn.selected = YES;
        self.saledBtn.selected = NO;
        self.offShelfBtn.selected = NO;
        [self getOnSaleList];
    }
    else if(selectdBtn.tag == CarMangeTypeSaled)
    {
        carMangeType = CarMangeTypeSaled;
        self.onSaleBtn.selected = NO;
        self.saledBtn.selected = YES;
        self.offShelfBtn.selected = NO;
        
        [self hidenBottomView];
        [self getSaledList];
    }
    else
    {
        carMangeType = CarMangeTypeOffShelf;
        
        self.onSaleBtn.selected = NO;
        self.saledBtn.selected = NO;
        self.offShelfBtn.selected = YES;
        [self hidenBottomView];
        [self getOffShelfList];
    }
    
}


-(void)onSegmentSelectedChanged:(UISegmentedControl *)Seg{
    NSInteger index = Seg.selectedSegmentIndex;
    
    //    if (index == CarMangeTypeOffline) {
    //        carMangeType = CarMangeTypeOffline;
    //        [self getOnSaleList];
    //
    //
    //    }
    //    else if (index == CarMangeTypeSale)
    //    {
    //        carMangeType = CarMangeTypeSale;
    //        [self getSaledList];
    //    }
    //    else
    //    {
    //        carMangeType = CarMangeTypeSaleOut;
    //    }
    
    
    //    [self.tableview reloadData];
    
    
    NSLog(@"index=%ld",(long)index);
}
-(void)getOnSaleList
{
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCOnSaleListRequest *request = [[WTCOnSaleListRequest alloc]initWithToken:loginToken CurPage:[NSNumber numberWithInt:0] PageSize:[NSNumber numberWithLong:DEFAULTPAGESIZE] successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        WTCOnSaleList *saleList = [request getResponse].data;
        onsaleArr = [[NSMutableArray alloc]initWithArray:saleList.rows];
        [self.tableView reloadData];
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
    }];
    [request start];
    
}
-(void)getSaledList
{
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    
    WTCSaledListRequest *request = [[WTCSaledListRequest alloc]initWithToken:loginToken CurPage:[NSNumber numberWithInt:0] PageSize:[NSNumber numberWithLong:DEFAULTPAGESIZE] successCallback:^(WTCarBaseRequest *request) {
        WTCSaledLIST *saledList = [request getResponse].data;
        saledArr = [[NSMutableArray alloc]initWithArray:saledList.rows];
        [self.tableView reloadData];
        
        [self setBusyIndicatorVisible:NO];
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
    }];
    [request start];
}

-(void)getOffShelfList
{
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCarOffShelfListRequest *request = [[WTCarOffShelfListRequest alloc]initWithToken:loginToken CurPage:[NSNumber numberWithLong:0] PageSize:[NSNumber numberWithLong:DEFAULTPAGESIZE] successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        WTCOffShelfList *offList = [request getResponse].data;
        offShelfArr = [[NSMutableArray alloc]initWithArray:offList.rows];
        [self.tableView reloadData];
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
    }];
    [request start];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (carMangeType == CarMangeTypeOnSale) {
        return onsaleArr.count;
        
    }
    else if (carMangeType == CarMangeTypeSaled)
    {
        return saledArr.count;
    }
    else
    {
        return offShelfArr.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"WTCCarManageTableViewCell";
    WTCCarManageTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"WTCCarManageTableViewCell" owner:self options:nil] objectAtIndex:0];
        
        [cell.shareBtn addTarget:self action:@selector(navitoShareController:) forControlEvents:UIControlEventTouchUpInside];
        [cell.manageBtn addTarget:self action:@selector(showBottomeView) forControlEvents:UIControlEventTouchUpInside];
        [cell.collectPayBtn addTarget:self action:@selector(naviToCollectMoneyController:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (carMangeType == CarMangeTypeOnSale) {
        cell.collectPayBtn.hidden = NO;
        cell.shareBtn.hidden = NO;
        cell.manageBtn.hidden = NO;
        cell.collectPayBtn.tag = indexPath.row;
        WTCASale *asale = [onsaleArr objectAtIndex:indexPath.row];
        NSString *imageUrl = [asale.primaryPicUrl objectAtIndex:0];
        [cell.carImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"defaultImage"]];
        cell.nameLabel.text = asale.productName;
        cell.dateLabel.text = [NSString stringWithFormat:@"%@",asale.firstUpTime];
        cell.priceLabel.text = asale.price;
        cell.callNumLabel.text = [NSString stringWithFormat:@"%@",asale.telNumTimes];
        cell.browserNumLabel.text = [NSString stringWithFormat:@"%@",asale.browseNumTimes];
        cell.sellLabel.text = [NSString stringWithFormat:@"%@",asale.saledDays];
        
        
    }
    else if (carMangeType == CarMangeTypeSaled){
        cell.collectPayBtn.hidden = YES;
        cell.shareBtn.hidden = YES;
        cell.manageBtn.hidden = NO;
        WTCASaled *saled = [saledArr objectAtIndex:indexPath.row];
        NSString *imageUrl = [saled.primaryPicUrl objectAtIndex:0];
        [cell.carImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"defaultImage"]];
        cell.nameLabel.text = saled.productName;
        cell.dateLabel.text = [NSString stringWithFormat:@"%@",saled.firstUpTime];
        cell.priceLabel.text = saled.price;
        //        cell.callNumLabel.text = [NSString stringWithFormat:@"%@",saled.telNumTimes];
        //        cell.browserNumLabel.text = [NSString stringWithFormat:@"%@",saled.browseNumTimes];
        //        cell.sellLabel.text = [NSString stringWithFormat:@"%@",saled.saledDays];
    }
    else{
        cell.collectPayBtn.hidden = YES;
        cell.shareBtn.hidden = YES;
        cell.manageBtn.hidden = NO;
        
        WTCAOffShelf *aoffShelf = [offShelfArr objectAtIndex:indexPath.row];
        NSString *imageUrl = [aoffShelf.primaryPicUrl objectAtIndex:0];
        [cell.carImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"defaultImage"]];
        cell.nameLabel.text = aoffShelf.productName;
        cell.dateLabel.text = [NSString stringWithFormat:@"%@",aoffShelf.firstUpTime];
        cell.priceLabel.text = aoffShelf.price;
        
    }
    
    return cell;
}
-(void)showBottomeView
{
    self.bottomViewConstraint.constant = 0;
    if (carMangeType == 0) {
        self.modifyView.hidden = NO;
        self.saledView.hidden = YES;
    }
    else if(carMangeType == 1)
    {
        self.modifyView.hidden = YES;
        self.saledView.hidden = NO;
        self.offShelfView_edite.hidden = YES;
        self.offShelfView_upView.hidden = YES;
    }
    else
    {
        self.modifyView.hidden = YES;
        self.saledView.hidden = NO;
        self.offShelfView_edite.hidden = NO;
        self.offShelfView_upView.hidden = NO;
        
    }
}
-(void)hidenBottomView
{
    self.bottomViewConstraint.constant = -100;
}
-(IBAction)hidenBottomView:(id)sender
{
    [self hidenBottomView];
}
-(void)naviToCollectMoneyController:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    WTCASale *aSale = [onsaleArr objectAtIndex:btn.tag];
    WTCCollectMoneyViewController *collect = [[WTCCollectMoneyViewController alloc]init];
    collect.aSale = aSale;
    [self.navigationController pushViewController:collect animated:YES];
}
-(void)navitoShareController:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    WTCCarShareViewController *shareController = [WTCCarShareViewController new];
    shareController.ascale = [onsaleArr objectAtIndex:btn.tag];
    [self.navigationController pushViewController:shareController animated:YES];
}
-(IBAction)naviToAddCar:(id)sender
{
    WTCAddCarViewController *addCar = [[WTCAddCarViewController alloc]init];
    [self.navigationController pushViewController:addCar animated:YES];
}
-(IBAction)offShelfCar:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    if (carMangeType == 0) {
        WTCASale *aSale = [onsaleArr objectAtIndex:btn.tag];
        [self setBusyIndicatorVisible:YES];
        WTCOffShelfRequest *request = [[WTCOffShelfRequest alloc]initWithToken:DEFAULTTOKEN OffShelfId:aSale.saleId successCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            [self hidenBottomView];
            [self.tableView reloadData];
            
        } failureCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
        }];
        [request start];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
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
