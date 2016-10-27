//
//  WTCAddCarViewController.m
//  WTCar
//
//  Created by apple on 2016/10/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCAddCarViewController.h"
#import "WTCAddCarTableViewCell.h"
#import "KKUploadPhotoCollectionViewCell.h"
#import "KKPhotoPickerManager.h"
#import "KKAreaPicker.h"
#import "KKStringPicker.h"
#import "KKDateTimePicker.h"
#import "KKRangePicker.h"
#import "ACEExpandableTextCell.h"
static NSString *collectionViewCellId = @"collectionViewCellId";
static CGFloat imageSize = 80;

typedef enum
{
    sectionTypeAddCar = 0,
    sectionTypeCarInfo = 1
}sectionType;

@interface WTCAddCarViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate,ACEExpandableTableViewDelegate>
{
    NSArray *infoArr;
    CGFloat _cellHeight[2];

}

@property(nonatomic,weak)IBOutlet UITableView *tableView;
@property(nonatomic, strong) UICollectionView *collectionView; //添加图片,每个cell内有一个imageView
@property(nonatomic, strong) NSMutableArray *imageArray;
@property(nonatomic,weak)IBOutlet UIButton *commitBtn;
@property (nonatomic, strong) NSMutableArray *cellData;

@end

@implementation WTCAddCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCollectionView];
    self.imageArray = [NSMutableArray array];
    infoArr = @[@"品牌车系",@"所在地",@"里程",@"初次上牌时间",@"价格车辆描述"];
    self.cellData = [NSMutableArray arrayWithArray:@[ @"Existing text", @""]];


}
#pragma mark-设置图片选择
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.imageArray.count < 9) {
        return self.imageArray.count + 1;
    }
    return self.imageArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    KKUploadPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellId forIndexPath:indexPath];
    //添加子控件,设置布局与控件图片
    [self addAndSetSubViews:cell indexPath:indexPath];
    return cell;
}

- (void)addAndSetSubViews:(KKUploadPhotoCollectionViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    //清空子控件,解决重用问题
    NSArray *subviews = [[NSArray alloc] initWithArray:cell.contentView.subviews];
    for (UIView *subview in subviews) {
        [subview removeFromSuperview];
    }
    UIImageView *imageView = [[UIImageView alloc]init];
    [cell.contentView addSubview:imageView];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.layer.masksToBounds = YES;
    cell.tag = 11; //根据tag值设定是否可点击,11可点击,初始全部可点击
    cell.imageView = imageView;
    cell.backgroundColor = [UIColor whiteColor];
    if(indexPath.row == self.imageArray.count){
        imageView.image = [UIImage imageNamed:@"WTCAddCar_add"];
    }else{
        imageView.image = nil;
    }
    
    UIButton *cancleBtn = [[UIButton alloc]init];
    cell.cancleBtn = cancleBtn;
    [cell.contentView addSubview: cancleBtn];
    [cancleBtn setImage:[UIImage imageNamed:@"WTCAddRemove"] forState:UIControlStateNormal];
    cancleBtn.hidden = YES;//初始将删除按钮隐藏
    cell.cancleBtn.tag = indexPath.row;
    [cell.cancleBtn addTarget:self action:@selector(cancleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.imageView.frame = CGRectMake(0, 0, imageSize, imageSize);
    cell.cancleBtn.frame = CGRectMake(0, 0, 20, 20);
    
    if (self.imageArray.count > indexPath.row) {
        if ([self.imageArray[indexPath.row] isKindOfClass:[UIImage class]]) {
            cell.imageView.image = nil;
            cell.imageView.image = self.imageArray[indexPath.row];
            cell.cancleBtn.hidden = NO;
            cell.tag = 10; //初始设置tag为11,当为10时,表示已经添加图片
        }
    }
}

#pragma mark  collectionView代理方法,添加照片
//点击collectionView跳转到相册
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([collectionView cellForItemAtIndexPath:indexPath].tag == 11) {
        [[KKPhotoPickerManager shareInstace] showActionSheetInView:self.view fromController:self completionBlock:^(NSMutableArray *imageArray) {
            for (int i = 0; i<imageArray.count; i++) {
                if (self.imageArray.count < 9) {
                    UIImage *image = imageArray[i];
                    [self.imageArray addObject:image]; //上传图片保存到数组
                }
            }
            [self.collectionView reloadData];
        }];
    }
}

#pragma mark  删除图片
- (void)cancleBtnClick:(UIButton *)sender{
    if (sender.tag < self.imageArray.count) {
        [self.imageArray removeObjectAtIndex:sender.tag];
        sender.hidden = YES;
        [self.collectionView reloadData];
    }
}

#pragma mark  设置CollectionView
- (void)setCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(imageSize, imageSize);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,100, self.view.frame.size.width, imageSize + 20) collectionViewLayout:layout];
    self.collectionView = collectionView;
    [self.view addSubview:collectionView];
    
    [self.collectionView registerClass:[KKUploadPhotoCollectionViewCell class] forCellWithReuseIdentifier:collectionViewCellId];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10);
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 4) {
        return MAX(50.0, _cellHeight[indexPath.section]);
    }
    else{
        return 60;
    };
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 4) {
        return [self getCarDescribtion:tableView atIndexPath:indexPath];
    }
    else
    {
        return [self getCarInfo:tableView atIndexPath:indexPath];
    }
}

