//
//  WTCMyDetailViewController.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTCMineDetailHeadTableViewCell.h"
#import "WTCBaseViewController.h"
@interface WTCMyDetailViewController : WTCBaseViewController
@property (weak, nonatomic) IBOutlet UIButton *NameVerityButton;
@property (weak, nonatomic) IBOutlet UIButton *BusinessVerityButton;
@property(nonatomic,strong) NSString *merchantAddress;
@property(nonatomic,strong) NSString *merchantDescr;
@property(nonatomic,strong) NSString *merchantImage_path;
@property(nonatomic,strong) NSString *merchantName;
@property(nonatomic,strong) NSString *mobile;
@property(nonatomic,strong) NSString *nick;
@property(nonatomic,strong) NSString *realName;
@property(nonatomic,strong) NSString *headPortraitPath;
@end
