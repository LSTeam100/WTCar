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

- (void)dataInit
{
    _childNameArray = @[@"苗刚"];
    _childTeleNumArray = @[@"1389876757"];
    
    cellHeight = 62;
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
    return _childNameArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ChildAccountTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"ChildAccountTableViewCell" owner:nil options:nil][0];
    [_childAccountTableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    
    _childAccountTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [cell.contentView setBackgroundColor:[UIColor whiteColor]];
    cell.ChildAccountNameLabel.text = _childNameArray[indexPath.row];
    cell.ChildAccountTeleLabel.text = _childTeleNumArray[indexPath.row];
    if (!IOS9_OR_LATER) {

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

- (IBAction)ChangeChildCodeButtonClick:(id)sender {
    ChangeAccountCodeViewController *changeCodeViewCon = [ChangeAccountCodeViewController new];
    [self.navigationController pushViewController:changeCodeViewCon animated:YES];
}
@end
