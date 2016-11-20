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
#import "WTCOnShelfRequest.h"
#import "WTCarProdcutDel.h"
#import "WTCSaledRequest.h"
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
    int onsaleCurrentPage;
    int saledCurrentPage;
    int offShelfCurrentPage;
    NSInteger selectManage;
    
    
}

@end
//添加分页功能
static int DEFAULT_SIZE=10;

@implementation WTCCarManageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"车辆管理";
    carInfoArr = [[NSArray alloc]init];
    onsaleArr = [[NSMutableArray alloc]init];
    saledArr = [[NSMutableArray alloc]init];
    offShelfArr = [[NSMutableArray alloc]init];
    onsaleCurrentPage = 0;
    saledCurrentPage = 0;
    offShelfCurrentPage = 0;
    [self configureUI];
    [self requestSteup];

}

#pragma mark-UI 相关
-(void)configureUI
{
    setExtraCellLineHidden(self.tableView);
    self.onSaleBtn.selected = YES;
    [self.onSaleBtn setBackgroundImage:[UIImage imageNamed:@"btn_unselectsate"] forState:UIControlStateNormal];
    [self.onSaleBtn setBackgroundImage:[UIImage imageNamed:@"btn_selectstate"] forState:UIControlStateSelected];
    [self.saledBtn setBackgroundImage:[UIImage imageNamed:@"btn_unselectsate"] forState:UIControlStateNormal];
    [self.saledBtn setBackgroundImage:[UIImage imageNamed:@"btn_selectstate"] forState:UIControlStateSelected];
    [self.offShelfBtn setBackgroundImage:[UIImage imageNamed:@"btn_unselectsate"] forState:UIControlStateNormal];
    [self.offShelfBtn setBackgroundImage:[UIImage imageNamed:@"btn_selectstate"] forState:UIControlStateSelected];
    self.bottomViewConstraint.constant = -100;
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
    [self.tableView removeFooter];
}
-(void)headerRereshing
{
    [self requestSteup];
}

-(void)requestSteup
{
    if (carMangeType == CarMangeTypeOnSale) {
        [self getOnSaleList];
    }
    else if(carMangeType == CarMangeTypeSaled){
        [self getSaledList];
    }
    else{
        [self getOffShelfList];
    }
    
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
    onsaleCurrentPage = 0;
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCOnSaleListRequest *request = [[WTCOnSaleListRequest alloc]initWithToken:loginToken CurPage:[NSNumber numberWithInt:0] PageSize:[NSNumber numberWithLong:DEFAULTPAGESIZE] successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self.tableView.header endRefreshing];
        WTCOnSaleList *saleList = [request getResponse].data;
        onsaleArr = [[NSMutableArray alloc]initWithArray:saleList.rows];
        if(onsaleArr.count>=DEFAULT_SIZE){
            [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(onMoreData)];
        }else{
            [self.tableView removeFooter];
        }
        [self.tableView reloadData];
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self.tableView.header endRefreshing];

    }];
    [request start];
    
}
-(void)getSaledList
{
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    saledCurrentPage = 0;
    WTCSaledListRequest *request = [[WTCSaledListRequest alloc]initWithToken:loginToken CurPage:[NSNumber numberWithInt:0] PageSize:[NSNumber numberWithLong:DEFAULTPAGESIZE] successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        WTCSaledLIST *saledList = [request getResponse].data;
        saledArr = [[NSMutableArray alloc]initWithArray:saledList.rows];
        [self.tableView.header endRefreshing];

        if(saledArr.count>=DEFAULT_SIZE){
            [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(onMoreData)];
        }else{
            [self.tableView removeFooter];
        }
        [self.tableView reloadData];
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self.tableView.header endRefreshing];

        
    }];
    [request start];
}

