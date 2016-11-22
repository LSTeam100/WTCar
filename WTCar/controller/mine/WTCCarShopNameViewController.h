//
//  WTCCarShopNameViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTCBaseViewController.h"
@interface WTCCarShopNameViewController : WTCBaseViewController<UITextFieldDelegate>
- (IBAction)SaveCarShopNameButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *ShopNameTextField;
@property(nonatomic,strong)NSString *shopName;
- (IBAction)DeleShopNameButtonClick:(id)sender;

@end
