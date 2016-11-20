//
//  WTCCollectMoneyViewController.m
//  WTCar
//
//  Created by apple on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCollectMoneyViewController.h"
#import "WTCCarManageTableViewCell.h"
#import "WTCCommitBuyCarMoneyTableViewCell.h"
#import "WTCPOSPayRequest.h"
#import "WTCPOSPayModel.h"
@interface WTCCollectMoneyViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic,weak)IBOutlet UITableView *tableView;

@end

@implementation WTCCollectMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收款";
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 120;
    }
    else
    {
        return 60;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
       return  [self getCarMangeCell:tableView atIndexPath:indexPath];
    }
    else
    {
        return  [self getInputPriceCell:tableView atIndexPath:indexPath];
    }
}
-(UITableViewCell *)getInputPriceCell:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idetifier = @"inputPriceCell";
    WTCCommitBuyCarMoneyTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:idetifier];
    if (cell ==nil) {
        NSArray *cellArr = [[NSBundle mainBundle]loadNibNamed:@"WTCCommitBuyCarMoneyTableViewCell" owner:self options:nil];
        cell = [cellArr objectAtIndex:0];
    }

    return cell;
}
-(UITableViewCell *)getCarMangeCell:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indetifier = @"collectMoneyCell";
    WTCCarManageTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:indetifier];
    if (cell == nil) {
        NSArray *cellArr = [[NSBundle mainBundle]loadNibNamed:@"WTCCarManageTableViewCell" owner:self options:nil];
        cell = [cellArr objectAtIndex:0];
        cell.shareBtn.hidden = YES;
        cell.collectPayBtn.hidden = YES;
        cell.manageBtn.hidden = YES;
    }
    
    
    WTCASale *asale = self.aSale;
    NSString *imageUrl = [asale.primaryPicUrl objectAtIndex:0];
    [cell.carImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"defaultImage"]];
    cell.nameLabel.text = asale.productName;
    cell.dateLabel.text = [NSString stringWithFormat:@"%@",asale.firstUpTime];
    cell.priceLabel.text = asale.price;
    cell.callNumLabel.text = [NSString stringWithFormat:@"%@",asale.telNumTimes];
    cell.browserNumLabel.text = [NSString stringWithFormat:@"%@",asale.browseNumTimes];
    cell.sellLabel.text = [NSString stringWithFormat:@"%@",asale.saledDays];

    return cell;
}


-(IBAction)navitCaisher:(id)sender
{
    
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    
    NSIndexPath *indexPath2=[NSIndexPath indexPathForRow:0 inSection:1];
    WTCCommitBuyCarMoneyTableViewCell *cell2 = [self.tableView cellForRowAtIndexPath:indexPath2];
    NSString *price = cell2.inputPriceTextField.text;

    
    double orderPrice = [price doubleValue];
    
    
    if (orderPrice == 0) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        
        // Set the text mode to show only text.
        hud.mode = MBProgressHUDModeText;
        hud.label.text = @"支付不能为空";
        // Move to bottm center.
        hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
        
        [hud hideAnimated:YES afterDelay:3.f];
        return;

    }
    
    WTCPOSPayRequest *request = [[WTCPOSPayRequest alloc]initWithToken:loginToken ProductId:self.aSale.saleId OrderPrice:orderPrice successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        WTCPOSPayModel *posPayModel = [request getResponse].data;
        
        WTCCashierDeskViewController *cashier = [[WTCCashierDeskViewController alloc]init];
        cashier.posPayModel = posPayModel;
        [self.navigationController pushViewController:cashier animated:YES];
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
    }];
    [request start];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    textField.
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
