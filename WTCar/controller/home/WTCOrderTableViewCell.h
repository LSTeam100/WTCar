//
//  WTCOrderTableViewCell.h
//  WTCar
//
//  Created by apple on 2016/10/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTCOrderTableViewCell : UITableViewCell
@property(nonatomic,weak)IBOutlet UILabel *orderIDLabel;
@property(nonatomic,weak)IBOutlet UILabel *dateLabel;
@property(nonatomic,weak)IBOutlet UILabel *orderStateLabel;

@end
