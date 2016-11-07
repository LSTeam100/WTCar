//
//  WTCCarCategoryViewController.m
//  WTCar
//
//  Created by apple on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCarCategoryViewController.h"
#import "ChineseString.h"


typedef enum
{
    tableviewTypeFirst = 0,
    tableviewTypeSecond = 1,
    tableviewTypeThird = 3
}tableviewType;

@interface WTCCarCategoryViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger spaceDistance;
}
@property(nonatomic,strong)NSMutableArray *indexArray;
@property(nonatomic,strong)NSMutableArray *letterResultArr;

@property (nonatomic, strong) UILabel *sectionTitleView;
@property (nonatomic, strong) NSTimer *timer;
@property(nonatomic,weak)IBOutlet UITableView *tableView;
@property(nonatomic,strong)UITableView *secondTableView;
@property(nonatomic,strong)UITableView *thirdTableView;



@end

@implementation WTCCarCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sectionTitleView = ({
        UILabel *sectionTitleView = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, (SCREEN_HEIGHT-100)/2,100,100)];
        sectionTitleView.textAlignment = NSTextAlignmentCenter;
        sectionTitleView.font = [UIFont boldSystemFontOfSize:60];
        sectionTitleView.textColor = [UIColor blueColor];
        sectionTitleView.backgroundColor = [UIColor whiteColor];
        sectionTitleView.layer.cornerRadius = 6;
        sectionTitleView.layer.borderWidth = 1.f/[UIScreen mainScreen].scale;
        _sectionTitleView.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
        sectionTitleView;
    });
    [self.navigationController.view addSubview:self.sectionTitleView];
    self.sectionTitleView.hidden = YES;
    
    spaceDistance = 100;
    
    NSArray *stringsToSort = [NSArray arrayWithObjects:
                              @"￥hhh, .$",@" ￥Chin ese ",@"开源中国 ",@"www.oschina.net",
                              @"开源技术",@"社区",@"开发者",@"传播",
                              @"2014",@"a1",@"100",@"中国",@"暑假作业",
                              @"键盘", @"鼠标",@"hello",@"world",@"b1",
                              nil];
    self.indexArray = [ChineseString IndexArray:stringsToSort];
    self.letterResultArr = [ChineseString LetterSortArray:stringsToSort];
    
    
    
    [self createTableview];
    

}
-(void)createTableview
{
    self.secondTableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH,0,SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.secondTableView.tag = tableviewTypeSecond;
    self.secondTableView.delegate = self;
    self.secondTableView.dataSource = self;
    [self.view addSubview:self.secondTableView];
    
    self.thirdTableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH,0,SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.thirdTableView.tag = tableviewTypeThird;
    self.thirdTableView.delegate = self;
    self.thirdTableView.dataSource = self;
    [self.view addSubview:self.thirdTableView];

}

#pragma mark -
#pragma mark - UITableViewDataSource

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (tableView.tag == tableviewTypeSecond) {
        return self.indexArray;
    }
    else if (tableView.tag == tableviewTypeThird)
    {
        return self.indexArray;
    }
    else
    {
        return self.indexArray;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *key = [self.indexArray objectAtIndex:section];
    return key;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.indexArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.letterResultArr objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"carCategoryCell";
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [[self.letterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    [self showSectionTitle:title];
    return index;
}


#pragma mark - private
- (void)timerHandler:(NSTimer *)sender
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:.3 animations:^{
            self.sectionTitleView.alpha = 0;
        } completion:^(BOOL finished) {
            self.sectionTitleView.hidden = YES;
        }];
    });
}

-(void)showSectionTitle:(NSString*)title{
    [self.sectionTitleView setText:title];
    self.sectionTitleView.hidden = NO;
    self.sectionTitleView.alpha = 1;
    [self.timer invalidate];
    self.timer = nil;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerHandler:) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}



#pragma mark -
#pragma mark - UITableViewDelegate
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *lab = [UILabel new];
    lab.backgroundColor = [UIColor groupTableViewBackgroundColor];
    lab.text = [self.indexArray objectAtIndex:section];
    lab.textColor = [UIColor whiteColor];
    return lab;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self searchCategory:tableView atIndex:indexPath];
    
    NSLog(@"---->%@",[[self.letterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
//                                                    message:[[self.letterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]
//                                                   delegate:nil
//                                          cancelButtonTitle:@"YES" otherButtonTitles:nil];
//    [alert show];
    
}
-(void)searchCategory:(UITableView *)tableview atIndex:(NSIndexPath *)indexPath
{
    if (tableview.tag == tableviewTypeFirst) {
        if (self.thirdTableView.frame.origin.x == spaceDistance * 2) {
            CGRect moveRect = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.3];
            [self.thirdTableView setFrame:moveRect];
            [UIView commitAnimations];
        }
        else{
        CGRect moveRect = CGRectMake(spaceDistance, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [self.secondTableView setFrame:moveRect];
        [UIView commitAnimations];
        }
    }
    else if (tableview.tag == tableviewTypeSecond)
    {
        CGRect moveRect = CGRectMake(spaceDistance*2, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [self.thirdTableView setFrame:moveRect];
        [UIView commitAnimations];
    }
    else if (tableview.tag == tableviewTypeThird)
    {
        NSLog(@"section=%ld",(long)indexPath.section);
        NSLog(@"选中的%ld个",(long)indexPath.row);
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
