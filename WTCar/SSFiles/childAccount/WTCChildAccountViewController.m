//
//  WTCChildAccountViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/11/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCChildAccountViewController.h"
#import "AddChildAccountViewController.h"
#import "ChangeAccountCodeViewController.h"
#import "ChildAccountTableViewCell.h"
#import "ChangeChildAccountViewController.h"
#import "WTCDelSubUserRequest.h"
#import "MBProgressHUD.h"
#import "WTCSubUserListRequest.h"
#import "WTCSubUser.h"
@interface WTCChildAccountViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat cellHeight;
}
@property(nonatomic,strong) UITableView *childAccountTableView;
@property(nonatomic,strong) NSArray *childNameArray;
@property(nonatomic,strong)NSArray *childTeleNumArray;
@end

@implementation WTCChildAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:247/255.0f blue:245/255.0f alpha:1];
    UIBarButtonItem *addButtonItem = [self createBarButtonItemWithImage:[UIImage imageNamed:@"addchildAccount_title"] action:@selector(addChildAccount:) target:self];
    self.navigationItem.rightBarButtonItem = addButtonItem;
    
    [self dataInit];
    [self makeTableView];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated
{
    [self getChildAccountListRequest];
}
- (void)dataInit
{
    _childNameArray = @[@"苗刚"];
    _childTeleNumArray = @[@"1389876757"];
    
    cellHeight = 62;
}
//获取子账户列表
-(void)getChildAccountListRequest
{
    NSString *getsubAccountListToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCSubUserListRequest *request = [[WTCSubUserListRequest alloc]initWithToken:getsubAccountListToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
        WTCSubUser *result = [request getResponse].data;
        _childAccountMuarry = [[NSMutableArray alloc]initWithArray:result.rows];

    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];

}
- (void)addChildAccount:(id)sender
{
    AddChildAccountViewController *addChildViewCon = [AddChildAccountViewController new];
    [self.navigationController pushViewController:addChildViewCon animated:YES];
    //    [ProgressHUD dismiss];
    
}
- (UIBarButtonItem *)createBarButtonItemWithImage:(UIImage *)image action:(SEL)action target:(id)target
{
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:action];
    
    return barButtonItem;
    
}

- (void)makeTableView
{
    _childAccountTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 198,SCREEN_WIDTH, cellHeight*(_childNameArray.count)) style:UITableViewStylePlain];
    [self.view addSubview:_childAccountTableView];
    _childAccountTableView.delegate = self;
    _childAccountTableView.dataSource =self;
    
    UINib *nib = [UINib nibWithNibName:@"ChildAccountTableViewCell" bundle:nil];
    [_childAccountTableView registerNib:nib forCellReuseIdentifier:@"cellIdentifier"];
    
    _childAccountTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _childAccountTableView.scrollEnabled = YES;
    _childAccountTableView.backgroundColor = [UIColor clearColor];
}

#pragma mark -TableView delegate & datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _childAccountMuarry.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ChildAccountTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ChildAccountTableViewCell" owner:nil options:nil][0];
    [_childAccountTableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    
    _childAccountTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [cell.contentView setBackgroundColor:[UIColor whiteColor]];
    cell.ChildAccountNameLabel.text = _childAccountMuarry[indexPath.row][@"childAccountName"];
    cell.ChildAccountTeleLabel.text = _childAccountMuarry[indexPath.row][@"childAccountMobile"];
    [cell.ChangeChildAccountButton addTarget:self action:@selector(changeChildAccountButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    _changeButtonID = [NSString stringWithFormat:@"%ld",indexPath.row];
    [cell.DeleChildAccountButton addTarget:self action:@selector(deleChildAccountButtonClick) forControlEvents:UIControlEventTouchUpInside];

    return cell;
}
-(void)deleChildAccountButtonClick
{
    NSNumber * ID = @([_changeButtonID integerValue]);
    
    [self setBusyIndicatorVisible:YES];
    WTCDelSubUserRequest *request = [[WTCDelSubUserRequest alloc]initWithDelSubUser:ID successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        WTCSubUser *result = [request getResponse].data;
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];
}
-(void)changeChildAccountButtonClick:(id)sender
{
    ChangeChildAccountViewController *changeChildAccountViewCon = [ChangeChildAccountViewController new];
    changeChildAccountViewCon.ButtonId = _changeButtonID;
    [self.navigationController pushViewController:changeChildAccountViewCon animated:YES];
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

- (IBAction)ChangeChildCodeButtonClick:(id)sender {
    ChangeAccountCodeViewController *changeCodeViewCon = [ChangeAccountCodeViewController new];
    changeCodeViewCon.oldAccountKey = _AccountCodeLabel.text;
    [self.navigationController pushViewController:changeCodeViewCon animated:YES];
}
@end
