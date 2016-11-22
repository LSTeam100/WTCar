//
//  WTCDetialAddressViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTCBaseViewController.h"
@interface WTCDetialAddressViewController : WTCBaseViewController<UITextFieldDelegate>
- (IBAction)SaveDetialAddressButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *AddressTextField;
@property (weak, nonatomic) IBOutlet UITextField *DetialAddressTextField;
@property(nonatomic,strong)NSString *province;
@property(nonatomic,strong)NSString *city;
@property(nonatomic,strong)NSString *detailAdress;


@end
