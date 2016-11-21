//
//  WTCDetialAddressViewController.m
//  WTCar
//
//  Created by MacBookPro on 2016/10/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCDetialAddressViewController.h"
#import "KKAreaPicker.h"
#import "WTCModifyStoreInfoRequest.h"
@interface WTCDetialAddressViewController ()

@end

@implementation WTCDetialAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改详细地址";
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:247/255.0f blue:245/255.0f alpha:1];
    self.AddressTextField.text = [NSString stringWithFormat:@"%@%@",self.province,self.city];
    self.DetialAddressTextField.text = [NSString stringWithFormat:@"%@",self.detailAdress];
    self.AddressTextField.tag = 1;
    self.AddressTextField.delegate = self;
    self.DetialAddressTextField.delegate = self;
    self.AddressTextField.returnKeyType = UIReturnKeyDone;
    self.DetialAddressTextField.returnKeyType = UIReturnKeyDone;
    // Do any additional setup after loading the view from its nib.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.DetialAddressTextField resignFirstResponder];
    return YES;
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField.tag == 1) {
        [KKAreaPicker showPickerWithTitle:@"省市选择" pickerType:KKAreaPickerTypeProviceCity defaultValue:nil onCancel:^(KKAreaPicker *picker) {
            textField.inputView=picker;
        } onCommit:^(KKAreaPicker *picker, KKAdrress *address) {
            textField.text = [NSString stringWithFormat:@"%@%@",address.provice,address.city];
            self.city = address.city;
            self.province = address.provice;
        }];
        return NO;

    }
    else
    {
        return YES;
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

- (IBAction)SaveDetialAddressButtonClick:(id)sender {
    
//    NSString*upDataName = self.textView.text;
    if (self.DetialAddressTextField.text.length == 0 || self.AddressTextField.text.length == 0) {
        return;
    }
    NSString *loginToken = [[CommonVar sharedInstance] getLoginToken];
    
    [self setBusyIndicatorVisible:YES];
    NSDictionary *dic = @{@"province":self.province,
                          @"city" : self.city,
                          @"merchantAddress":self.DetialAddressTextField.text};
    WTCModifyStoreInfoRequest *request = [[WTCModifyStoreInfoRequest alloc]initModifyStoreInfo:loginToken DataDic:dic successCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
        [self.navigationController popViewControllerAnimated:YES];
    } failureCallback:^(WTCarBaseRequest *request) {
        [self setBusyIndicatorVisible:NO];
    }];
    [request start];
    
//    if (upDataName.length == 0) {
//        [[CommonVar sharedInstance]showMessage:@"车辆描述不能为空" ShowController:self];
//        return;
//    }
    
//    [self setBusyIndicatorVisible:YES];
//    NSDictionary *dic = @{@"merchantDescr":};
//    WTCModifyStoreInfoRequest *request = [WTCModifyStoreInfoRequest alloc]initModifyStoreInfo:loginToken DataDic:<#(NSDictionary *)#> successCallback:<#^(WTCarBaseRequest *request)success#> failureCallback:<#^(WTCarBaseRequest *request)failed#>
//    WTCModifyStoreInfoRequest *request = [[WTCModifyStoreInfoRequest alloc]initModifyStoreInfo:loginToken UpdataKey:@"merchantDescr" UpdataValue:upDataName successCallback:^(WTCarBaseRequest *request) {
//        [self setBusyIndicatorVisible:NO];
//        [[CommonVar sharedInstance]showMessage:@"修改成功" ShowController:self];
//        [self performSelector:@selector(back) withObject:nil afterDelay:3.0];
//        
//    } failureCallback:^(WTCarBaseRequest *request) {
//        [self setBusyIndicatorVisible:NO];
//        [self handleResponseError:self request:request treatErrorAsUnknown:NO];
//    }];
//    [request start];
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
