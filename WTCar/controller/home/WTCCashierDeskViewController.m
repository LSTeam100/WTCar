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

@interface WTCCashierDeskViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *titleArr;
}
@property(nonatomic,weak)IBOutlet UITableView *tableView;
@end

@implementation WTCCashierDeskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收银台";
    titleArr = @[@"待收款",@"已收款",@"收款总额"];
    // Do any additional setup after loading the view from its nib.
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
    }
    cell.titleLabel.text = [titleArr objectAtIndex:atIndex.row];
//    cell.describetionLabel.text = 
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
    return cell;
    
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
