//
//  WTCMyDetailViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCMyDetailViewController.h"
#import "WTCMineViewTableViewCell.h"
#import "WTCPeoNameVerityViewController.h"
#import "WTCBusinessVerityViewController.h"
#import "WTCUserNameViewController.h"
#import "WTCUserTeleNumViewController.h"
#import "WTCCarShopNameViewController.h"
#import "WTCDetialAddressViewController.h"
#import "WTCCarShopIntroductionViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "RSKImageCropViewController.h"
#import "UPMImageHelper.h"
#import <AVFoundation/AVFoundation.h>
#import "CommonVar.h"
#import "TFFileUploadManager.h"
#import "WTCProfileImageUploadRequest.h"
//#import "WTCChangeShopInfoRequest.h"
//#import "WTCChangeShopInfoResult.h"
#import "MBProgressHUD.h"
#import "WTCGetUserInfoResult.h"
#import "WTCGetUserInfoRequest.h"
#import "WTCPortratUploadRequest.h"
#import "WTCUserInfoRequest.h"
@interface WTCMyDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,UIImagePickerControllerDelegate,RSKImageCropViewControllerDelegate>
{
    CGFloat cellHeight;
}
@property (nonatomic,strong)NSArray *cellFirTextArray;
@property (nonatomic,strong)NSArray *cellSecTextArray;
@property (nonatomic,strong)UITableView *myDetialTableView;
@property(nonatomic,strong)UIImage *photoImage;
@property(nonatomic,strong)WTCGetUserInfoResult *userInfoResult;

@end

@implementation WTCMyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:247/255.0f blue:245/255.0f alpha:1];
    [_NameVerityButton addTarget:self action:@selector(NameVerityClick) forControlEvents:UIControlEventTouchUpInside];
    [_BusinessVerityButton addTarget:self action:@selector(businessVerityClick) forControlEvents:UIControlEventTouchUpInside];
    self.title = @"我的资料";
    [self dataInit];
    [self makeTableView];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated
{
//    [self getAccountInfo];
    [self getUserBaseInfo];
}
//获取账户信息
-(void)getAccountInfo{
    NSString *getAccountInfoToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCGetUserInfoRequest *request = [[WTCGetUserInfoRequest alloc]initWithToken:getAccountInfoToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        
        WTCGetUserInfoResult *getUserInfoResult = [request getResponse].data;
        _realName = getUserInfoResult.realName;
        _mobile = getUserInfoResult.mobile;
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];
}
-(void)getUserBaseInfo
{
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    [self setBusyIndicatorVisible:YES];
    WTCUserInfoRequest *request = [[WTCUserInfoRequest alloc]initWithToken:loginToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        WTCGetUserInfoResult *result = [request getResponse].data;
        self.userInfoResult = result;
        //        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
        //        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
        [self.myDetialTableView reloadData];
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:NO];
    }];
    [request start];
    
}
-(void)dataInit{
        _cellFirTextArray = @[@"头像",@"用户名",@"手机号",@"车行名称",@"详细地址",@"车行介绍"];
    _cellSecTextArray = @[@"",@"苗刚",@"18732166582",@"",@"",@"未填写"];
    cellHeight = 42;
}

-(void)makeTableView{
    _myDetialTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 215+20,SCREEN_WIDTH, cellHeight*9) style:UITableViewStylePlain];
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
    return 3;