-(UITableViewCell *)getCarDescribtion:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    ACEExpandableTextCell *cell = [tableView expandableTextCellWithId:@"ca"];
    cell.text = [self.cellData objectAtIndex:indexPath.section];
    cell.textView.placeholder = @"Placeholder";
    return cell;
}
-(UITableViewCell *)getCarInfo:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idnetifer = @"addCarCell";
    WTCAddCarTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:idnetifer];
    if (cell == nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"WTCAddCarTableViewCell" owner:self options:nil] objectAtIndex:0];
        cell.infoField.delegate = self;
    }
    
    cell.infoField.tag = indexPath.row;
    cell.nameLabel.text = [infoArr objectAtIndex:indexPath.row];

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 1:
            if (indexPath.row == 1) {
                
            }
            break;
        default:
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.returnKeyType = UIReturnKeyDone;
    if (textField.tag == 1) {
        [KKAreaPicker showPickerWithTitle:@"省市选择" pickerType:KKAreaPickerTypeProviceCity defaultValue:nil onCancel:^(KKAreaPicker *picker) {
            textField.inputView=picker;
        } onCommit:^(KKAreaPicker *picker, KKAdrress *address) {
            textField.text = [NSString stringWithFormat:@"%@%@",address.provice,address.city];
        }];
        return NO;
    }
    else if (textField.tag == 3)
    {
        [KKDateTimePicker showPickerWithTitle:@"选择日期" pickerMode:UIDatePickerModeDate defaultValue:nil onCancel:^(KKDateTimePicker *picker) {
            textField.inputView=picker;
        } onCommit:^(KKDateTimePicker *picker, NSDate *selectedDate) {
        
            textField.text = [self dateToString:selectedDate];
        }];
        return NO;
    }
    else
    {
        return YES;
    }
}
//- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
//        [theTextField resignFirstResponder];
//    return YES;
//}
-(NSString *)dateToString:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // HH是24进制，hh是12进制
    formatter.dateFormat = @"yyyy-MM-dd";
    // formatter.locale = [[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] autorelease];
    NSString *string = [formatter stringFromDate:date];
    return string;
}
//#pragma mark-解决键盘遮挡问题
////点击输入框触发
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    //键盘高度
    CGFloat keyboardHeight = 216.0f;
    //获取tag
//    NSLog(@"hhhhh === %d",textField.tag);
    //判断键盘高度是否遮住输入框，具体超过多少距离，移动多少距离（自己算好就可以，不一定和这里一样）
    if (self.tableView.bounds.size.height - keyboardHeight - 60 * (textField.tag + 1) < 0 &&self.tableView.bounds.size.height - keyboardHeight - 60 * (textField.tag + 1) > -60) {
        
        [self.tableView setContentOffset:CGPointMake(0, 50) animated:YES];
    }
    else if (self.tableView.bounds.size.height - keyboardHeight - 60 * (textField.tag + 1) < -60 &&self.tableView.bounds.size.height - keyboardHeight - 60 * (textField.tag + 1) > -120)
    {
        [self.tableView setContentOffset:CGPointMake(0, 110) animated:YES];
    }
    else if (self.tableView.bounds.size.height - keyboardHeight - 60 * (textField.tag + 1) < -120 &&self.tableView.bounds.size.height - keyboardHeight - 60 * (textField.tag + 1) > -180)
    {
        [self.tableView setContentOffset:CGPointMake(0, 170) animated:YES];
    }
}

//键盘收回触发
- (void)textFieldDidEndEditing:(UITextField *)textField{
    //回归原处
    [self.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
    
}
#pragma mark-设置textview
#pragma mark - Table View Delegate



- (void)tableView:(UITableView *)tableView updatedHeight:(CGFloat)height atIndexPath:(NSIndexPath *)indexPath
{
    _cellHeight[indexPath.section] = height;
}

- (void)tableView:(UITableView *)tableView updatedText:(NSString *)text atIndexPath:(NSIndexPath *)indexPath
{
    [_cellData replaceObjectAtIndex:indexPath.section withObject:text];
}

//- (void)setToolBarForTextField:(id)aTextInput doneActionTarget:(id)aTarget actionSelector:(SEL)aDoneSEL
//
//{
//    if (![aTextInput isKindOfClass:[UITextView class]] &&
//        
//        ![aTextInput isKindOfClass:[UITextField class]])
//        
//    {
//        
//        return;
//        
//    }
//    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
//    
//    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:aTarget action:nil];
//    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:aTarget action:aDoneSEL];
//    
//    NSArray *itemsArray = [NSArray arrayWithObjects:spaceItem, doneItem, nil];
//    
//
//    [toolBar setItems:itemsArray];
//    
//    if ([aTextInput isKindOfClass:[UITextField class]]) {
//        
//        [(UITextField *)aTextInput setInputAccessoryView:toolBar];
//        
//    } else if ([aTextInput isKindOfClass:[UITextView class]]) {
//        
//        [(UITextView *)aTextInput setInputAccessoryView:toolBar];
//        
//    }
//    
//    
//}

@end
