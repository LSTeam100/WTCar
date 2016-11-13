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
#import "WTCImageUploadRequest.h"
#import "CommonVar.h"
#import "TFFileUploadManager.h"

@interface WTCMyDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,UIImagePickerControllerDelegate,RSKImageCropViewControllerDelegate>
{
    CGFloat cellHeight;
}
@property (nonatomic,strong)NSArray *cellFirTextArray;
@property (nonatomic,strong)NSArray *cellSecTextArray;
@property (nonatomic,strong)UITableView *myDetialTableView;
@property(nonatomic,strong)UIImage *photoImage;
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
    if (self.photoImage) {
        [cell.headBtn setImage:self.photoImage forState:UIControlStateNormal];
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
            [self.navigationController pushViewController:usernameViewCon animated:YES];
        }else if (indexPath.row == 2){
            WTCUserTeleNumViewController*userTeleViewCon = [WTCUserTeleNumViewController new];
            [self.navigationController pushViewController:userTeleViewCon animated:YES];
            
        }
    } else if (indexPath.section == 1){
         if (indexPath.row == 0){
            WTCCarShopNameViewController*carshopNameViewCon = [WTCCarShopNameViewController new];
            [self.navigationController pushViewController:carshopNameViewCon animated:YES];
            
        }else if (indexPath.row == 1){
            WTCDetialAddressViewController*detailAddressViewCon = [WTCDetialAddressViewController new];
            [self.navigationController pushViewController:detailAddressViewCon animated:YES];
            
        }else if (indexPath.row == 2){
            WTCCarShopIntroductionViewController*carIntroViewCon = [WTCCarShopIntroductionViewController new];
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
    NSString* url=[BaseAddress stringByAppendingString:@"/upload.do"];
    NSData *data = UIImageJPEGRepresentation(image,1.0);
    
//    NSString* url = @"https://upload.api.weibo.com/2/statuses/upload.json";
//    NSString* content = _textField.text;
    
//    NSString* filepath = [[NSBundle mainBundle]pathForResource:@"1" ofType:@"jpg"];
    
//    NSDictionary* param = @{@"access_token":_access_token,@"status":content,@"source":@"2582981980"};
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistFilePath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"123.jpg"]];
   bool ret = [data writeToFile:plistFilePath atomically:YES];

    if (ret) {
        NSLog(@"plistFilePath=%@",plistFilePath);
    }
    
    
    NSDictionary *param = @{};
    [self setBusyIndicatorVisible:YES];
    [[TFFileUploadManager shareInstance] uploadFileWithURL:url params:param fileKey:@"file" filePath:plistFilePath completeHander:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        [self setBusyIndicatorVisible:NO];
        if (connectionError) {
            NSLog(@"请求出错 %@",connectionError);
        }else{
            NSLog(@"请求返回：\n%@",response);
        }
    }];

    
//    NSMutableURLRequest *req=[[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
//    
//    NSMutableData *postData = [[NSMutableData alloc]init];
    //请求体数据
    
    
    
    
    
    
    
    //文件部分
//    NSString *filename = [filePath lastPathComponent];
//    NSString *contentType = AFContentTypeForPathExtension([filePath pathExtension]);
//    
//    NSString *filePair = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\"; filename=\"%@\";Content-Type=%@\r\n\r\n",boundary,fileKey,filename,contentType];
//    [postData appendData:[filePair dataUsingEncoding:NSUTF8StringEncoding]];
//    [postData appendData:fileData]; //加入文件的数据
//    
//    //设置请求体
//    [postData appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    request.HTTPBody = postData;
//    //设置请求头总数据长度
//    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)postData.length] forHTTPHeaderField:@"Content-Length"];
    
    
    
    
    
//    [req setValue:@"image/jpeg" forHTTPHeaderField:@"Content-Type"];
//    [req setValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@",data] forHTTPHeaderField:@"Content-Type"];

    
    
    
    

//    [req setHTTPMethod:@"POST"];
//    [req setHTTPBody:data];
    
    
    //创建请求对象
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //创建session对象
//    NSURLSession * session =  [NSURLSession sharedSession];
//    //添加任务
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable connectionError) {
//        if (connectionError) {
//            NSLog(@"connectionError=%@",connectionError);
//        }
//        
//        if(data)
//        {
//            NSLog(@"data=%@",data);
//        }
//        
//    }];
//    //开始任务
//    [dataTask resume];
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setURL:[NSURL URLWithString:url]];
//    [request setHTTPMethod:@"POST"];
//    NSMutableData *body = [NSMutableData data];
//    
//    //设置表单项分隔符
//    NSString *boundary = @"---------------------------14737809831466499882746641449";
//    
//    //设置内容类型
//    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
//    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
//    
//    //写入图片的内容
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"PIC_DATA1.jpg\"\r\n",@"PIC_DATA1"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    
////    [body appendData:[infoDic objectForKey:@"PIC_DATA1"]];
//    [body appendData:imageData];
//    [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    //写入INFO的内容
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",@"PIC_INFO"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:imageData];
//    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    //写入尾部内容
//    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [request setHTTPBody:body];
//    
//    NSHTTPURLResponse *urlResponese = nil;
//    NSError *error = [[NSError alloc]init];
//    
//    
//    NSData* resultData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponese error:&error];
    
    
//    NSURLSession *session = [[NSURLSession alloc]init];
//    [session uploadTaskWithRequest:request fromData:imageData];
    
//    [session uploadTaskWithRequest:request fromData:imageData completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"response=%@",response);
//    }];
    
//    NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableLeaves error:nil];
//    NSLog(@"responseDic=%@",responseDic);
//    WTCImageUploadRequest *request = [[WTCImageUploadRequest alloc]init];
//    
//    NSData *imageData = UIImagePNGRepresentation(image);
//    [self setBusyIndicatorVisible:YES];
//    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
//
//    [self setBusyIndicatorVisible:YES];
//    [request imageUpload:loginToken PhotoName:@"profile" ImageUrl:url ImageData:imageData Success:^(WTCarBaseRequest *request) {
//        [self setBusyIndicatorVisible:NO];
//        NSLog(@"response = %@",request.getResponse);
//    } failureCallback:^(WTCarBaseRequest *request) {
//        [self setBusyIndicatorVisible:NO];
//        NSLog(@"response = %@",request.getResponse);
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