-(void)getOffShelfList
{
    offShelfCurrentPage = 0;
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCarOffShelfListRequest *request = [[WTCarOffShelfListRequest alloc]initWithToken:loginToken CurPage:[NSNumber numberWithLong:0] PageSize:[NSNumber numberWithLong:DEFAULTPAGESIZE] successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self.tableView.header endRefreshing];
        WTCOffShelfList *offList = [request getResponse].data;
        offShelfArr = [[NSMutableArray alloc]initWithArray:offList.rows];
        if(offShelfArr.count>=DEFAULT_SIZE){
            [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(onMoreData)];
        }else{
            [self.tableView removeFooter];
        }
        [self.tableView reloadData];
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self.tableView.header endRefreshing];

        
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
        [cell.manageBtn addTarget:self action:@selector(showBottomeView:) forControlEvents:UIControlEventTouchUpInside];
        [cell.collectPayBtn addTarget:self action:@selector(naviToCollectMoneyController:) forControlEvents:UIControlEventTouchUpInside];
    }
    cell.manageBtn.tag = indexPath.row;
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
-(void)showBottomeView:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    selectManage = btn.tag;
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
    UIButton *btn = (UIButton *)sender;
    WTCASale *aSale = [onsaleArr objectAtIndex:btn.tag];

    addCar.editeStatus = 1;
    addCar.carDetailId = aSale.saleId;
    [self.navigationController pushViewController:addCar animated:YES];
}
-(IBAction)offShelfCar:(id)sender
{
    if (carMangeType == CarMangeTypeOnSale) {
        NSString *loginToken = [[CommonVar sharedInstance]getLoginToken];
        WTCASale *aSale = [onsaleArr objectAtIndex:selectManage];
        [self setBusyIndicatorVisible:YES];
        WTCOffShelfRequest *request = [[WTCOffShelfRequest alloc]initWithToken:loginToken OffShelfId:aSale.saleId successCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            [self hidenBottomView];
            [onsaleArr removeObjectAtIndex:selectManage];
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

#pragma mark-添加分页功能
//添加分页功能
-(void)onMoreData
{
    if (carMangeType == CarMangeTypeOnSale) {
        [self loadMoreOnSaleList];
    }
    else if (carMangeType == CarMangeTypeSaled){
        [self loadMoreSaledList];
    }
    else{
        [self loadMoreOffShelfList];
    }
}
-(void)loadMoreOnSaleList
{
    if (onsaleArr == nil || onsaleArr.count == 0) {
        return;
    }
    onsaleCurrentPage++;
    NSString *loginToken = [CommonVar sharedInstance].loginToken;
    [self setBusyIndicatorVisible:YES];
    WTCOnSaleListRequest *request = [[WTCOnSaleListRequest alloc]initWithToken:loginToken CurPage:[NSNumber numberWithInt:onsaleCurrentPage] PageSize:[NSNumber numberWithInt:DEFAULT_SIZE] successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self.tableView.header endRefreshing];
        WTCOnSaleList *saleList = [request getResponse].data;
        NSMutableArray  *buyerList = [[NSMutableArray alloc]initWithArray:saleList.rows];
        if(buyerList.count>=DEFAULT_SIZE){
            [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(onMoreData)];
        }else{
            [self.tableView removeFooter];
        }
        if (buyerList!=nil) {
            [onsaleArr addObjectsFromArray:buyerList];
        }
        [self.tableView reloadData];
        
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self.tableView.header endRefreshing];

    }];
    [request start];
}
-(void)loadMoreSaledList
{
    if (saledArr == nil || saledArr.count == 0) {
        return;
    }
    saledCurrentPage++;
    NSString *loginToken = [CommonVar sharedInstance].loginToken;
    [self setBusyIndicatorVisible:YES];
    WTCSaledListRequest *request = [[WTCSaledListRequest alloc]initWithToken:loginToken CurPage:[NSNumber numberWithInt:saledCurrentPage] PageSize:[NSNumber numberWithInt:DEFAULT_SIZE] successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self.tableView.header endRefreshing];
        WTCSaledLIST *saledList = [request getResponse].data;
        NSMutableArray  *buyerList = [[NSMutableArray alloc]initWithArray:saledList.rows];
        if(buyerList.count>=DEFAULT_SIZE){
            [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(onMoreData)];
        }else{
            [self.tableView removeFooter];
        }
        if (buyerList!=nil) {
            [saledArr addObjectsFromArray:buyerList];
        }
        [self.tableView reloadData];

    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self.tableView.header endRefreshing];
    }];
    [request start];
    
   
}
-(void)loadMoreOffShelfList
{
    if (offShelfArr == nil || offShelfArr.count == 0) {
        return;
    }
    offShelfCurrentPage++;
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCarOffShelfListRequest *request = [[WTCarOffShelfListRequest alloc]initWithToken:loginToken CurPage:[NSNumber numberWithLong:offShelfCurrentPage] PageSize:[NSNumber numberWithLong:DEFAULTPAGESIZE] successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self.tableView.header endRefreshing];
        WTCOffShelfList *offList = [request getResponse].data;
        NSMutableArray *buyerList= [[NSMutableArray alloc]initWithArray:offList.rows];
        if(buyerList.count>=DEFAULT_SIZE){
            [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(onMoreData)];
        }else{
            [self.tableView removeFooter];
        }
        if (buyerList!=nil) {
            [offShelfArr addObjectsFromArray:buyerList];
        }
        [self.tableView reloadData];
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self.tableView.header endRefreshing];
        
        
    }];
    [request start];
}

