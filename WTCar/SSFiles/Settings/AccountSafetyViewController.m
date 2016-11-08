//
//  AccountSafetyViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AccountSafetyViewController.h"
#import "AccountSafetyTableViewCell.h"
#import "SettingPayCodeViewController.h"
#import "ChangePayCodeViewController.h"
#import "ForgetPayCodeViewController.h"
@interface AccountSafetyViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat cellHeight;//cell高度
}
//账户安全tableVIew
@property (nonatomic,strong)UITableView *AccountSafetyTableView;
//cell标题的数组
@property (nonatomic,strong)NSArray *cellTextArray;

@end

@implementation AccountSafetyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:247/255.0f blue:245/255.0f alpha:1];
    [self dataInit];
    [self makeTableView];
    // Do any additional setup after loading the view.
}
-(void)dataInit{
    _cellTextArray = @[@"设置支付密码",@"修改支付密码",@"忘记支付密码"];
    cellHeight = 42;
    
}
//设置tableView
-(void)makeTableView{
    _AccountSafetyTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20,SCREEN_WIDTH, 300) style:UITableViewStylePlain];

    [self.view addSubview:_AccountSafetyTableView];
    _AccountSafetyTableView.delegate = self;
    _AccountSafetyTableView.dataSource =self;
    
    UINib *nib = [UINib nibWithNibName:@"AccountSafetyTableViewCell" bundle:nil];
    [_AccountSafetyTableView registerNib:nib forCellReuseIdentifier:@"cellIdentifier"];
    
    _AccountSafetyTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _AccountSafetyTableView.scrollEnabled = YES;
    _AccountSafetyTableView.backgroundColor = [UIColor clearColor];
}
#pragma mark -TableView delegate & datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AccountSafetyTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"AccountSafetyTableViewCell" owner:nil options:nil][0];
    [_AccountSafetyTableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    
    _AccountSafetyTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [cell.contentView setBackgroundColor:[UIColor whiteColor]];
    cell.AccountSafetyLabel.text = _cellTextArray[indexPath.row];
    
    if (!IOS9_OR_LATER) {
        cell.AccountSafetyLabel.font = [UIFont boldSystemFontOfSize:15];
    }
    if (indexPath.row == 0) {
        
    }else if (indexPath.row == 1){
        
    }else if (indexPath.row == 2){
        
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        SettingPayCodeViewController *settingpaycodeViewCon = [SettingPayCodeViewController new];
        [self.navigationController pushViewController:settingpaycodeViewCon animated:YES];
    }else if (indexPath.row == 1){
        ChangePayCodeViewController *changePaycodeViewCon = [ChangePayCodeViewController new];
        [self.navigationController pushViewController:changePaycodeViewCon animated:YES];
    }else if (indexPath.row == 2){
        ForgetPayCodeViewController *forgetPaycodeViewCon = [ForgetPayCodeViewController new];
        [self.navigationController pushViewController:forgetPaycodeViewCon animated:YES];
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
