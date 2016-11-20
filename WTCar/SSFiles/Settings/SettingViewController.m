//
//  SettingViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/24.
//  Copyright © 2016年 apple. All rights reserved.
//
#import "SettingViewController.h"
#import "SettingTableViewCell.h"
#import "AccountSafetyViewController.h"
#import "LoginViewController.h"
#import "WTCLogoutRequest.h"
#import "AppDelegate.h"
#import <StoreKit/StoreKit.h>

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat cellHeight;
}
@property (nonatomic,strong)UITableView *SettingTableView;
@property (nonatomic,strong)NSArray *cellTextArray;
@property (nonatomic,strong)UILabel *TeleNumlabel;
@property (nonatomic,strong)UIView *deckView;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:247/255.0f blue:245/255.0f alpha:1];
    [self dataInit];
    [self makeDeckView];
    [self makeTableView];
    [self makeLogoutButton];
    // Do any additional setup after loading the view.
}
-(void)dataInit{
    _cellTextArray = @[@"账号安全",@"客服电话",@"检查更新",@"当前版本"];
    _TeleNumlabel = [[UILabel alloc]init];
    _TeleNumlabel.text = @"4008-010-010";
    _TeleNumlabel.font = [UIFont boldSystemFontOfSize:14];
    [_TeleNumlabel sizeToFit];
    _TeleNumlabel.backgroundColor = [UIColor clearColor];
    cellHeight =42;
}
-(void)makeDeckView{
    _deckView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 20)];
    _deckView.backgroundColor =[UIColor lightTextColor];
    [self.view addSubview:_deckView];
    
}
-(void)makeTableView{
    _SettingTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_deckView.frame),SCREEN_WIDTH, cellHeight*6) style:UITableViewStylePlain];

    [self.view addSubview:_SettingTableView];
    _SettingTableView.delegate = self;
    _SettingTableView.dataSource =self;
    
    UINib *nib = [UINib nibWithNibName:@"SettingTableViewCell" bundle:nil];
    [_SettingTableView registerNib:nib forCellReuseIdentifier:@"cellIdentifier"];
    
    _SettingTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _SettingTableView.scrollEnabled = YES;
    _SettingTableView.backgroundColor = [UIColor clearColor];
}
#pragma mark -TableView delegate & datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SettingTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"SettingTableViewCell" owner:nil options:nil][0];
    [_SettingTableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];

     _SettingTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [cell.contentView setBackgroundColor:[UIColor whiteColor]];
    cell.SettingLabel.text = _cellTextArray[indexPath.row];
    
    if (!IOS9_OR_LATER) {
        cell.SettingLabel.font = [UIFont boldSystemFontOfSize:15];
    }
    if (indexPath.row == 0) {
        
    }else if (indexPath.row == 1){
        cell.BackIconImageView.hidden = YES;
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
            _TeleNumlabel.frame =CGRectMake(SCREEN_WIDTH - _TeleNumlabel.frame.size.width - 10,\
                                    12, _TeleNumlabel.frame.size.width, _TeleNumlabel.frame.size.height);
        } else {
            _TeleNumlabel.frame =CGRectMake(SCREEN_WIDTH - _TeleNumlabel.frame.size.width - 20,\
                                    12, _TeleNumlabel.frame.size.width, _TeleNumlabel.frame.size.height);
        }
        [cell.contentView addSubview:_TeleNumlabel];
        _TeleNumlabel.backgroundColor = [UIColor clearColor];
        _TeleNumlabel.textColor = [UIColor blueColor];
    }else if (indexPath.row == 2){
        
    }else if (indexPath.row == 3){
        cell.BackIconImageView.hidden = YES;
        
    }

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0){
        AccountSafetyViewController *accountSafetyViewController = [AccountSafetyViewController new];
        [self.navigationController pushViewController:accountSafetyViewController animated:YES];
    }else if (indexPath.row == 1){
        [self callPhone:@"01083065377"];
    }else if (indexPath.row == 2){
 
    }else if (indexPath.row == 3){
 
    }
    
}

-(void)makeLogoutButton{
    UIButton *logOutButton = [[UIButton alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_SettingTableView.frame)+cellHeight, SCREEN_WIDTH-20, 28)];
    logOutButton.backgroundColor = [UIColor greenColor];
    [logOutButton setTitle:@"退出登录" forState:UIControlStateNormal];
    logOutButton.titleLabel.font = [UIFont systemFontOfSize:16];
    logOutButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [logOutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [logOutButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [logOutButton addTarget:self action:@selector(logoutClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logOutButton];
}
- (void)callPhone:(NSString *)phoneNumber
{
    //phoneNumber = "18369......"
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",phoneNumber];
    UIWebView * callWebview = [[UIWebView alloc] init];
    //    NSURL *telURL =[NSURL URLWithString:@"tel:10086"];
    //    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
    
    
}
-(void)logoutClick
{
    NSString *loginToken = [CommonVar sharedInstance].loginToken;
    [self setBusyIndicatorVisible:YES];
    WTCLogoutRequest *request = [[WTCLogoutRequest alloc]initWithToken:loginToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        NSUserDefaults *ns=[NSUserDefaults standardUserDefaults];
        [ns removeObjectForKey:@"token"];
        
        AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
//        if(app!=nil){
//            [app unregisterXG];
//        }
        
        UINavigationController * root=self.navigationController;
        [self.navigationController popToRootViewControllerAnimated:NO];
        
        LoginViewController *loginVc=[[LoginViewController alloc]init];
        [root pushViewController:loginVc animated:YES];
    
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
    }];
    [request start];
    
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
