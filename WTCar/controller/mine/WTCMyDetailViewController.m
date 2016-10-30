//
//  WTCMyDetailViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCMyDetailViewController.h"
#import "WTCMineViewTableViewCell.h"

@interface WTCMyDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat cellHeight;
}
@property (nonatomic,strong)NSArray *cellFirTextArray;
@property (nonatomic,strong)NSArray *cellSecTextArray;
@property (nonatomic,strong)UITableView *myDetialTableView;
@end

@implementation WTCMyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)dataInit{
        _cellFirTextArray = @[@"头像",@"用户名",@"手机号",@"车行名称",@"详细地址",@"车行介绍"];
    _cellSecTextArray = @[@"",@"苗刚",@"18732166582",@"",@"",@"未填写"];
    cellHeight = 42;
}
-(void)makeTableView{
    _myDetialTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_NameVerityButton.frame)+50,SCREEN_WIDTH, cellHeight*6) style:UITableViewStylePlain];
    [self.view addSubview:_myDetialTableView];
    _myDetialTableView.delegate = self;
    _myDetialTableView.dataSource =self;
    
    UINib *nib = [UINib nibWithNibName:@"WTCMineViewTableViewCell" bundle:nil];
    [_myDetialTableView registerNib:nib forCellReuseIdentifier:@"cellIdentifier"];
    
    _myDetialTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _myDetialTableView.scrollEnabled = YES;
    _myDetialTableView.backgroundColor = [UIColor clearColor];
}
#pragma mark -TableView delegate & datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    } else if(section == 1)
    {
        return 3;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return cellHeight*2;
        }
    }else{
        return cellHeight;
    }
    return cellHeight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WTCMineViewTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"WTCMineViewTableViewCell" owner:nil options:nil][0];
    [_myDetialTableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    
    _myDetialTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [cell.contentView setBackgroundColor:[UIColor lightGrayColor]];
    if (indexPath.section==0) {
        cell.mineDataLabel.text = _cellFirTextArray[indexPath.row];
        cell.detailLabel.text = _cellSecTextArray[indexPath.row];
    }else{
        cell.mineDataLabel.text = _cellFirTextArray[indexPath.row+3];
        cell.detailLabel.text = _cellSecTextArray[indexPath.row+3];
    }

    if (!IOS9_OR_LATER) {
        cell.mineDataLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.detailLabel.font = [UIFont boldSystemFontOfSize:15];
    }
    if (indexPath.section == 0) {
        
    if (indexPath.row == 0) {
        UIImage *image = [UIImage imageNamed:@"交通示意图"];
        CGFloat width = 68;
        CGFloat height = 68;
        UIImageView *PeoPicImage = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-width-30)/2, 31, width, height)];
        PeoPicImage.image = image;
        PeoPicImage.backgroundColor = [UIColor clearColor];
        }else if (indexPath.row == 1){
        
        }else if (indexPath.row == 2){
        
        }
    }else{
        if (indexPath.row == 0) {
            
        }else if (indexPath.row ==1)
        {
            
        }else if (indexPath.row == 2){
            
        }
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        
    }else if (indexPath.row == 1){
        
    }else if (indexPath.row == 2){

    }else if (indexPath.row == 3){
        
    }else if (indexPath.row == 4){
        
    }else if (indexPath.row == 5){
        
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
