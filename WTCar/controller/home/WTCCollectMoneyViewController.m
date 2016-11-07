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
@interface WTCCollectMoneyViewController ()<UITableViewDelegate,UITableViewDataSource>
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
        return 120;
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
    }
    return cell;
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
