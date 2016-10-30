//
//  WTCShopSettingViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTCShopSettingViewController : UIViewController
- (IBAction)editeShopInfoButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *mainShopImageView;
@property (weak, nonatomic) IBOutlet UIButton *editShopImageButton;

@end
