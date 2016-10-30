//
//  MoneyInfoTableViewCell.h
//  WTCar
//
//  Created by apple on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoneyInfoTableViewCell : UITableViewCell
@property(nonatomic,weak)IBOutlet UILabel *remainingLabel;
@property(nonatomic,weak)IBOutlet UILabel *reaminingNumLabel;
@property(nonatomic,weak)IBOutlet UILabel *freazingNumLabel;
@property(nonatomic,weak)IBOutlet UILabel *freazingLabel;

@end
