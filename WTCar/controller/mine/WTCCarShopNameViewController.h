//
//  WTCCarShopNameViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTCCarShopNameViewController : UIViewController
- (IBAction)SaveCarShopNameButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *ShopNameTextField;
- (IBAction)DeleShopNameButtonClick:(id)sender;

@end