//    if (section == 0) {
//        return 3;
//    } else  {
//        return 3;
//    }
//    return 1;
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
    
    if (indexPath.section == 0 && indexPath.row == 0) {
      return  [self getHeadPhoto:tableView AtIndex:indexPath];
    }
    else
    {
        WTCMineViewTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"WTCMineViewTableViewCell" owner:nil options:nil][0];
        [_myDetialTableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
        
        _myDetialTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [cell.contentView setBackgroundColor:[UIColor whiteColor]];
        if (indexPath.section==0) {
//            NSLog(@"row=%ld",(long)indexPath.row);
            cell.mineDataLabel.text = _cellFirTextArray[indexPath.row];
            if (indexPath.row == 1) {
//                NSLog(@"nick=%@",self.userInfoResult.nick);
//                NSLog(@"mobile=%@",self.userInfoResult.mobile);
                cell.detailLabel.text = self.userInfoResult.nick;
            }
            else
            {
                cell.detailLabel.text = self.userInfoResult.mobile;

            }
        }else{
            cell.mineDataLabel.text = _cellFirTextArray[indexPath.row+3];
            if (indexPath.row == 0) {
                cell.detailLabel.text =self.userInfoResult.merchantName;
            }
            else if (indexPath.row == 1)
            {
                cell.detailLabel.text = self.userInfoResult.merchantAddress;
            }
            else
            {
                cell.detailLabel.text = self.userInfoResult.merchantDescr;

            }
        }
        
        if (!IOS9_OR_LATER) {
            cell.mineDataLabel.font = [UIFont boldSystemFontOfSize:15];
            cell.detailLabel.font = [UIFont boldSystemFontOfSize:15];
        }
//        if (indexPath.section == 0) {
//            
//            if (indexPath.row == 0) {
//                UIImage *image = [UIImage imageNamed:@"交通示意图"];
//                CGFloat width = 68;
//                CGFloat height = 68;
//                UIImageView *PeoPicImage = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-width-30)/2, 31, width, height)];
//                PeoPicImage.image = image;
//                PeoPicImage.backgroundColor = [UIColor clearColor];
//            }else if (indexPath.row == 1){
//                
//            }else if (indexPath.row == 2){
//                
//            }
//        }else{
//            if (indexPath.row == 0) {
//                
//            }else if (indexPath.row ==1)
//            {
//                
//            }else if (indexPath.row == 2){
//                
//            }
//        }
        return cell;

    }
}
-(UITableViewCell *)getHeadPhoto:(UITableView *)tableView AtIndex:(NSIndexPath *)atIndex
{
    static NSString *indeifer = @"myHeadCell";
    WTCMineDetailHeadTableViewCell * cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:indeifer];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"WTCMineDetailHeadTableViewCell" owner:self options:nil]objectAtIndex:0];
        [cell.headBtn addTarget:self action:@selector(updateImageView) forControlEvents:UIControlEventTouchUpInside];

    }
    if (self.userInfoResult) {
        [cell.headImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.userInfoResult.headPortraitPath]] placeholderImage:[UIImage imageNamed:@"mine_user"]];
    }
    else
    {
//        [cell.headBtn setImage:[UIImage imageNamed:@"mine_user"] forState:UIControlStateNormal];
        [cell.headImageView setImage:[UIImage imageNamed:@"mine_user"]];
    }
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1;
    }
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* myView = [[UIView alloc] init];
    myView.backgroundColor = [UIColor colorWithRed:244/255.0f green:247/255.0f blue:245/255.0f alpha:1];
    return myView;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
        }else if (indexPath.row == 1){
            WTCUserNameViewController*usernameViewCon = [WTCUserNameViewController new];
            usernameViewCon.realName = self.userInfoResult.nick;
            [self.navigationController pushViewController:usernameViewCon animated:YES];
        }else if (indexPath.row == 2){
            WTCUserTeleNumViewController*userTeleViewCon = [WTCUserTeleNumViewController new];
            userTeleViewCon.telePhone = self.userInfoResult.mobile;
            [self.navigationController pushViewController:userTeleViewCon animated:YES];
            
        }
    } else if (indexPath.section == 1){
         if (indexPath.row == 0){
            WTCCarShopNameViewController*carshopNameViewCon = [WTCCarShopNameViewController new];
             carshopNameViewCon.shopName = self.userInfoResult.merchantName;
            [self.navigationController pushViewController:carshopNameViewCon animated:YES];
            
        }else if (indexPath.row == 1){
            WTCDetialAddressViewController*detailAddressViewCon = [WTCDetialAddressViewController new];
            detailAddressViewCon.detailAdress = self.userInfoResult.merchantAddress;
            detailAddressViewCon.province = self.userInfoResult.province;
            detailAddressViewCon.city = self.userInfoResult.city;
            [self.navigationController pushViewController:detailAddressViewCon animated:YES];
            
        }else if (indexPath.row == 2){
            WTCCarShopIntroductionViewController*carIntroViewCon = [WTCCarShopIntroductionViewController new];
            carIntroViewCon.shopDes = self.userInfoResult.merchantDescr;
            [self.navigationController pushViewController:carIntroViewCon animated:YES];
            
        }
    }
    
    
}
-(void)NameVerityClick{
    WTCPeoNameVerityViewController *nameVerityViewCon = [WTCPeoNameVerityViewController new];
    [self.navigationController pushViewController:nameVerityViewCon animated:YES];
}
-(void)businessVerityClick{
    WTCBusinessVerityViewController *businessVerityViewCon = [WTCBusinessVerityViewController new];
    [self.navigationController pushViewController:businessVerityViewCon animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark-替换头像

-(void)updateImageView
{
    UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:@"头像来源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选择", nil];
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
}
#pragma mark -- UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
        {
            if(![self checkCameraAcessDenied])
                return;
            
            if(![self checkCameraPermission])
                return;
            
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            UIImagePickerControllerSourceType mediaSourceType = UIImagePickerControllerSourceTypeCamera;
            imagePicker.sourceType = mediaSourceType;
            imagePicker.mediaTypes = @[(NSString*)kUTTypeImage];
            imagePicker.allowsEditing = NO;
            imagePicker.modalPresentationStyle = UIModalPresentationFullScreen;
            imagePicker.delegate = self;
            [self presentViewController:imagePicker animated:YES completion:NULL];
            
            break;
        }
        case 1:{
            if(![self checkPhotoLibraryAcessDenied])
                return;
            
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            UIImagePickerControllerSourceType mediaSourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.sourceType = mediaSourceType;
            imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            imagePicker.allowsEditing = NO;
            imagePicker.modalPresentationStyle = UIModalPresentationFullScreen;
            imagePicker.delegate = self;
            [self presentViewController:imagePicker animated:YES completion:NULL];
            
            break;
        }
        default:
            break;
    }
}

