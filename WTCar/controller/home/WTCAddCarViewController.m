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
#import "WTCCarBrandViewController.h"
#import "WTCTabBarViewController.h"
#import "WTCAddCarSuccessViewController.h"
#import "WTCCarModel.h"
#import "WTCCarType.h"
#import "WTCCarBrand.h"
#import "WTCProfileImageUploadRequest.h"
#import "WTCPublishCarRequest.h"
#import "WTCarDetailModel.h"
#import "WTCCarDetailRequest.h"
#import "WTCarUpdataCarInfo.h"
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
    UIToolbar *_inputAccessoryView;
    NSMutableArray *urlImageArr;

}

@property(nonatomic,weak)IBOutlet UITableView *tableView;
@property(nonatomic, strong) UICollectionView *collectionView; //添加图片,每个cell内有一个imageView
@property(nonatomic, strong) NSMutableArray *imageArray;
@property(nonatomic,weak)IBOutlet UIButton *commitBtn;
@property (nonatomic, strong) NSMutableArray *cellData;
@property(nonatomic,strong)NSString *carDescibetion;
@property(nonatomic,strong)WTCCarBrand *selectBrand;
@property(nonatomic,strong)WTCCarType *selectType;
@property(nonatomic,strong)WTCCarModel *selectModel;
@property(nonatomic,strong)NSString *city;
@property(nonatomic,strong)NSString *province;
@property(nonatomic,strong)NSString *distance;
@property(nonatomic,strong)NSString *plateDate;
@property(nonatomic,strong)NSString *price;
@property(nonatomic,strong)NSString *cbrandName;
@property(nonatomic,strong)NSString *cModelName;
@property(nonatomic,strong)NSString *ctypeName;
@property(nonatomic,strong)NSString *modifyCarId;
@property(nonatomic,strong)NSNumber *sid;
@end

@implementation WTCAddCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setCollectionView];
    self.imageArray = [NSMutableArray array];
    urlImageArr = [[NSMutableArray alloc]init];
    self.title = @"发车";
    infoArr = @[@"品牌车系",@"所在地",@"里程(公里)",@"初次上牌时间",@"价格",@"价格车辆描述"];
    self.cellData = [NSMutableArray arrayWithArray:@[ @"Existing text", @""]];
    
    if (self.editeStatus == 1) {
        [self getCarDetailInfo];
    }
    
}
-(void)getCarDetailInfo
{
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCCarDetailRequest *request = [[WTCCarDetailRequest alloc]initWithToken:loginToken CarDetailId:self.carDetailId successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        WTCarDetailModel *detaiModel = [request getResponse].data;
        urlImageArr = [NSMutableArray arrayWithArray:detaiModel.primaryPicUrlArr];
        self.imageArray = [[NSMutableArray alloc]initWithCapacity:4];
        
        for (int i = 0; i <urlImageArr.count; i ++) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
            NSString *url = [urlImageArr objectAtIndex:i];
            [imageView sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                [self.imageArray addObject:image];
                [self.collectionView reloadData];

            }];
 
        }
        //        for (int i = 0; i < urlImageArr.count; i++) {
//            NSString *url = [urlImageArr objectAtIndex:i];
//            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
//            [self.imageArray addObject:image];
//        }
        self.plateDate = detaiModel.firstUpTime;
        self.cModelName = detaiModel.cmodel;
        self.cbrandName = detaiModel.cbrand;
        self.ctypeName = detaiModel.ctype;
        self.city = detaiModel.city;
        self.province = detaiModel.province;
        self.distance = detaiModel.miles;
        self.price = detaiModel.price;
        self.carDescibetion = detaiModel.productDescr;
        self.modifyCarId = detaiModel.carDetialId;
        self.sid = detaiModel.oldCarId;
        
        [self.tableView reloadData];

    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];

    [request start];
}
-(void)initData
{
        self.selectModel.name = @"";
        self.selectBrand.name = @"";
        self.selectType.name = @"";
        [self.imageArray removeAllObjects];
        [urlImageArr removeAllObjects];
        self.plateDate = @"";
        self.carDescibetion = @"";
        self.province = @"";
        self.city = @"";

}
//-(UIToolbar *)inputAccessoryView
// {
//         if(!_inputAccessoryView)
//             {
//                     UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, 44)];
//                     UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dodo)];
//                     toolBar.items = [NSArray arrayWithObject:right];
//                     return toolBar;
//                 }
//         return _inputAccessoryView;
//}
//- (BOOL) canBecomeFirstResponder {
//    return YES;
//}
//-(void)dodo
// {
//    [self resignFirstResponder];
//}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

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
            [self upLoadImage:imageArray];
