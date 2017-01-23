//
//  WTCBusinessVerityViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBusinessVerityViewController.h"
#import "WTCApplyBusinessLicenseResult.h"
#import "WTCApplyBusinessLicenseRequest.h"
#import "MBProgressHUD.h"
#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "RSKImageCropper.h"
#import "WTCProfileImageUploadRequest.h"
#import "UPMImageHelper.h"
#import "CommonVar.h"
@interface WTCBusinessVerityViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate>
@end

@implementation WTCBusinessVerityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:247/255.0f blue:245/255.0f alpha:1];
    self.title = @"商家认证";
    
    [self.shopImageView sd_setImageWithURL:[NSURL URLWithString:self.uploadLicenseUrl] placeholderImage:[UIImage imageNamed:@"WTCAddCar_add"]];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)ConfirmBusinessButtonClick:(id)sender {
    NSString *applyNameToken = [[CommonVar sharedInstance] getLoginToken];
    NSString *licencePath = self.uploadLicenseUrl;
    [self setBusyIndicatorVisible:YES];
    WTCApplyBusinessLicenseRequest *request = [[WTCApplyBusinessLicenseRequest alloc]initWithLicencePath:licencePath Token:applyNameToken successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [[CommonVar sharedInstance] showMessage:@"认证成功" ShowController:self];
        [self performSelector:@selector(back) withObject:nil afterDelay:3];
        
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self handleResponseError:self request:request treatErrorAsUnknown:YES];
    }];
    [request start];

}

- (IBAction)VeritylicencePicButtonClick:(id)sender {
    [self updateImageView];
}

#pragma mark-替换图片

-(void)updateImageView
{
    UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:@"图片来源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选择", nil];
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
    
    [self performSelector:@selector(updateImage:) withObject:baseImage afterDelay:1];

//    RSKImageCropViewController *imageCropVC=[[RSKImageCropViewController alloc]initWithImage:baseImage cropMode:RSKImageCropModeCircle];
//    //此属性必须设置，否则返回矩形图
//    imageCropVC.applyMaskToCroppedImage=YES;
//    imageCropVC.delegate=self;
//    [self.navigationController pushViewController:imageCropVC animated:YES];
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
//    self.photoImage = compressImage;
//    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
//    [self.myDetialTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    
    [self imageUploadRequest:compressImage];
    
}
-(void)imageUploadRequest:(UIImage *)image
{
    //    NSString* url=[BaseAddress stringByAppendingString:@"/upload.do"];
    NSData *data = UIImageJPEGRepresentation(image,1.0);
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *profilePath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"license.jpg"]];
    bool ret = [data writeToFile:profilePath atomically:YES];
    
    if (ret) {
        NSLog(@"plistFilePath=%@",profilePath);
    }
    
    NSDictionary *param = @{};
    [self setBusyIndicatorVisible:YES];
    WTCProfileImageUploadRequest *request = [[WTCProfileImageUploadRequest alloc]init];
    [request WTCUploadFileWith:param fileKey:@"file" filePath:profilePath SuccessCallbackBlock:^(NSData *data, NSURLResponse *respose) {
        [self setBusyIndicatorVisible:NO];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSString *urlStr = [dic objectForKey:@"data"];
        [self.shopImageView setImage:image];
        self.uploadLicenseUrl = urlStr;

    } FailCallbackBlock:^(NSError *error, NSURLResponse *response) {
        [self setBusyIndicatorVisible:NO];
    }];
    

    
    
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
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

@end
