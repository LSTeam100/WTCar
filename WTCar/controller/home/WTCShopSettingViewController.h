//
//  WTCShopSettingViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTCShopSettingViewController : UIViewController
//编辑个人信息按钮
- (IBAction)editeShopInfoButtonClick:(id)sender;
//店铺页面的图片
@property (weak, nonatomic) IBOutlet UIImageView *mainShopImageView;
//修改店铺页面图片
@property (weak, nonatomic) IBOutlet UIButton *editShopImageButton;
//店铺介绍框
@property (weak, nonatomic) IBOutlet UITextView *ShopIntroTextView;

@end
