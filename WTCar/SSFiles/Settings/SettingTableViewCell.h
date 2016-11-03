//
//  SettingTableViewCell.h
//  WTCar
//
//  Created by MacBookPro on 2016/10/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingTableViewCell : UITableViewCell

//cell的名字
@property (weak, nonatomic) IBOutlet UILabel *SettingLabel;
//cell的指示箭头
@property (weak, nonatomic) IBOutlet UIImageView *BackIconImageView;

@end
