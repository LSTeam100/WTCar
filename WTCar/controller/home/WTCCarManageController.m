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
typedef enum
{
    CarMangeTypeOffline               = 0,
    CarMangeTypeSale                  = 1,
    CarMangeTypeSaleOut               = 2
}
CarMangeType;

@interface WTCCarManageController ()
{
    NSArray *carInfoArr;
    CarMangeType carMangeType;
    
    
}

@end

@implementation WTCCarManageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"车辆管理";
    carInfoArr = [[NSArray alloc]init];
    [self configureUI];
    

}
#pragma mark-UI 相关
-(void)configureUI
{
    NSArray *segmentedArray=[[NSArray alloc]initWithObjects:@"在售",@"已售",@"未上架",nil];
    _segmentedControl=[[UISegmentedControl alloc]initWithItems:segmentedArray];
    _segmentedControl.backgroundColor=[UIColor clearColor];
    _segmentedControl.frame=CGRectMake(30, 80,[UIScreen mainScreen].bounds.size.width-60, 30);
    _segmentedControl.selectedSegmentIndex=0;
    _segmentedControl.tintColor=[UIColor redColor];
    [_segmentedControl addTarget:self action:@selector(onSegmentSelectedChanged:)forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmentedControl];
    
    self.constraint.constant = -100;
   

}
-(void)onSegmentSelectedChanged:(UISegmentedControl *)Seg{
    NSInteger index = Seg.selectedSegmentIndex;
    
    if (index == CarMangeTypeOffline) {
        carMangeType = CarMangeTypeOffline;
    }
    else if (index == CarMangeTypeSale)
    {
        carMangeType = CarMangeTypeSale;
    }
    else
    {
        carMangeType = CarMangeTypeSaleOut;
    }
    
    
    [self.tableview reloadData];
    
    NSLog(@"index=%ld",(long)index);

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"WTCCarManageTableViewCell";
    WTCCarManageTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"WTCCarManageTableViewCell" owner:self options:nil] objectAtIndex:0];
        
        [cell.shareBtn addTarget:self action:@selector(navitoShareController) forControlEvents:UIControlEventTouchUpInside];
        [cell.manageBtn addTarget:self action:@selector(showBottomeView) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (carMangeType == CarMangeTypeOffline) {
        cell.collectPayBtn.hidden = NO;
        cell.shareBtn.hidden = NO;
        cell.manageBtn.hidden = NO;
    }
    else if (carMangeType == CarMangeTypeSale){
        cell.collectPayBtn.hidden = YES;
        cell.shareBtn.hidden = YES;
        cell.manageBtn.hidden = NO;
    }
    else{
        cell.collectPayBtn.hidden = YES;
        cell.shareBtn.hidden = YES;
        cell.manageBtn.hidden = NO;
    }
    
    return cell;
}
-(void)showBottomeView
{
    self.constraint.constant = 0;
}
-(void)hidenBottomView
{
    self.constraint.constant = -100;
}
-(IBAction)hidenBottomView:(id)sender
{
    [self hidenBottomView];
}
-(void)navitoShareController
{
    WTCCarShareViewController *shareController = [WTCCarShareViewController new];
    [self.navigationController pushViewController:shareController animated:YES];
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
