//
//  ShopSettingView.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopSettingView : UIView
//店主名字
@property (weak, nonatomic) IBOutlet UILabel *ShopOwenerNameLabel;
//店主手机号
@property (weak, nonatomic) IBOutlet UILabel *ShopOwenerTeleNumLabel;
//店铺地址
@property (weak, nonatomic) IBOutlet UILabel *ShopAddressLabel;

@end
