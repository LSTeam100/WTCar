//
//  WTCPOSViewController.m
//  WTCar
//
//  Created by apple on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCPOSViewController.h"
#import "WTCOrderTableViewCell.h"
#import "WTCPOSCarInfoTableViewCell.h"
@interface WTCPOSViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)IBOutlet UITableView *tableView;
@property(nonatomic,weak)IBOutlet UIButton *waitPayBtn;
@property(nonatomic,weak)IBOutlet UIButton *alreadyPayBtn;
@property(nonatomic,weak)IBOutlet UIButton *collectMoneyBtn;
@end

@implementation WTCPOSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"POS收款";
    // Do any additional setup after loading the view from its nib.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 50;
    }
    else
    {
        if (indexPath.row == 0) {
            return 120;
        }
        else
        {
            return 45;
        }
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [self getOrdertCell:tableView AtIndex:indexPath];
    }
    else
    {
        return [self getPosCarinfo:tableView AtIndex:indexPath];
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    else
    {
        return 2;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(UITableViewCell *)getOrdertCell:(UITableView *)tableView AtIndex:(NSIndexPath *)atIndex
{
    static NSString *identifer = @"WTCOrderTableViewCell";
    WTCOrderTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"WTCOrderTableViewCell" owner:self options:nil]objectAtIndex:0];
    }
    return cell;
}
-(UITableViewCell *)getPosCarinfo:(UITableView *)tableView AtIndex:(NSIndexPath*)atIndex
{
    if (atIndex.row == 0) {
        static NSString *identifer = @"WTCPOSCarInfoTableViewCell";
        WTCPOSCarInfoTableViewCell *cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:identifer];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"WTCOrderTableViewCell" owner:self options:nil]objectAtIndex:0];
        }
        return cell;
    }
    else
    {
        static NSString *identifer = @"carSumMoneyCell";
        UITableViewCell *cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:identifer];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        }
        cell.textLabel.text =[NSString stringWithFormat:@"收款金额：128万元"];
        return cell;
    }
    
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
