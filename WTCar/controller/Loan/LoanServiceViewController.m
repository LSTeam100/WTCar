//
//  LoanServiceViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LoanServiceViewController.h"
#import "LoanDetailTableViewCell.h"
#import "AddLoanViewController.h"
@interface LoanServiceViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat cellHeight;
}
@property(nonatomic,strong) UITableView *loanDetailsTableView;
@property(nonatomic,strong) NSArray *loanMoneyArray;
@property(nonatomic,strong)NSArray *loanStateArray;
@property(nonatomic,strong)NSArray *loanTimeArray;
@end

@implementation LoanServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:247/255.0f blue:245/255.0f alpha:1];
     UIBarButtonItem *addButtonItem = [self createBarButtonItemWithImage:[UIImage imageNamed:@"addloan_title"] action:@selector(addLoan:) target:self];
    self.navigationItem.rightBarButtonItem = addButtonItem;
    [self dataInit];
    [self makeTableView];
    // Do any additional setup after loading the view from its nib.
}
- (void)addLoan:(id)sender
{
    AddLoanViewController *addloanViewCon = [AddLoanViewController new];
    [self.navigationController pushViewController:addloanViewCon animated:YES];
    //    [ProgressHUD dismiss];
    
}
- (UIBarButtonItem *)createBarButtonItemWithImage:(UIImage *)image action:(SEL)action target:(id)target
{
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:action];
    
    return barButtonItem;
    
}

- (void)dataInit
{
    _loanMoneyArray = @[@"10万元"];
    _loanStateArray = @[@"配资中"];
    _loanTimeArray=@[@"2016-12-12"];
    cellHeight = 62;
}
- (void)makeTableView
{
    _loanDetailsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 102,SCREEN_WIDTH, cellHeight*(_loanStateArray.count)) style:UITableViewStylePlain];
    [self.view addSubview:_loanDetailsTableView];
    _loanDetailsTableView.delegate = self;
    _loanDetailsTableView.dataSource =self;
    
    UINib *nib = [UINib nibWithNibName:@"LoanDetailTableViewCell" bundle:nil];
    [_loanDetailsTableView registerNib:nib forCellReuseIdentifier:@"cellIdentifier"];
    
    _loanDetailsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _loanDetailsTableView.scrollEnabled = YES;
    _loanDetailsTableView.backgroundColor = [UIColor clearColor];
}

#pragma mark -TableView delegate & datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _loanStateArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LoanDetailTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"LoanDetailTableViewCell" owner:nil options:nil][0];
    [_loanDetailsTableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    
    _loanDetailsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [cell.contentView setBackgroundColor:[UIColor whiteColor]];
    cell.LoanMoneyLabel.text = _loanMoneyArray[indexPath.row];
    cell.LoanStateLabel.text = _loanStateArray[indexPath.row];
    cell.LoanTimeLabel.text = _loanTimeArray[indexPath.row];
    if (!IOS9_OR_LATER) {
        cell.LoanMoneyLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.LoanStateLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.LoanTimeLabel.font = [UIFont boldSystemFontOfSize:15];
    }
    if (indexPath.row == 0) {
        
    }else if (indexPath.row == 1){
        
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