//            for (int i = 0; i<imageArray.count; i++) {
//                if (self.imageArray.count < 9) {
//                    UIImage *image = imageArray[i];
//                    [self.imageArray addObject:image]; //上传图片保存到数组
//                }
//            }

//            [self.collectionView reloadData];
        }];
    }
}
-(void)upLoadImage:(NSMutableArray *)imageArr
{
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_group_t group = dispatch_group_create();
    NSDictionary *emptyDic = @{};
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    for (int i = 0; i < imageArr.count; i++) {
//       __block int requestNum  = i;
        UIImage *image = [imageArr objectAtIndex:i];
        NSData *data = UIImageJPEGRepresentation(image,1.0);
        NSString *addCarImgPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"addCar_%d.jpg",i]];
        [data writeToFile:addCarImgPath atomically:YES];
        
//        dispatch_group_async(group, queue, ^{
        [self setBusyIndicatorVisible:YES];
            WTCProfileImageUploadRequest *request = [[WTCProfileImageUploadRequest alloc]init];
            request.requestImgPath = addCarImgPath;
            [request WTCUploadFileWith:emptyDic fileKey:IMAGEUPLOADKEY filePath:addCarImgPath SuccessCallbackBlock:^(NSData *data, NSURLResponse * response) {
                [self setBusyIndicatorVisible:NO];

                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                NSString *urlStr = [dic objectForKey:@"data"];
                if (self.imageArray.count < 9) {
                    UIImage *image = [UIImage imageWithContentsOfFile:request.requestImgPath];
                    [urlImageArr addObject:urlStr];
                    [self.imageArray addObject:image];
                    //上传图片保存到数组
                    [self.collectionView reloadData];
                }
            } FailCallbackBlock:^(NSError *error, NSURLResponse *response) {
                [self setBusyIndicatorVisible:NO];
            }];
//        });
        
    }
//    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
//        NSLog(@"全部加载完成");


//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//            NSLog(@"全部加载完成");
//            [self.collectionView reloadData];
//    });

}

