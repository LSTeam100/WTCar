//
//  WTCCarCategoryViewController.m
//  WTCar
//
//  Created by apple on 2016/10/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCCarCategoryViewController.h"
#import "ChineseString.h"
#import "WTCCarBrandRequest.h"
#import "CategoryTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "WTCCarTypeRequest.h"
#import "WTCCarModelRequest.h"

typedef enum
{
    tableviewTypeFirst = 0,
    tableviewTypeSecond = 1,
    tableviewTypeThird = 3
}tableviewType;

@interface WTCCarCategoryViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger spaceDistance;
    NSArray *allBrandsArr;
    NSMutableArray *brandsIndexArr;
    NSMutableArray *carTypesSecionsArr;
    NSMutableArray *carModelSecitonsArr;
}
@property(nonatomic,strong)NSMutableArray *indexArray;
@property(nonatomic,strong)NSMutableArray *letterResultArr;

@property (nonatomic, strong) UILabel *sectionTitleView;
@property (nonatomic, strong) NSTimer *timer;
@property(nonatomic,weak)IBOutlet UITableView *tableView;
@property(nonatomic,strong)UITableView *secondTableView;
@property(nonatomic,strong)UITableView *thirdTableView;
@property(nonatomic,strong)WTCCarBrand *selectBrand;
@property(nonatomic,strong)WTCCarType *selectType;
@property(nonatomic,strong)WTCCarModel *selectModel;



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
    

    
    allBrandsArr = [[NSArray alloc]init];
    carTypesSecionsArr = [[NSMutableArray alloc]init];
    carModelSecitonsArr = [[NSMutableArray alloc]init];
    
    
    [self createTableview];
    [self loadCarBrand];

}
-(void)loadCarBrand
{
    [self setBusyIndicatorVisible:YES];
    WTCCarBrandRequest *request = [[WTCCarBrandRequest alloc]initWithToken:@"124" successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        WTCAllCarBrands *brands = [request getResponse].data;
        allBrandsArr = [NSArray arrayWithArray: brands.brandsArr];
        brandsIndexArr = [[NSMutableArray alloc]init];
        
        for (int i = 0; i < brands.brandsArr.count; i++) {
            WTCCarBrand *abrand = [brands.brandsArr objectAtIndex:i];
            [brandsIndexArr addObject:abrand.name];
        }
        self.indexArray = [ChineseString IndexArray:brandsIndexArr];
        self.letterResultArr = [ChineseString LetterSortArray:brandsIndexArr];
        
        [self.tableView reloadData];
        
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        

    }];
    [request start];
    
}
-(void)loadCarType:(NSNumber *)typeId
{
    [self setBusyIndicatorVisible:YES];
    WTCCarTypeRequest *request = [[WTCCarTypeRequest alloc]initWithToken:DEFAULTTOKEN TypeId:typeId successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        WTCAllCarsType *typeModel = [request getResponse].data;
        carTypesSecionsArr = [NSMutableArray arrayWithArray:typeModel.carsTypeArr];
        
        [self.secondTableView reloadData];
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];

    }];
    [request start];
    
}
-(void)loadCarModel:(NSNumber *)modelId
{
    [self setBusyIndicatorVisible:YES];
    WTCCarModelRequest *request = [[WTCCarModelRequest alloc]initWithToken:DEFAULTTOKEN ModelId:modelId successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        WTCAllCarsModel *carsModel = [request getResponse].data;
        carModelSecitonsArr = [NSMutableArray arrayWithArray:carsModel.carsModelArr];
        [self.thirdTableView reloadData];
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];

    }];
  
    [request start];
    
}

