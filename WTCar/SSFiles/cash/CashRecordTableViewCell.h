//
//  CashRecordTableViewCell.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CashRecordTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cashNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *cashMoneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *cashStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *cashTimeLabel;

@end