#pragma mark  删除图片
- (void)cancleBtnClick:(UIButton *)sender{
    if (sender.tag < self.imageArray.count) {
        [self.imageArray removeObjectAtIndex:sender.tag];
        [urlImageArr removeObjectAtIndex:sender.tag];
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
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,self.navigationController.navigationBar.frame.size.height +22, self.view.frame.size.width, imageSize + 20) collectionViewLayout:layout];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return infoArr.count;
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
    if (indexPath.row == 5) {
        return [self getCarDes:tableView atIndexPath:indexPath];
    }
    else
    {
        return [self getCarInfo:tableView atIndexPath:indexPath];
    }
}
-(UITableViewCell *)getCarDes:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"desCell";
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    if (self.carDescibetion) {
        
        cell.textLabel.text = self.carDescibetion;
    }
    else
    {
        cell.textLabel.text = @"车辆描述";
    }
    return cell;
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
    
    if (indexPath.row == 2) {
//        cell.infoField.keyboardType = UIKeyboardTypeNumberPad;
    }
    cell.infoField.tag = indexPath.row;
    
    
    cell.nameLabel.text = [infoArr objectAtIndex:indexPath.row];
    
    if (indexPath.row == 0) {
        if (self.selectBrand != nil && self.selectType != nil && self.selectModel != nil) {
            cell.infoField.text = [NSString stringWithFormat:@"%@ %@ %@",self.selectBrand.name,self.selectType.name,self.selectModel.name];
        }
    }
    
    if (self.editeStatus == 1) {
        if (indexPath.row == 0) {
            if (self.selectBrand != nil && self.selectType != nil && self.selectModel != nil) {
                cell.infoField.text = [NSString stringWithFormat:@"%@ %@ %@",self.selectBrand.name,self.selectType.name,self.selectModel.name];
            }
            else
            {
               cell.infoField.text = [NSString stringWithFormat:@"%@ %@ %@",self.cbrandName,self.ctypeName,self.cModelName];
            }
        }
        else if (indexPath.row == 1)
        {
            cell.infoField.text = [NSString stringWithFormat:@"%@%@",self.province,self.city];
        }
        else if (indexPath.row == 2)
        {
            cell.infoField.text = [NSString stringWithFormat:@"%@",self.distance];
        }
        else if (indexPath.row == 3)
        {
            cell.infoField.text = self.plateDate;
        }
        else if (indexPath.row == 4)
        {
            cell.infoField.text = self.price;
        }
    }

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 5) {
        WTCCarDescribetionViewController *desController = [[WTCCarDescribetionViewController alloc]init];
        desController.desDelegate = self;
        [self.navigationController pushViewController:desController animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
-(void)saveCarDescribtion:(NSString *)des
{
    self.carDescibetion = des;
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:5 inSection:0];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.returnKeyType = UIReturnKeyDone;
    if (textField.tag == 0) {
        WTCCarCategoryViewController *category = [[WTCCarCategoryViewController alloc]init];
        category.delegate = self;
        [self.navigationController pushViewController:category animated:YES];
        
        return NO;
    }
    else if (textField.tag == 1) {
        [KKAreaPicker showPickerWithTitle:@"省市选择" pickerType:KKAreaPickerTypeProviceCity defaultValue:nil onCancel:^(KKAreaPicker *picker) {
            textField.inputView=picker;
        } onCommit:^(KKAreaPicker *picker, KKAdrress *address) {
            textField.text = [NSString stringWithFormat:@"%@%@",address.provice,address.city];
            self.city = address.city;
            self.province = address.provice;
        }];
        return NO;
    }
    else if (textField.tag == 3)
    {
        [KKDateTimePicker showPickerWithTitle:@"选择日期" pickerMode:UIDatePickerModeDate defaultValue:nil onCancel:^(KKDateTimePicker *picker) {
            textField.inputView=picker;
        } onCommit:^(KKDateTimePicker *picker, NSDate *selectedDate) {
        
            textField.text = [self dateToString:selectedDate];
            self.plateDate = textField.text;
        }];
        return NO;
    }
    else
    {
        return YES;
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
        [theTextField resignFirstResponder];
    return YES;
}
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

-(IBAction)commit:(id)sender{
    
//    self.selectModel.name = @"";
//    self.selectBrand.name = @"";
//    self.selectType.name = @"";
//    [self.imageArray removeAllObjects];
//    [urlImageArr removeAllObjects];
//    self.plateDate = @"";
//    self.carDescibetion = @"";
//    self.province = @"";
//    self.city = @"";
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];

    if (self.editeStatus == 0) {
        if ([self.selectModel.name isEqualToString:@""] || [self.selectBrand.name isEqualToString:@""] || [self.selectType.name isEqualToString:@""] || self.imageArray.count == 0 || urlImageArr.count == 0 || [self.plateDate isEqualToString:@""] || [self.carDescibetion isEqualToString:@""] || [self.province isEqualToString:@""] || [self.city isEqualToString:@""] ) {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
            
            // Set the text mode to show only text.
            hud.mode = MBProgressHUDModeText;
            hud.label.text = @"选项不能为空";
            // Move to bottm center.
            hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
            
            [hud hideAnimated:YES afterDelay:3.f];
            
            return;
        }
        
        
        
        
        NSMutableArray *picArr = [NSMutableArray arrayWithArray:urlImageArr];
        
        NSString *headPic;
        if (picArr.count > 0) {
            headPic = [picArr objectAtIndex:0];
            [picArr removeObjectAtIndex:0];
        }
        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:2 inSection:0];
        
        WTCAddCarTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        int distance = [cell.infoField.text intValue];
        NSIndexPath *indexPath2=[NSIndexPath indexPathForRow:4 inSection:0];
        WTCAddCarTableViewCell *cell2 = [self.tableView cellForRowAtIndexPath:indexPath2];
        NSString *price = cell2.infoField.text;
        [self setBusyIndicatorVisible:YES];
        WTCPublishCarRequest *request = [[WTCPublishCarRequest alloc] initWithToken:loginToken CBrand:self.selectBrand.name CModel:self.selectModel.name Ctype:self.selectType.name City:self.city FirstUpTime:self.plateDate HeaderPic:headPic Miles:[NSNumber numberWithInt:distance] PicList:picArr Price:price Product_descr:self.carDescibetion Province:self.province successCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            WTCAddCarSuccessViewController *success = [[WTCAddCarSuccessViewController alloc]init];
            [self presentViewController:success animated:YES completion:nil];
            self.selectModel.name = @"";
            self.selectBrand.name = @"";
            self.selectType.name = @"";
            [self.imageArray removeAllObjects];
            [urlImageArr removeAllObjects];
            self.plateDate = @"";
            self.carDescibetion = @"";
            self.province = @"";
            self.city = @"";
        } failureCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            [self handleResponseError:self request:request treatErrorAsUnknown:YES];
        }];
        [request start];

    }
    else
    {
        NSString *brand;
        if (self.selectBrand==nil) {
            brand = self.cbrandName;
        }
        else
        {
            brand = self.selectBrand.name;
        }
        NSString *model;
        if (self.selectModel == nil) {
            model = self.cModelName;
        }
        else
        {
            model = self.selectModel.name;
        }
        NSString *type;
        if (self.selectType == nil) {
            type = self.ctypeName;
        }
        else
        {
            type =self.selectType.name;
        }
        NSMutableArray *picArr = [NSMutableArray arrayWithArray:urlImageArr];
        
        NSString *headPic;
        if (picArr.count > 0) {
            headPic = [picArr objectAtIndex:0];
            [picArr removeObjectAtIndex:0];
        }
        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:2 inSection:0];
        
        WTCAddCarTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        int distance = [cell.infoField.text intValue];
        NSIndexPath *indexPath2=[NSIndexPath indexPathForRow:4 inSection:0];
        WTCAddCarTableViewCell *cell2 = [self.tableView cellForRowAtIndexPath:indexPath2];
        NSString *price = cell2.infoField.text;
        [self setBusyIndicatorVisible:YES];
        WTCarUpdataCarInfo *request = [[WTCarUpdataCarInfo alloc]initWithToken:loginToken CBrand:brand CModel:model Ctype:type City:self.city FirstUpTime:self.plateDate HeaderPic:headPic Miles:[NSNumber numberWithInt:distance] PicList:picArr Price:price Product_descr:self.carDescibetion Province:self.province Sid:self.sid ModifyId:self.carDetailId successCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            [self getCarDetailInfo];
        } failureCallback:^(WTCarBaseRequest *request) {
            [self setBusyIndicatorVisible:NO];
            [self handleResponseError:self request:request treatErrorAsUnknown:NO];
        }];
        [request start];
    }
    
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
#pragma mark-选择车系回调方法
-(void)selectBrand:(WTCCarBrand *)brand type:(WTCCarType *)type Model:(WTCCarModel *)model
{
    
    self.selectModel = model;
    self.selectType = type;
    self.selectBrand = brand;
    
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    
    
}

@end