-(void)createTableview
{
    self.secondTableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH,64,SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    self.secondTableView.tag = tableviewTypeSecond;
    self.secondTableView.delegate = self;
    self.secondTableView.dataSource = self;
    [self.view addSubview:self.secondTableView];
    
    self.thirdTableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH,64,SCREEN_WIDTH, SCREEN_HEIGHT-64)];
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
//        return self.indexArray;
        return 0;
    }
    else if (tableView.tag == tableviewTypeThird)
    {
        return self.indexArray;
    }
    else
    {
        return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (tableView.tag == tableviewTypeFirst) {
        NSString *key = [self.indexArray objectAtIndex:section];
        return key;
    }
    else if (tableView.tag == tableviewTypeSecond)
    {
        NSDictionary *oneDic = [carTypesSecionsArr objectAtIndex:section];
        NSString *key = @"梧桐汽车";
        for (NSString *titleKey in oneDic) {
            key = titleKey;
        }
        return key;

    }
    else
    {
        NSDictionary *oneDic = [carModelSecitonsArr objectAtIndex:section];
        NSString *key = @"梧桐汽车";
        for (NSString *titleKey in oneDic) {
            key = titleKey;
        }
        return key;

    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag == tableviewTypeFirst) {
        return [self.indexArray count];
    }
    else if(tableView.tag == tableviewTypeSecond)
    {
        return carTypesSecionsArr.count;
    }
    else
    {
        return  carModelSecitonsArr.count;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == tableviewTypeFirst) {
        return [[self.letterResultArr objectAtIndex:section] count];
    }
    else if (tableView.tag == tableviewTypeSecond){
        NSDictionary *rowsDic = [carTypesSecionsArr objectAtIndex:section];
        NSArray *rowArr = [[NSArray alloc]init];
            for (NSString *key in rowsDic) {
                rowArr = [rowsDic objectForKey:key];
            }
        return rowArr.count;

    }
    else
    {
        NSDictionary *rowsDic = [carModelSecitonsArr objectAtIndex:section];
        NSArray *rowArr = [[NSArray alloc]init];
        for (NSString *key in rowsDic) {
            rowArr = [rowsDic objectForKey:key];
        }
        return rowArr.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == tableviewTypeFirst) {
        static NSString *CellIdentifier = @"carCategoryCell";
        CategoryTableViewCell *cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"CategoryTableViewCell" owner:self options:nil]objectAtIndex:0];
        }
        NSString *name = [[self.letterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
        cell.nameLabel.text = name;
        
        for (int i = 0; i < allBrandsArr.count; i ++) {
            WTCCarBrand *abrand = [allBrandsArr objectAtIndex:i];
            if ([name isEqualToString:abrand.name]) {
                
                [cell.logoImageView sd_setImageWithURL:[NSURL URLWithString:abrand.logo] placeholderImage:[UIImage imageNamed:@"1234"]];
                break;
            }
        }
        return cell;
    }
    else if (tableView.tag == tableviewTypeSecond)
    {
        static NSString *typeIdentifer = @"typeCell";
        UITableViewCell *cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:typeIdentifer];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:typeIdentifer];
        }
        
            NSDictionary *oneDic = [carTypesSecionsArr objectAtIndex:indexPath.section];
            
            for (NSString *key in oneDic) {
                NSArray *arr = [oneDic objectForKey:key];
                WTCCarType *atype = [arr objectAtIndex:indexPath.row];
                cell.textLabel.text = atype.fullname;
            }
        return cell;

    }
    else
    {
        static NSString *typeIdentifer = @"thirdtypeCell";
        UITableViewCell *cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:typeIdentifer];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:typeIdentifer];
        }
            NSDictionary *oneDic = [carModelSecitonsArr objectAtIndex:indexPath.section];
            
            for (NSString *key in oneDic) {
                NSArray *arr = [oneDic objectForKey:key];
                WTCCarModel *aModel = [arr objectAtIndex:indexPath.row];
                cell.textLabel.text = aModel.name;
        }
        return cell;
    }
   
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
    if (tableView.tag == tableviewTypeFirst) {
        UILabel *lab = [UILabel new];
        lab.backgroundColor = [UIColor groupTableViewBackgroundColor];
        lab.text = [self.indexArray objectAtIndex:section];
        lab.textColor = [UIColor blackColor];
        return lab;
        
    }
    else if (tableView.tag == tableviewTypeSecond){
        NSDictionary *oneDic = [carTypesSecionsArr objectAtIndex:section];
        NSString *key = @"梧桐汽车";
        for (NSString *titleKey in oneDic) {
            key = titleKey;
        }
        UILabel *lab = [UILabel new];
        lab.backgroundColor = [UIColor groupTableViewBackgroundColor];
        lab.text = key;
        lab.textColor = [UIColor blackColor];
        return lab;
    }
    else
    {
        NSDictionary *oneDic = [carModelSecitonsArr objectAtIndex:section];
        NSString *key = @"梧桐汽车";
        for (NSString *titleKey in oneDic) {
            key = titleKey;
        }
        UILabel *lab = [UILabel new];
        lab.backgroundColor = [UIColor groupTableViewBackgroundColor];
        lab.text = key;
        lab.textColor = [UIColor blackColor];
        return lab;    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self searchCategory:tableView atIndex:indexPath];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}
-(void)searchCategory:(UITableView *)tableview atIndex:(NSIndexPath *)indexPath
{
    if (tableview.tag == tableviewTypeFirst) {
        if (self.thirdTableView.frame.origin.x == spaceDistance * 2) {
            CGRect moveRect = CGRectMake(SCREEN_WIDTH, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64);
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.3];
            [self.thirdTableView setFrame:moveRect];
            [UIView commitAnimations];
        }
        else{
        CGRect moveRect = CGRectMake(spaceDistance, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64);
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [self.secondTableView setFrame:moveRect];
        [UIView commitAnimations];
            
            NSString *selectName = [[self.letterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];

            for (int i = 0; i < allBrandsArr.count; i ++) {
                WTCCarBrand *abrand = [allBrandsArr objectAtIndex:i];
                if ([selectName isEqualToString:abrand.name]) {
                    self.selectBrand  = abrand;
                    [self loadCarType:abrand.brandId];
                    break;
                }
            }
        }
    }
    else if (tableview.tag == tableviewTypeSecond)
    {
        CGRect moveRect = CGRectMake(spaceDistance*2, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64);
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [self.thirdTableView setFrame:moveRect];
        [UIView commitAnimations];
        
        NSDictionary *oneDic = [carTypesSecionsArr objectAtIndex:indexPath.section];
        
        for (NSString *key in oneDic) {
            
            NSArray *selecArr = [oneDic objectForKey:key];
            if (selecArr.count > 0) {
                WTCCarType *atype = [selecArr objectAtIndex:indexPath.row];
                self.selectType = atype;
                [self loadCarModel:atype.typeId];
                
            }
        }
    }
    else if (tableview.tag == tableviewTypeThird)
    {
        NSDictionary *oneDic = [carModelSecitonsArr objectAtIndex:indexPath.section];
        
        for (NSString *key in oneDic) {
            NSArray *arr = [oneDic objectForKey:key];
            WTCCarModel *aModel = [arr objectAtIndex:indexPath.row];
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(selectBrand:type:Model:)]) {
                [self.delegate selectBrand:self.selectBrand type:self.selectType Model:aModel];
                [self.navigationController popViewControllerAnimated:YES];
            }
        }
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
