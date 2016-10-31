//
//  WTCShareViewController.m
//  WTCar
//
//  Created by apple on 2016/10/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCShareViewController.h"
#import "WTCShareTableViewCell.h"
@interface WTCShareViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)IBOutlet UITableView *tableView;
@property(nonatomic,weak)IBOutlet UIButton *allSelectBtn;
@property(nonatomic,weak)IBOutlet UILabel *allCarNum;
@property(nonatomic,weak)IBOutlet UIButton *shareBtn;
@end

@implementation WTCShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"分享";
    // Do any additional setup after loading the view from its nib.
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"WTCShareTableViewCell";
    WTCShareTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        NSArray *cellArr = [[NSBundle mainBundle]loadNibNamed:@"WTCShareTableViewCell" owner:self options:nil];
        cell = [cellArr objectAtIndex:0];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
