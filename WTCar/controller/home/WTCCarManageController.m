//
//  WTCCarManageController.m
//  WTCar
//
//  Created by apple on 2016/10/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCarManageController.h"
#import "WTCCarManageTableViewCell.h"
typedef enum
{
    offline               = 0,
    sale                  = 1,
    saleOut               = 2
}
CarMangeType;

@interface WTCCarManageController ()
{
    NSArray *carInfoArr;
    
    
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

}
-(void)onSegmentSelectedChanged:(UISegmentedControl *)Seg{
    NSInteger index = Seg.selectedSegmentIndex;
    NSLog(@"index=%ld",(long)index);

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return carInfoArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"WTCCarManageTableViewCell";
    WTCCarManageTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"WTCCarManageTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