#pragma mark-上架车辆

-(IBAction)onShelfCar{
    
    WTCAOffShelf *aoffShelf = [offShelfArr objectAtIndex:selectManage];
    NSLog(@"saleId=%@",aoffShelf.saleId);
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCOnShelfRequest *request = [[WTCOnShelfRequest alloc]initWithToken:loginToken OnShelfId:aoffShelf.saleId successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self hidenBottomView];
        [offShelfArr removeObjectAtIndex:selectManage];
        [self.tableView reloadData];
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];

    }];
    [request start];
}
#pragma mark-删除商品
-(IBAction)deletProduct:(id)sender
{
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    if (carMangeType == CarMangeTypeOnSale) {
        WTCASale *asale = [onsaleArr objectAtIndex:selectManage];
        [self setBusyIndicatorVisible:YES];
        WTCarProdcutDel *request = [[WTCarProdcutDel alloc]initWithToken:loginToken OffShelfId:asale.saleId successCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            [onsaleArr removeObjectAtIndex:selectManage];
            [self hidenBottomView];
            [self.tableView reloadData];


            
        } failureCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];

        }];
        [request start];
    }
    else if (carMangeType == CarMangeTypeSaled)
    {
        WTCASaled *saled = [saledArr objectAtIndex:selectManage];
        [self setBusyIndicatorVisible:YES];
        WTCarProdcutDel *request = [[WTCarProdcutDel alloc]initWithToken:loginToken OffShelfId:saled.saleId successCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            [saledArr removeObjectAtIndex:selectManage];
            [self hidenBottomView];
            [self.tableView reloadData];

            
        } failureCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            
        }];
        [request start];
    }
    else
    {
        WTCAOffShelf *offShelf = [offShelfArr objectAtIndex:selectManage];
        [self setBusyIndicatorVisible:YES];
        WTCarProdcutDel *request = [[WTCarProdcutDel alloc]initWithToken:loginToken OffShelfId:offShelf.saleId successCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            [offShelfArr removeObjectAtIndex:selectManage];
            [self hidenBottomView];
            [self.tableView reloadData];
            
            
        } failureCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            
        }];
        [request start];
    }
   
}

#pragma mark-在售商品售出
-(IBAction)saledCar:(id)sender
{
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    WTCASale *asale = [onsaleArr objectAtIndex:selectManage];
    [self setBusyIndicatorVisible:YES];
    WTCSaledRequest *request = [[WTCSaledRequest alloc]initWithToken:loginToken SaledId:asale.saleId successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [onsaleArr removeObjectAtIndex:selectManage];
        [self.tableView reloadData];
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
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
