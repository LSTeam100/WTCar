//
//  LoanDetailTableViewCell.h
//  WTCar
//
//  Created by MacBookPro on 2016/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoanDetailTableViewCell : UITableViewCell
//配资资金
@property (weak, nonatomic) IBOutlet UILabel *LoanMoneyLabel;
//配资状态
@property (weak, nonatomic) IBOutlet UILabel *LoanStateLabel;
//配资时间
@property (weak, nonatomic) IBOutlet UILabel *LoanTimeLabel;

@end
