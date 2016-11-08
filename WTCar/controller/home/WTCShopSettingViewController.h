//
//  WTCShopSettingViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WTCBaseViewController.h"
#import "define.h"
@interface WTCShopSettingViewController : WTCBaseViewController
//编辑个人信息按钮
- (IBAction)editeShopInfoButtonClick:(id)sender;
//店铺页面的图片
@property (weak, nonatomic) IBOutlet UIImageView *mainShopImageView;
//修改店铺页面图片
@property (weak, nonatomic) IBOutlet UIButton *editShopImageButton;
@property (weak, nonatomic) IBOutlet UILabel *SeccondLabel;
@property (weak, nonatomic) IBOutlet UIView *shopSettingContentView;


@end