#pragma mark -- UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated: YES completion: ^{}];
    UIImage *baseImage=[info objectForKey:UIImagePickerControllerOriginalImage];
    baseImage=[UPMImageHelper fixImageOrientation:baseImage];
    RSKImageCropViewController *imageCropVC=[[RSKImageCropViewController alloc]initWithImage:baseImage cropMode:RSKImageCropModeCircle];
    //此属性必须设置，否则返回矩形图
    imageCropVC.applyMaskToCroppedImage=YES;
    imageCropVC.delegate=self;
    [self.navigationController pushViewController:imageCropVC animated:YES];
}


#pragma mark -- Check Camera Access

-(BOOL) checkCameraAcessDenied{
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        [self showMessage:@"请在设备的\"设置-通用-访问限制\"中允许访问相机"];
        return NO;
    }
    return YES;
}

- (BOOL)checkCameraPermission{
    NSString* mediaType=AVMediaTypeVideo;
    AVAuthorizationStatus authStatus=[AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus==AVAuthorizationStatusDenied){
        [self showMessage:@"请在设备的\"设置-隐私-相机\"中允许访问相机"];
        return NO;
    }else{
        return YES;
    }
}


#pragma mark -- Check photo library Access

-(BOOL)checkPhotoLibraryAcessDenied{
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        [self showMessage:@"请在设备的\"设置-隐私-照片\"中允许访问照片"];
        return NO;
    }
    return YES;
    
}



#pragma mark -- RSKImageCropperDelegate

/**
 Tells the delegate that the original image has been cropped. Additionally provides a crop rect used to produce image.
 */
- (void)imageCropViewController:(RSKImageCropViewController *)controller didCropImage:(UIImage *)croppedImage usingCropRect:(CGRect)cropRect{
    [self.navigationController popViewControllerAnimated:YES];
    [self performSelector:@selector(updateImage:) withObject:croppedImage afterDelay:1];
}
-(void)updateImage:(id)image{
    UIImage *compressImage=[UPMImageHelper compressImageWithImage:image];
    self.photoImage = compressImage;
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
    [self.myDetialTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    
    [self imageUploadRequest:image];
    
}
-(void)imageUploadRequest:(UIImage *)image
{
//    NSString* url=[BaseAddress stringByAppendingString:@"/upload.do"];
    NSData *data = UIImageJPEGRepresentation(image,1.0);
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *profilePath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"profile.jpg"]];
    bool ret = [data writeToFile:profilePath atomically:YES];

    if (ret) {
        NSLog(@"plistFilePath=%@",profilePath);
    }
    
    
    NSDictionary *param = @{};
    [self setBusyIndicatorVisible:YES];
    WTCPortratUploadRequest *request = [[WTCPortratUploadRequest alloc]init];
    NSString *token = [[CommonVar sharedInstance] getLoginToken];
    [request WTCPortraitUploadFileWithToken:token params:param fileKey:@"file" filePath:profilePath SuccessCallbackBlock:^(NSData *data, NSURLResponse *response) {
                [self setBusyIndicatorVisible:NO];

    } FailCallbackBlock:^(NSError *eror, NSURLResponse *response) {
        [self setBusyIndicatorVisible:NO];
//        [self handleResponseError:self request:request treatErrorAsUnknown:NO];

    }];
     //    WTCPortratUploadRequest *request = [[WTCPortratUploadRequest alloc]init];
//    [request WTCUploadFileWith:param fileKey:@"file" filePath:profilePath SuccessCallbackBlock:^(NSData *data, NSURLResponse *response) {
//        [self setBusyIndicatorVisible:NO];
//    } FailCallbackBlock:^(NSError *data, NSURLResponse *response) {
//        [self setBusyIndicatorVisible:NO];
//    }];
    
    
    
//  TFFileUploadManager *upload = [[TFFileUploadManager alloc] init];
//    [upload WTCUploadFileWithURL:url params:param fileKey:@"file" filePath:profilePath SuccessCallbackBlock:^(NSData *data, NSURLResponse *response) {
//        [self setBusyIndicatorVisible:NO];
//        NSLog(@"data=%@",data);
//    } FailCallbackBlock:^(NSError *error, NSURLResponse *response) {
//        [self setBusyIndicatorVisible:NO];
//        NSLog(@"error=%@",error);
//    }];

    
    
}

-(void)imageCropViewControllerDidCancelCrop:(RSKImageCropViewController *)controller
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)showMessage:(NSString *)message{
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@""
                                                     message:message
                                                    delegate:nil
                                           cancelButtonTitle:@"确定"
                                           otherButtonTitles:nil];
    [alertView show];
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
