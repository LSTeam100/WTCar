//
//  WTCMineDetailViewController.m
//  WTCar
//
//  Created by apple on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCMineDetailViewController.h"
#import "HeadPhotoTableViewCell.h"
#import "AuthenticationTableViewCell.h"
#import "WTCMineDetailInfoTableViewCell.h"
#import "WTCMineDetailHeadTableViewCell.h"
#import "RSKImageCropViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "UPMImageHelper.h"

@interface WTCMineDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,RSKImageCropViewControllerDelegate>
@property(nonatomic,weak)IBOutlet UITableView *tableView;
@property(nonatomic,strong)UIImage *selectImage;
@end

@implementation WTCMineDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的资料";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100;
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            return 80;
        }
        else
        {
            return 40;
        }

    }
    else
    {
        return 40;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else {
        return 3;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return  [self getAuthenInfo:tableView AtIndex:indexPath];
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0) {
           return [self getDetailInfo:tableView AtIndex:indexPath];
        }
        else
        {
            return [self getHeadInfo:tableView AtIndex:indexPath];
        }
    }
    else  {
        return [self getHeadInfo:tableView AtIndex:indexPath];
    }

}
-(UITableViewCell *)getDetailInfo:(UITableView *)tableView AtIndex:(NSIndexPath *)indexPath{
    static NSString *identifer = @"detailHeadCell";
    WTCMineDetailHeadTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        NSArray *cellArr = [[NSBundle mainBundle]loadNibNamed:@"WTCMineDetailHeadTableViewCell" owner:self options:nil];
        cell = [cellArr objectAtIndex:0];
        [cell.headBtn addTarget:self action:@selector(updateMyPhoto) forControlEvents:UIControlEventTouchUpInside];
        }
    if (self.selectImage) {
        [cell.headBtn setBackgroundImage:self.selectImage forState:UIControlStateNormal];
        
    }

    return cell;
}
-(UITableViewCell *)getHeadInfo:(UITableView *)tableView AtIndex:(NSIndexPath *)indexPath{
    static NSString *identifer = @"WTCMineDetailInfoTableViewCell";
    WTCMineDetailInfoTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        NSArray *cellArr = [[NSBundle mainBundle]loadNibNamed:@"WTCMineDetailInfoTableViewCell" owner:self options:nil];
        cell = [cellArr objectAtIndex:0];
    }
    return cell;
}
-(void)updateMyPhoto
{
    UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:@"头像来源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选择", nil];
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];

}

-(UITableViewCell *)getAuthenInfo:(UITableView *)tableView AtIndex:(NSIndexPath *)indexPath{
    static NSString *identifer = @"authenCell";
    AuthenticationTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        NSArray *cellArr = [[NSBundle mainBundle]loadNibNamed:@"AuthenticationTableViewCell" owner:self options:nil];
        cell = [cellArr objectAtIndex:0];
    }
    return cell;
}



#pragma mark -- RSKImageCropperDelegate

/**
 Tells the delegate that the original image has been cropped. Additionally provides a crop rect used to produce image.
 */
- (void)imageCropViewController:(RSKImageCropViewController *)controller didCropImage:(UIImage *)croppedImage usingCropRect:(CGRect)cropRect{
    [self.navigationController popViewControllerAnimated:YES];
    [self performSelector:@selector(updateImage:) withObject:croppedImage afterDelay:1];
}

-(void)imageCropViewControllerDidCancelCrop:(RSKImageCropViewController *)controller
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- updateAvatar related

-(void)updateImage:(id)image{
    
    if (image) {
        self.selectImage = image;
        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];

    }
    
//    [self setBusyIndicatorVisible:YES];
//    UIImage *compressImage=[UPMImageHelper compressImageWithImage:image];
//    NSString *fileName=[NSString stringWithFormat:@"%lld_avatar.jpg",_profile.idAccount];
//    UPMPrepareUploadRequest *request=[[UPMPrepareUploadRequest alloc]initWithSessionId:getSessionId()
//                                                                              fileName:fileName
//                                                                       successCallback:^(UPMBaseRequest *request) {
//                                                                           [self setBusyIndicatorVisible:NO];
//                                                                           UPMUploadPrepareModel *model=[request getResponse].data;
//                                                                           NSString *itemKey=model.itemKey;
//                                                                           NSString *token=model.uploadCode;
//                                                                           long long imageId=model.idItem;
//                                                                           [self uploadImage:compressImage
//                                                                                         key:itemKey
//                                                                                       token:token
//                                                                                     imageId:imageId
//                                                                            ];
//                                                                       }
//                                                                       failureCallback:^(UPMBaseRequest *request) {
//                                                                           [self setBusyIndicatorVisible:NO];
//                                                                           [self handleResponseError:self request:request treatErrorAsUnknown:YES];
//                                                                       }];
//    
//    [request start];
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

-(void)uploadImage:(UIImage *)image key:(NSString *)key token:(NSString *)token imageId:(long long)imageId{
//    [self setBusyIndicatorVisible:YES];
//    QNUploadManager *manager=[[UPMQiniuHelper sharedInstance]uploadManager];
//    NSData *data=UIImageJPEGRepresentation(image, 1.0);
//    [manager putData:data key:key token:token complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
//        [self setBusyIndicatorVisible:NO];
//        if(info.isOK){
//            [self updateAvatarToServer:imageId image:image];
//        }else{
//            [self showDefaultFailureMessage];
//        }
//    } option:nil];
    
}

-(void)updateAvatarToServer:(long long)imageId image:(UIImage *)image{
//    [self setBusyIndicatorVisible:YES];
//    UPMAvatarUpdateRequest *request=[[UPMAvatarUpdateRequest alloc]initWithSessionId:getSessionId()
//                                                                             imageId:imageId
//                                                                     successCallback:^(UPMBaseRequest *request) {
//                                                                         [self setBusyIndicatorVisible:NO];
//                                                                         [self.imgAvatar setImage:image];
//                                                                     }
//                                                                     failureCallback:^(UPMBaseRequest *request) {
//                                                                         [self setBusyIndicatorVisible:NO];
//                                                                         [self handleResponseError:self request:request treatErrorAsUnknown:YES];
//                                                                     }];
//    
//    [request start];
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
