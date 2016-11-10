//
//  WTCCashRecordViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCashRecordViewController.h"
#import "CashRecordTableViewCell.h"
@interface WTCCashRecordViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat cellHeight;
}
@property (nonatomic,strong)UITableView *cashRecordTableView;
@property (nonatomic,strong)NSArray *cellNumTextArray;
@property (nonatomic,strong)NSArray *cellMoneyTextArray;
@property (nonatomic,strong)NSArray *cellStateTextArray;
@property (nonatomic,strong)NSArray *cellTimeTextArray;

@end

@implementation WTCCashRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:247/255.0f blue:245/255.0f alpha:1];
    self.navigationItem.title =@"提现记录";
    [self dataInit];
    [self makeTableView];

    // Do any additional setup after loading the view from its nib.
}

-(void)dataInit{
    _cellNumTextArray = @[@"1000001",@"1000002"];
    _cellMoneyTextArray = @[@"50000",@"1000000"];
    _cellStateTextArray = @[@"已提现",@"未提现"];
    _cellTimeTextArray = @[@"2016-12-12-14:55",@"2016-12-13-14:55"];
    cellHeight =42;
}
-(void)makeTableView{
    _cashRecordTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 120,SCREEN_WIDTH, cellHeight*(_cellNumTextArray.count+1)) style:UITableViewStylePlain];
    
    [self.view addSubview:_cashRecordTableView];
    _cashRecordTableView.delegate = self;
    _cashRecordTableView.dataSource =self;
    
    UINib *nib = [UINib nibWithNibName:@"CashRecordTableViewCell" bundle:nil];
    [_cashRecordTableView registerNib:nib forCellReuseIdentifier:@"cellIdentifier"];
    
    _cashRecordTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _cashRecordTableView.scrollEnabled = YES;
    _cashRecordTableView.backgroundColor = [UIColor clearColor];
}
#pragma mark -TableView delegate & datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _cellNumTextArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CashRecordTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"CashRecordTableViewCell" owner:nil options:nil][0];
    [_cashRecordTableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    
    _cashRecordTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [cell.contentView setBackgroundColor:[UIColor whiteColor]];
    cell.cashNumLabel.text = _cellNumTextArray[indexPath.row];
    cell.cashMoneyLabel.text = _cellMoneyTextArray[indexPath.row];
    cell.cashStateLabel.text = _cellStateTextArray[indexPath.row];
    cell.cashTimeLabel.text = _cellTimeTextArray[indexPath.row];
    
    if (!IOS9_OR_LATER) {
        cell.cashNumLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.cashTimeLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.cashStateLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.cashMoneyLabel.font = [UIFont boldSystemFontOfSize:15];
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
